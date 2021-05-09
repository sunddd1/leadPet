package com.spring.main.service;

import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.PetDAO;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.VaccinDTO;

@Service
public class PetService {
	@Autowired PetDAO dao;
	@Value("#{config['Globals.root']}") String root;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	public ModelAndView list(String id) {
		logger.info("반려 동물 리스트");
		ModelAndView mav = new ModelAndView();
		ArrayList<PetDTO>list = dao.list(id);//이름, 품종 등 
		if(list.size()>0) {
			for(PetDTO pet: list) {
				pet.setVaccList(dao.petVaccList(pet.getPet_idx()));
			}
			
		}
		mav.addObject("list", list);
		mav.setViewName("Pet/list");
		return mav;
	}
	
	
	//반려동물 등록 
	public ModelAndView write(PetDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String)session.getAttribute("loginId");
		dto.setId(id);
		
		//사진 업로드 준비 
		//경로 설정 
		File dir = new File(root+"uploadPet/");
		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
		
		//원본명 -> 새이름 
		String orifileName = dto.getImage().getOriginalFilename();
		String newfileName = System.currentTimeMillis()+orifileName.substring(orifileName.lastIndexOf("."));
		logger.info(orifileName +"=>"+newfileName);
		HashMap<String, String> photoList = (HashMap<String, String>) session.getAttribute("photoList");
		
		try {
			byte[] bytes = dto.getImage().getBytes();
			Path filePath = Paths.get(root+"uploadPet/"+newfileName);
			Files.write(filePath, bytes);
			logger.info("photoList :"+session.getAttribute("photoList"));
			photoList.put(newfileName, orifileName);
			logger.info("현재 저장된 파일 수 :"+photoList.size());
			session.setAttribute("photoList", photoList);
			mav.addObject("path","/photoPet/"+newfileName);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
			
		logger.info("id 들어감?  :"+dto.getId());
		
		if(dao.write(dto)>0) {//반려동물 등록이 됐다면 
			logger.info("기본 정보 입력 완료 pet_idx :"+dto.getPet_idx());
			//이름,품종,무게 등 저장 완료 -> 사진 저장 
			for(String key : photoList.keySet()){
				dao.writeFile(dto.getPet_idx(),key,photoList.get(key));
			}
			logger.info("DB 사진 추가 완료");
			
			//해당 반려동물(pet_idx)에 예방접종 여부, 날짜 저장 
			VaccinDTO vacDTO = new VaccinDTO();
			logger.info("백신 리스트(접종 여부,날짜,idx) :" +dto.getVaccList());
			
			if(dao.vacPlus(dto)) {
				logger.info("접종 여부,접종 날짜 추가 완료");
			}
			
		}
		
		session.removeAttribute("photoList");//파일 업로드가 다 끝난다면 session 에서 삭제	
		
		return mav;
	}



	public String deletePet(int pet_idx, String id) {
		logger.info(pet_idx+"번 삭제중..");
		dao.deletePet(pet_idx);
		logger.info("삭제 완료..");
		return "redirect:/listPet";
	}

	public String star(int pet_idx) {
		logger.info("대표 반려동물 선택 idx :"+pet_idx);
		dao.star(pet_idx);
		return "redirect:/listPet";
	}

	public List<Map> vaccList(String chk) {
		List<Map> vaccList =  dao.vaccList(chk);
		logger.info("백신 리스트 동물 확인 :"+vaccList.size());
		return vaccList;
	}

	public ModelAndView petInfo(int pet_idx, String id) {
		ModelAndView mav = new ModelAndView();
		// 페이지 요청시 뿌릴 데이터 : 이름, 품종,강아지/고양이, 몸무게(?), 백신(접종 여부,날짜,리스트)
		PetDTO dto = dao.petInfo(id,pet_idx);//이름,품종,무게 등 
		if(dto != null){
			dto.setVaccList(dao.vaccInfo(pet_idx));//접종 여부, 접종 목록, 접종 날짜
			logger.info("vacList size:"+dto.getVaccList().size());
		}
		mav.addObject("info", dto);
		mav.setViewName("Pet/update");
		return mav;
	}

	public ModelAndView updatePet(PetDTO dto, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String id = (String) session.getAttribute("loginId");	
		logger.info("반려동물 업데이트 요청 ID :"+id);
		logger.info("반려동물 업데이트 IDX :"+dto.getPet_idx());
		dto.setId(id);
		
		//사진 업로드 준비 
		//경로 설정 
		File dir = new File(root+"uploadPet/");
		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
		
		//원본명 -> 새이름 
		String orifileName = dto.getImage().getOriginalFilename();
		String newfileName = System.currentTimeMillis()+orifileName.substring(orifileName.lastIndexOf("."));
		logger.info(orifileName +"=>"+newfileName);
		HashMap<String, String> photoList = (HashMap<String, String>) session.getAttribute("photoList");
		
		try {
			byte[] bytes = dto.getImage().getBytes();
			Path filePath = Paths.get(root+"uploadPet/"+newfileName);
			Files.write(filePath, bytes);
			logger.info("photoList :"+session.getAttribute("photoList"));
			photoList.put(newfileName, orifileName);
			logger.info("현재 저장된 파일 수 :"+photoList.size());
			session.setAttribute("photoList", photoList);
			mav.addObject("path","/photoPet/"+newfileName);
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		int result = dao.updatePet(dto);
		if(result > 0) {
			if(dao.vacPlus(dto)) {
				logger.info("접종 여부,접종 날짜 추가 완료");
			}
			
			//이름,품종,무게 등  완료 -> 사진 저장 
			for(String key : photoList.keySet()){
				int pet_idx = dto.getPet_idx();
				dao.updateFile(pet_idx,key,photoList.get(key));
			}
		}
		
		mav.setViewName("Pet/list");
		return mav;
	}
	

}
