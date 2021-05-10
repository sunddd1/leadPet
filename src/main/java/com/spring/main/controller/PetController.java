package com.spring.main.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.main.dto.PetDTO;
import com.spring.main.service.PetService;

@Controller
public class PetController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired PetService service;
	
	//반려동물 목록
	@RequestMapping(value = "/listPet", method = RequestMethod.GET)
	public ModelAndView home(HttpSession session) {
		logger.info("반려동물 목록");
		String id = (String)session.getAttribute("loginId");
		return service.list(id);
	}
	
	//반려동물 목록
	@RequestMapping(value = "/listPetOther", method = RequestMethod.GET)
	public ModelAndView otherList(@RequestParam String id) {
		logger.info("반려동물 목록");
		return service.list(id);
	}
	
	//반려동물 등록 페이지 요청  
	@RequestMapping("/newPet")
	public String newPet(HttpSession session) {
		String id = (String)session.getAttribute("loginId");
		logger.info("반려동물 등록 페이지 요청 ID :"+id);
		return "Pet/newPet";
	}
	
	//반려동물 백신 리스트 
	@RequestMapping(value = "/petVaccList", method = RequestMethod.POST)
	@ResponseBody 
	public List<Map> petPlus(String chk) {		
		logger.info("반려동물 등록 요청");
		return service.vaccList(chk);
	}
	
 	//반려동물 등록
	@ResponseBody
 	@RequestMapping(value = "/petPlus", method = RequestMethod.POST)
	public Map<String, Object> write(PetDTO dto, HttpSession session) throws Exception {
 		dto.setVaccList(new ObjectMapper().readValue(dto.getVaccListJson(), List.class));
 		HashMap<String, String> photoList = new HashMap<String,String>();
		session.setAttribute("photoList", photoList);
 		service.write(dto,session);
 		
 		Map<String, Object> respData = new HashMap<>();
 		respData.put("ok", true);
 		return respData;
 	}

	
	//반려동물 삭제 요청 
	@RequestMapping(value="/deletePet")
    public String deletePet(@RequestParam int pet_idx,HttpSession session){
        logger.info("반려동물 삭제");
 		String id = (String) session.getAttribute("loginId");
		return service.deletePet(pet_idx,id);
	}
	
	//대표 반려동물 설정
	@RequestMapping(value="/star")
    public String star(@RequestParam int pet_idx,HttpSession session){
        logger.info("반려동물 대표 설정");
        String id = (String)session.getAttribute("loginId");
		return service.star(pet_idx,id);
	}
	
	//반려동물 수정 페이지  
	@RequestMapping(value="/updatePetPage")
	public ModelAndView updatePetPage(@RequestParam int pet_idx,HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		logger.info("반려동물 수정 페이지 요청 ID :"+id);
		return service.petInfo(pet_idx,id);
	}
	
	//반려동물 수정 
	@ResponseBody
	@RequestMapping(value = "/updatePet", method = RequestMethod.POST)
	public Map<String, Object> updatePet(PetDTO dto,HttpSession session) throws Exception {
		dto.setVaccList(new ObjectMapper().readValue(dto.getVaccListJson(), List.class));
		HashMap<String, String> photoList = new HashMap<String,String>();
		session.setAttribute("photoList", photoList);
		service.updatePet(dto,session);
		Map<String, Object> respData = new HashMap<>();
 		respData.put("ok", true);
 		return respData;
	}
	
}
