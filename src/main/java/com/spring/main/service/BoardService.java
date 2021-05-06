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
import org.springframework.web.servlet.view.RedirectView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.ReplyDTO;
import com.spring.main.dto.ReportDTO;
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
		dto.setPet_idx(Integer.parseInt(params.get("pet_idx")));
		dto.setCategory_name(params.get("category_name"));
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		if(dao.write(dto)>0) {
			logger.info("idx : "+dto.getBbs_idx());
			logger.info("fileList.size : " + fileList.size());
			if(fileList.size()>0) {
				/*
				 * for(String key : fileList.keySet()) {
				 * dao.writeFile(key,fileList.get(key),dto.getBbs_idx()); }
				 */
				ArrayList<String> keyArr = new ArrayList<String>();
				for(String key : fileList.keySet()) {
					keyArr.add(key);
					logger.info(keyArr.get(0));
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
			page="Board/Experience";
		}else {
			for(String newFileName : fileList.keySet()) {
				File file = new File(root+"Boardupload/"+newFileName);
				file.delete();
			}
		}
		session.removeAttribute("fileList");
		mav.addObject("msg","글작성에 성공하였습니다.");
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
			
			//"fileList" , flieList <- 
			if(newfileName !=null) {
				dao.deletefile(newfileName);
				dao.deleteContentFile(newfileName);
			}
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
		String page="Board/Experience";
		String msg = "";
		BoardDTO dto = new BoardDTO();
		dto.setBbs_idx(Integer.parseInt(params.get("bbs_idx")));
		dto.setBbs_subject(params.get("bbs_subject"));
		dto.setBbs_content(params.get("bbs_content"));
		dto.setNickname(params.get("nickname"));
		dto.setCategory_name(params.get("category_name"));
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		
		String reportSearch =  dao.boardReportSearch(params.get("bbs_idx"));
		logger.info(reportSearch);
		if(reportSearch.equals("N")) {	
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
						logger.info(keyArr.get(0));
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
				page="Board/Experience";
				
			}else {
				for(String newFileName : fileList.keySet()) {
					File file = new File(root+"Boardupload/"+newFileName);
					file.delete();
				}
			}
			session.removeAttribute("fileList");
		}else {
			msg="수정 할 수 없는 게시글 입니다.";
		}
		mav.addObject("msg",msg);
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
			int pointplus = dao.pointPlus(id);
			if(pointplus>0) {
				dao.pointHistory(id);
			}
			logger.info("추천갯수 +1 : " + plus + "포인트 +1 : " + pointplus);
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
			int pointminus = dao.pointMinus(id);
			if(pointminus>0) {
				dao.pointmHistory(id);
			}
			logger.info("추천갯수 -1 : " + minus + "포인트 -1 : " + pointminus);
			//셀렉트로 조회수 추천갯수 조회 후 map에 담아서 넣어서 보낸다.
			success = true;
		}
		return success;
	}

	public HashMap<String, Object> replyList(String endNum, String bbs_idx) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("댓글 리스트 요청" + endNum+"/"+bbs_idx);
		Integer.parseInt(endNum);
		ArrayList<ReplyDTO> list = dao.replyList(endNum,bbs_idx);
		logger.info("리스트 크기 : " + list.size());
		map.put("replyList", list);
		map.put("reply_size", list.size());
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
	
	public ModelAndView BoardReportForm(HashMap<String, String> map) {
		logger.info("게시판 신고 폼 이동 : " + map);
		ModelAndView mav = new ModelAndView();
		mav.addObject("map",map);
		mav.setViewName("Board/board_report");
		return mav;
	}
	
	public ModelAndView BoardReport(HashMap<String, String> map) {
		logger.info("게시판 신고 : " +map);
		ModelAndView mav = new ModelAndView();
		ReportDTO dto = new ReportDTO();
		dto.setId(map.get("loginId"));
		dto.setField(Integer.parseInt(map.get("bbs_idx")));
		dto.setType(map.get("type"));
		dto.setReason(map.get("reason"));
		String reportSearch =  dao.reportSearch(dto);
		logger.info("신고 조회 결과 : "+reportSearch);
		logger.info(dto.getId());
		if(reportSearch==null) {
			dao.boardreport(dto);
			mav.addObject("msg","신고 처리 되었습니다");
			mav.setViewName("Board/board_report");
		}else {
			mav.addObject("msg","이미 신고한 게시물입니다.");
			mav.setViewName("Board/board_report");
		}
		return mav;
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

	public HashMap<String, Object> searchBbs(String category, String keyword,int page, int pagePerCnt) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		
		keyword =  "%"+keyword+"%";
		int allCnt = 0;
		if(category.equals("ALL")) {
			allCnt= dao.allCount(keyword);
		}else {
			allCnt = dao.anCount(keyword,category);
		}
		
		System.out.println(page+"/"+pagePerCnt+"/"+allCnt);
		int range = allCnt%pagePerCnt >0 ? ((int)Math.floor(allCnt/pagePerCnt))+1 : allCnt/pagePerCnt;
		System.out.println("range : " + range);
		
		page = page>range? range:page;
		System.out.println("page = "+page+category);
		page = page==0 ? page=1:page  ;
		System.out.println("page1 = "+page);
		
		int end = page * pagePerCnt;
		System.out.println("end = "+page+"*"+pagePerCnt);
		
		int start = end-pagePerCnt+1;
		System.out.println("start = "+end+"-"+pagePerCnt+"+1");
		logger.info("키워드 : "+ keyword +"//" +start+"//"+end+"//"+range);
		ArrayList<BoardDAO> list = dao.searchBbs(category,keyword,start,end);
		
		logger.info("list : "+list.size());
		map.put("list",list);
		map.put("range",range);
		map.put("currPage",page);
		return map;
	}

	public ModelAndView replyReport(HashMap<String, String> map) {
		String msg="이미 신고한 댓글입니다";
		ModelAndView mav = new ModelAndView();
		logger.info("댓글 신고하기");
		String reportSearch = dao.replyReportSearch(map);
		logger.info("신고 기록 확인 : " + reportSearch);
		if(reportSearch == null) {
			dao.replyReport(map);
			msg="신고에 성공하였습니다.";
		}else {
			msg="이미 신고된 댓글입니다.";
		}
		mav.addObject("msg",msg);
		mav.setViewName("Board/reply_report");
		return mav;
	}

	public ModelAndView boardDel(String bbs_idx) {
		logger.info("게시물 수정 및 삭제 가능 여부 확인" );
		ModelAndView mav = new ModelAndView();
		String reportSearch =  dao.boardReportSearch(bbs_idx);
		String msg = "";
		logger.info("게시물 블라인드 여부" + reportSearch);
		if(reportSearch.equals("N")) {
			dao.boardDel(bbs_idx);
			msg="게시물이 삭제되었습니다.";
			mav.addObject("msg",msg);
		}else {
			msg="삭제 할 수 없는 게시물 입니다.";
			mav.addObject("msg",msg);
		}
		mav.setViewName("Board/Experience");
		return mav;
	}



	
	


}
