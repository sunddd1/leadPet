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

import oracle.net.aso.l;

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
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mav.setViewName("./Board/uploadForm");
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
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		if(dao.write(dto)>0) {
			logger.info("idx : "+dto.getBbs_idx());
			if(fileList.size()>0) {
				for(String key : fileList.keySet()) {
					dao.writeFile(key,fileList.get(key),dto.getBbs_idx());
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
			}
			session.setAttribute("fileList", fileList);
		} catch (Exception e) {
			success=0;
		}finally {
			map.put("success", success);
		}
		return map;
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



	
}
