package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.VaccinDTO;
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
	
	//반려동물 백신 리스트 
	@RequestMapping(value = "/petVaccList", method = RequestMethod.POST)
	@ResponseBody 
	public List<Map> petPlus(String chk) {		
		logger.info("반려동물 등록 요청");
		return service.vaccList(chk);
	}
	
 	//반려동물 등록
 	@RequestMapping(value = "/petPlus", method = RequestMethod.POST)
	public ModelAndView write(PetDTO dto, HttpSession session) throws Exception {
 		dto.setVaccList(new ObjectMapper().readValue(dto.getVaccListJson(), List.class));
 		logger.info("dto 보자 :"+dto.getPet_name());
 		HashMap<String, String> photoList = new HashMap<String,String>();
		session.setAttribute("photoList", photoList);
//		String json = dto.getVaccListJson().toString();
//		ObjectMapper mapper = new ObjectMapper();
//		List<VaccinDTO> listVacc = mapper.readValue(json, new TypeReference<ArrayList<VaccinDTO>>() {
//		});
		//logger.info("찍히는 값 :"+listVacc.size());
		logger.info("get 해보자 :"+dto.getVaccList().get(0));
		
 		return service.write(dto,session);
 	}

	
	//반려동물 삭제 요청 
	@RequestMapping(value="/deletePet")
    public String deletePet(@RequestParam int pet_idx,@RequestParam String id){
        logger.info("반려동물 삭제");
		return service.deletePet(pet_idx);
	}
	
	//대표 반려동물 설정
	@RequestMapping(value="/star")
    public String star(@RequestParam int pet_idx){
        logger.info("반려동물 대표 설정");
		return service.star(pet_idx);
	}
	
	//반려동물 수정 
	@RequestMapping(value = "/updatePet")
	public ModelAndView updatePet(@RequestParam int pet_idx) {
		return service.updatePet(pet_idx);
	}
	
}
