package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.BoardService;

@RestController
public class BoardController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired BoardService service;
	
	///,@RequestParam String dog_cat
	@RequestMapping(value = "/BoardList", method = RequestMethod.GET)
	public ModelAndView BoardList(Model model) {
		logger.info("댕냥노하우 / 경험기 게시판 리스트 : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/Experience");
		return mav;
	}
	
	@RequestMapping(value = "/BoardTab/{dog_cat}", method = RequestMethod.GET)
	public HashMap<String, Object> BoardList(Model model,@PathVariable String dog_cat) {
		logger.info("댕냥노하우 / 경험기 게시판 리스트 : "+dog_cat);
		return service.BoardTab(dog_cat);
	}
	
	@RequestMapping(value = "/writeForm", method = RequestMethod.GET)
	public ModelAndView writeForm(Model model, HttpSession session) {
		logger.info("댕냥노하우 / 경험기 게시판 글쓰기 폼 : ");
		//업로드할 파일 이름을 저장한 HashMap 을 생성해서 session 에 저장		
		HashMap<String, String> fileList = new HashMap<String, String>();
		session.setAttribute("fileList", fileList);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/writeForm");
		return mav;
	}
	
	@RequestMapping(value = "/uploadForm", method = RequestMethod.GET)
	public ModelAndView uploadForm(Model model) {	
		ModelAndView mav = new ModelAndView();
		logger.info("사진 올리기 폼");
		mav.setViewName("/Board/uploadForm");
		return mav;
	}
	
	@RequestMapping(value = "/upload", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {		
		logger.info("업로드 요청");			
		return service.fileUpload(file,session);
	}
	
	@RequestMapping(value = "/write", method = RequestMethod.POST)
	public ModelAndView write(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("댕냥노하우 / 경험기 게시판 글작성 : " +params);
		return service.write(params,session);
	}
	
	@RequestMapping(value = "/fileDelete", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> fileDelete(
			@RequestParam String newfileName, HttpSession session) {		
		logger.info(newfileName+" 파일 삭제 요청");			
		return service.fileDelete(newfileName,session);
	}
	
	@RequestMapping(value = "/BoardDel", method = RequestMethod.GET)
	public ModelAndView BoardDel(Model model) {
		logger.info("댕냥노하우 / 경험기 게시판 삭제 : ");
		ModelAndView mav = new ModelAndView();
		mav.setViewName("/Board/Experience");
		return mav;
	}
	
}