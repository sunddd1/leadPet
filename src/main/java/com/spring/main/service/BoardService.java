package com.spring.main.service;


import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.ReplyDTO;
import com.spring.main.dto.bbs_imgDTO;


@Service
public class BoardService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("#{config['Globals.root']}") String root;
	@Autowired BoardDAO dao;
	


	public HashMap<String, Object> BoardTab(String dog_cat) {
		HashMap<String, String> map = new HashMap<String, String>();
		map.put("dog_cat", dog_cat);
		logger.info("게시판 탭 요청" + map);
		ArrayList<BoardDTO> list = dao.tab(map);
		logger.info("리스트 크기 :{} ",list.size());
		HashMap<String, Object> tab = new HashMap<String, Object>();
		tab.put("tab", list);
		return tab;
	}
	
	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		File dir = new File(root+"Boardupload/");
		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
		String orifileName = file.getOriginalFilename();
		String newfileName = System.currentTimeMillis()+orifileName.substring(orifileName.lastIndexOf("."));
		logger.info(orifileName +"=>"+newfileName);
		
		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get(root+"Boardupload/"+newfileName);
			Files.write(filePath, bytes);
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			fileList.put(newfileName, orifileName);
			logger.info("현재 저장된 파일 수 :"+fileList.size());
			session.setAttribute("fileList", fileList);
			mav.addObject("path","/photo/"+newfileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName("./Board/uploadForm");
		return mav;
	}
	
	
	public ModelAndView writeForm(String id) {
		logger.info("글쓰기 폼 요청");
		ModelAndView mav = new ModelAndView();
		PetDTO dto = dao.writeForm(id);
		logger.info("글쓰기폼 유저정보 : "+dto.getNickname());
		mav.addObject("dto",dto);
		mav.setViewName("Board/writeForm");
		return mav;
	}
	
	
	
	@Transactional
	public ModelAndView write(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page="redirect:/writeForm";
		BoardDTO dto = new BoardDTO();
		dto.setBbs_subject(params.get("bbs_subject"));
		dto.setBbs_content(params.get("bbs_content"));
		dto.setNickname(params.get("nickname"));
		dto.setCategory_name(params.get("category_name"));
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		if(dao.write(dto)>0) {
			logger.info("idx : "+dto.getBbs_idx());
			logger.info("fileList.size : " , fileList.size());
			if(fileList.size()>0) {
				/*
				 * for(String key : fileList.keySet()) {
				 * dao.writeFile(key,fileList.get(key),dto.getBbs_idx()); }
				 */
				ArrayList<String> keyArr = new ArrayList<String>();
				for(String key : fileList.keySet()) {
					keyArr.add(key);
				}
				dao.writeFile(keyArr.get(0),fileList.get(keyArr.get(0)),dto.getBbs_idx());
				logger.info("keyArray0.. {}",keyArr.get(0));
				//	keyArr.get() -> newfilename 			
				if(fileList.size()>1) { 
					for (int i = 1; i < fileList.size(); i++) {
						dao.writeContentFile(keyArr.get(i),fileList.get(keyArr.get(i)),dto.getBbs_idx()); 
					}
				}
			}
			page="/Board/Experience";
		}else {
			for(String newFileName : fileList.keySet()) {
				File file = new File(root+"Boardupload/"+newFileName);
				file.delete();
			}
		}
		session.removeAttribute("fileList");
		mav.setViewName(page);	
		return mav;
	}

	public HashMap<String, Object> fileDelete(String newfileName, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		File delFile = new File(root+"BoardUpload/"+newfileName);
		int success = 1;
		
		try {
			logger.info("삭제 이미지 : " + delFile);
			if(delFile.exists()) {
				delFile.delete();
			}else {
				logger.info("이미 삭제된파일");
			}
			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
			if(fileList.get(newfileName)!=null) {
				fileList.remove(newfileName);
				logger.info("삭제 후 남은 이미지 갯수 : " + fileList.size());
				dao.deletefile(newfileName);
				dao.deleteContentFile(newfileName);
			}
			session.setAttribute("fileList", fileList);
		} catch (Exception e) {
			success=0;
		}finally {
			map.put("success", success);
		}
		return map;
	}
	
	@Transactional
	public ModelAndView BoardDetail(String bbs_idx) {
		dao.upViews(bbs_idx);
		logger.info("조회수 +1");
		BoardDTO dto = dao.boardDetail(bbs_idx);
		logger.info("{}",dto);
		logger.info("{}",dto.getPet_newfilename());
		logger.info("{}",dto.getKg());
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("Board/detail");		
		return mav;
	}
	
	public ModelAndView BoardUpdateForm(String bbs_idx) {
		BoardDTO dto = dao.BoardUpdateForm(bbs_idx);
		logger.info("{}",dto);
		ModelAndView mav = new ModelAndView();
		mav.addObject("dto", dto);
		mav.setViewName("Board/BoardUpdateForm");		
		return mav;
	}
	
	@Transactional
	public ModelAndView BoardUpdate(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page="redirect:/BoardUpdateForm";
		BoardDTO dto = new BoardDTO();
		dto.setBbs_idx(Integer.parseInt(params.get("bbs_idx")));
		dto.setBbs_subject(params.get("bbs_subject"));
		dto.setBbs_content(params.get("bbs_content"));
		dto.setNickname(params.get("nickname"));
		dto.setCategory_name(params.get("category_name"));
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		
		if(dao.BoardUpdate(dto)>0) {
			logger.info("idx : "+dto.getBbs_idx());
			if(fileList.size()>0) {
				/*
				 * for(String key : fileList.keySet()) {
				 * dao.writeFile(key,fileList.get(key),dto.getBbs_idx()); }
				 */
				ArrayList<String> keyArr = new ArrayList<String>();
				for(String key : fileList.keySet()) {
					keyArr.add(key);
				}
					dao.writeFile(keyArr.get(0),fileList.get(keyArr.get(0)),dto.getBbs_idx());
					logger.info("keyArray0.. {}",keyArr.get(0));
					//	keyArr.get() -> newfilename 			
					if(fileList.size()>1) { 
						for (int i = 1; i < fileList.size(); i++) {
							dao.writeContentFile(keyArr.get(i),fileList.get(keyArr.get(i)),dto.getBbs_idx()); 
						}
					}
			}
			page="redirect:/BoardList";
			
		}else {
			for(String newFileName : fileList.keySet()) {
				File file = new File(root+"Boardupload/"+newFileName);
				file.delete();
			}
		}
		session.removeAttribute("fileList");
		mav.setViewName(page);	
		return mav;
	}
	

	public Boolean recoConfirm(String id, String bbs_idx) {
		boolean success = false;
		logger.info("추천 여부 확인 요청");
		HashMap<String, Object> map = dao.recoConfirm(id,bbs_idx);
		logger.info("추천확인 : " + map);
		if(map != null) {
			success = true;
		}
		return success;
	}

	public Boolean recoUp(String id, String bbs_idx) {
		boolean success = false;
		logger.info("추천 추가 요청");
		int add = dao.recoTableUp(id,bbs_idx);
		logger.info("추천테이블 데이터 추가 : " + add);
		if(add>0) {
			int plus = dao.recoPlus(bbs_idx);
			logger.info("추천갯수 +1 : " + plus);
			success = true;
		}
		return success;
	}

	public Boolean recoDown(String id, String bbs_idx) {
		boolean success = false;
		logger.info("추천 취소 요청");
		int delete = dao.recoTableDown(id,bbs_idx);
		logger.info("추천테이블 데이터 삭제 : " + delete);
		if(delete>0) {
			int minus = dao.recoMinus(bbs_idx);
			logger.info("추천갯수 -1 : " + minus);
			//셀렉트로 조회수 추천갯수 조회 후 map에 담아서 넣어서 보낸다.
			success = true;
		}
		return success;
	}

	public HashMap<String, Object> replyList(String id, String bbs_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("댓글 리스트 요청" + id+"/"+bbs_idx);
		ArrayList<ReplyDTO> list = dao.replyList(id,bbs_idx);
		map.put("replyList", list);
		return map;
	}

	public int replyWrite(ReplyDTO reply) {
		logger.info("댓글 작성 요청 : "+reply);
		int success = dao.replyWrite(reply);
		return success;
	}

	public HashMap<String, Object> replyUpdateForm(HashMap<String, Object> map) {
		HashMap<String, Object> replyupdateForm = new HashMap<String, Object>();
		ReplyDTO dto = dao.replyUpdateForm(map);
		logger.info("{}",dto.getNickname());
		replyupdateForm.put("replyUpdate", dto);
		
		return replyupdateForm;
	}

	public int replyUpdate(ReplyDTO reply) {
		int success = 0;
		logger.info("댓글 수정하기");
		success = dao.replyUpdate(reply);
		logger.info("{}",success);
		return success;
	}

	public int  replyDel(String reply_idx) {
		int success = 0;
		logger.info("블라인드 처리하기");
		success = dao.replyDel(reply_idx);
		return success;
	}



	public HashMap<String, Object> mainTop(String type) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardDAO> list = null;
		if(type.equals("gal")) {
			logger.info("갤러리 탑 3 요청");	
			 list = dao.galTop3();
		}else {
			logger.info("게시물 탑 5 요청");			
			list = dao.bbsTop5();
		}
		map.put("list",list);
		return map;
	}

	public ModelAndView searchBbs(String category, String keyword) {
		keyword =  "%"+keyword+"%";
		int currPage = 1;
		int start = 1+ (currPage-1) *12;
		int end = start + 11;
		int maxPage = (int) Math.ceil(dao.maxPage(category,keyword,start,end)/12);
		ModelAndView mav = new ModelAndView();
		logger.info("키워드 : "+ keyword +"//"+ maxPage);
		ArrayList<BoardDAO> list = dao.searchBbs(category,keyword,start,end);
		logger.info("list : "+list);
		mav.addObject("list", list);
		mav.setViewName("main/result");
		return mav;
	}

	
	


}
