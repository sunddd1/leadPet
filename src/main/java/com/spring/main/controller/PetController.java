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
	public String home(Model model,@RequestParam String id) {
		logger.info("반려동물 목록");
		service.list(model,id);
		return "Pet/list";
	}
	
	//반려동물 등록 페이지 요청  
	@RequestMapping("/newPet")
	public String newPet(@RequestParam String id) {
		logger.info("반려동물 등록 페이지 요청 ID :"+id);
		return "Pet/newPet";
	}
	
	//사진 업로드 창 
	@RequestMapping(value = "/uploadFormPet", method = RequestMethod.GET)
	public String uploadForm(HttpSession session) {
		logger.info("사진 올리기 폼 요청");
		HashMap<String, String> photoList = new HashMap<String,String>();
		session.setAttribute("photoList", photoList);
		return "Pet/uploadFormPet";
	}
	
	//사진 업로드 
	@RequestMapping(value = "/uploadPet", method = RequestMethod.POST)
	public ModelAndView upload(MultipartFile file, HttpSession session) {		
		logger.info("업로드 요청");			
		return service.fileUpload(file,session);
	}
	
	//반려동물 등록
	@RequestMapping(value = "/petPlus", method = RequestMethod.POST)
	public ModelAndView write(@RequestParam HashMap<String, String> params,HttpSession session,@RequestParam String id) {
		logger.info("반려동물 등록 신청 ID : "+id);
		return service.write(params,session,id);
	}
	
	//반려동물 삭제 요청 
	@RequestMapping(value="/deletePet")
    public String deletePet(@RequestParam int pet_idx,@RequestParam String id){
        logger.info("반려동물 삭제");
		return service.deletePet(pet_idx);
	}
	
}
