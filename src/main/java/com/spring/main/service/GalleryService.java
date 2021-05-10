package com.spring.main.service;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.BoardDAO;
import com.spring.main.dao.GalleryDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;

@Service
public class GalleryService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Value("#{config['Globals.root']}") String root;
	@Autowired GalleryDAO dao;
	@Autowired BoardDAO bdao;
	

	public ModelAndView GalleyList() {
		ModelAndView mav = new ModelAndView();
		HashMap<String, Object> map = new HashMap<String, Object>();
		ArrayList<BoardDTO> list = dao.GalleryList();
		mav.addObject("GalleryList",list);
		mav.setViewName("Board/GalleryList");
		return mav;
	}


	public ModelAndView GalwriteForm(String id) {
		logger.info("글쓰기 폼 요청");
		ModelAndView mav = new ModelAndView();
		PetDTO dto = dao.GalwriteForm(id);
		logger.info("글쓰기폼 유저정보 : "+dto.getNickname());
		mav.addObject("dto",dto);
		mav.setViewName("Board/GalWriteForm");
		return mav;
	}


	public ModelAndView Galwrite(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String page="redirect:/writeForm";
		String msg = "글작성에 실패하였습니다.";
		BoardDTO dto = new BoardDTO();
		dto.setBbs_subject(params.get("bbs_subject"));
		dto.setBbs_content(params.get("bbs_content"));
		dto.setNickname(params.get("nickname"));
		dto.setPet_idx(Integer.parseInt(params.get("pet_idx")));
		dto.setCategory_name(params.get("category_name"));
		dto.setType(params.get("type"));
		
		HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
		if(bdao.write(dto)>0) {
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
				bdao.writeFile(keyArr.get(0),fileList.get(keyArr.get(0)),dto.getBbs_idx());
				logger.info("keyArray0.. {}",keyArr.get(0));
				//	keyArr.get() -> newfilename 			
				if(fileList.size()>1) { 
					for (int i = 1; i < fileList.size(); i++) {
						bdao.writeContentFile(keyArr.get(i),fileList.get(keyArr.get(i)),dto.getBbs_idx()); 
					}
				}
			}
			page="redirect:/GalleryList";
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


	public Boolean interestConfirm(String id, String bbs_id) {
		boolean success = false;
		logger.info("관심유저 여부 확인 요청");
		HashMap<String, Object> map = dao.interestConfirm(id,bbs_id);
		logger.info("추천확인 : " + map);
		if(map != null) {
			success = true;
		}
		return success;
	}


	public Boolean addInterestButton(String id, String bbs_id) {
		boolean success = false;
		logger.info("관심유저 추가 요청");
		int add = dao.addInterestButton(id,bbs_id);
		logger.info("관심유저 데이터 추가 : " + add);
		if(add>0) {
			success = true;
		}
		return success;
	}


	public Boolean cancleInterestButton(String id, String bbs_id) {
		boolean success = false;
		logger.info("관심유저 취소 요청");
		int delete = dao.cancleInterestButton(id,bbs_id);
		logger.info("관심유저 삭제 삭제 : " + delete);
		if(delete>0) {
			success = true;
		}
		return success;
	}



	
}
