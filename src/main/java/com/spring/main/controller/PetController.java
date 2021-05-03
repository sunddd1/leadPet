package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.PetService;

@Controller
public class PetController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PetService service;
	
	//반려동물 목록
	@RequestMapping(value = "/listPet", method = RequestMethod.GET)
	public String home(Model model) {
		logger.info("반려동물 목록");
		service.list(model);
		return "Pet/list";
	}
	
	//반려동물 등록 페이지 요청  
	@RequestMapping("/newPet")
	public String newPet() {
		logger.info("반려동물 등록 페이지 요청");
		return "Pet/newPet";
	}
	
	@RequestMapping(value = "/uploadFormPet", method = RequestMethod.GET)
	public String uploadForm( Model model) {
		logger.info("사진 올리기 폼 요청");
		return "Pet/uploadFormPet";
	}
	
	@RequestMapping(value = "/uploadPet", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {
		logger.info("업로드 요청");
		logger.info(""+file);
		return service.fileUpload(file,session);
	}
	
	//반려동물 등록
	@RequestMapping(value = "/petPlus", method = RequestMethod.POST)
	public ModelAndView write(@RequestParam HashMap<String, String> params,HttpSession session) {
		logger.info("반려동물 등록 : "+params);
		return service.write(params,session);
	}
	
}
