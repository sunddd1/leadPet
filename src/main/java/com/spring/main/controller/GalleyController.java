package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BoardService;
import com.spring.main.service.GalleryService;

@Controller
public class GalleyController {
	
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GalleryService service;
	@Autowired BoardService bservice;
	

	@RequestMapping(value = "/GalleryList", method = RequestMethod.GET)
	public ModelAndView GalleryList(Model model) {
		logger.info("갤러리 리스트 : ");
		return service.GalleyList();
	}
	
	
	@RequestMapping(value = "/GalleryDetail/{bbs_idx}", method = RequestMethod.GET)
	public ModelAndView GalleryDetail (Model model , @PathVariable String bbs_idx) {
		logger.info("갤러리 상세보기 : " + bbs_idx);
		return bservice.BoardDetail(bbs_idx);
	}
	
	@RequestMapping(value = "/GalwriteForm", method = RequestMethod.GET)
	public ModelAndView GalwriteForm(Model model, HttpSession session,@RequestParam String id) {
		logger.info("갤러리 글쓰기 폼 : "+id);
		//업로드할 파일 이름을 저장한 HashMap 을 생성해서 session 에 저장		
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		return service.GalwriteForm(id);
	}
	@RequestMapping(value = "/Galwrite", method = RequestMethod.POST)
	public ModelAndView Galwrite(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("갤러리 게시판 글작성 : " +params,session);
		return service.Galwrite(params,session);
	}
	@ResponseBody
	@RequestMapping(value = "interestConfirm", method = RequestMethod.GET)
	public Boolean interestConfirm(Model model, @RequestParam String id , String bbs_id) {
		logger.info("관심유저등록 여부 확인 : "+id+bbs_id);
		return service.interestConfirm(id,bbs_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/addInterestButton", method = RequestMethod.GET)
	public Boolean addInterestButton(Model model, @RequestParam String id , String bbs_id) {
		logger.info("관심유저 등록: "+id+bbs_id);
		return service.addInterestButton(id,bbs_id);
	}
	
	@ResponseBody
	@RequestMapping(value = "/cancleInterestButton", method = RequestMethod.GET)
	public Boolean cancleInterestButton(Model model, @RequestParam String id , String bbs_id) {
		logger.info("관심유저 등록취소: "+id+bbs_id);
		return service.cancleInterestButton(id,bbs_id);
	}
	
    @RequestMapping(value = "/GalleryUpdateForm", method = RequestMethod.GET)
    public ModelAndView GalleryUpdateForm(Model model, HttpSession session,@RequestParam String bbs_idx) {
        logger.info("갤러리 수정하기 폼 이동 : ");
        HashMap<String, String> fileList = new HashMap<String, String>();
        session.setAttribute("fileList", fileList);
        return bservice.BoardUpdateForm(bbs_idx);
    }
}
   
