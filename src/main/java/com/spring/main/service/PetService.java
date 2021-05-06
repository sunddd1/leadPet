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
	
	public void list(Model model, String id) {
		logger.info("리스트 보이기 처리");
		ArrayList<PetDTO>list = dao.list(id);
		
		model.addAttribute("list", list);
	}
	
	//반려동물 등록 페이지 요청
	public ModelAndView newPet(String id) {
		logger.info("등록 페이지");
		ModelAndView mav = new ModelAndView();
		ArrayList<VaccinDTO>dog =dao.vac_dog();//강아지 접종 목록
		ArrayList<VaccinDTO>cat = dao.vac_cat();//고양이 접종 목록
		logger.info("고양이 접종 리스트 :"+cat.size());
		logger.info("강아지 접종 리스트 :"+dog.size());
		mav.addObject("dog", dog);
		mav.addObject("cat", cat);
//		ArrayList<VaccinDTO>vac = dao.vac();// 접종 목록
//		logger.info("백신리스트:"+vac.size());
		mav.setViewName("Pet/newPet");
//		mav.addObject("vac", vac);
		return mav;
	}
	
	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		File dir = new File(root+"uploadPet/");
		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
		String orifileName = file.getOriginalFilename();
		String newfileName = System.currentTimeMillis()+orifileName.substring(orifileName.lastIndexOf("."));
		logger.info(orifileName +"=>"+newfileName);
		
		try {
			byte[] bytes = file.getBytes();
			Path filePath = Paths.get(root+"uploadPet/"+newfileName);
			Files.write(filePath, bytes);
			HashMap<String, String> photoList = (HashMap<String, String>) session.getAttribute("photoList");
			logger.info("photoList :"+session.getAttribute("photoList"));
			photoList.put(newfileName, orifileName);
			logger.info("현재 저장된 파일 수 :"+photoList.size());
			session.setAttribute("photoList", photoList);
			mav.addObject("path","/photoPet/"+newfileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName("Pet/uploadFormPet");
		return mav;
	}
	
		

	//반려동물 등록
	@Transactional
	public ModelAndView write(HashMap<String, String> params, HttpSession session, String id, List<String> array, List<String> dateList) {
		ModelAndView mav = new ModelAndView();
		String page="redirect:/newPet";	//실패시 등록페이지 	
		String bday = params.get("birth1")+"/"+params.get("birth2")+"/"+params.get("birth3");//년/월/일 =bday 
		logger.info("bday:"+bday);
		PetDTO dto = new PetDTO();//dto 에 추가 (반려동물 정보) 
		dto.setId(id);
		dto.setKg(params.get("kg"));
		dto.setKind(params.get("kind"));
		dto.setPet_name(params.get("pet_name"));
		dto.setDog_cat(params.get("dog_cat"));
		dto.setBday(bday);
		logger.info("dto:"+dto.getBday());
				
		HashMap<String, String> photoList = (HashMap<String, String>) session.getAttribute("photoList");
		
		if(dao.write(dto)>0) {//등록 성공시 
			logger.info("idx : "+dto.getPet_idx());
			if(photoList.size()>0) {//PhotoList 데이터 존재 확인 
				logger.info("photo_size :"+photoList.size());
			}
			if(dto!=null) {
				logger.info("여기까지 됐나 dto :"+dto.getPet_idx());
				//업로드할 파일 존재 -> DB에 추가 
				for(String key : photoList.keySet()){
					dao.writeFile(dto.getPet_idx(),key,photoList.get(key));
				}
				logger.info("DB 사진 추가 완료");
				
				
				
//				//반려동물 예방접종 여부 저장 
//				Pet_vaccineDTO vaccDTO = new Pet_vaccineDTO();//반려동물 접종 여부 dto 
//				//SimpleDateFormat sd = new SimpleDateFormat("yy/mm/dd");
//				vaccDTO.setVacc_date(params.get("vacc_date"));
//				vaccDTO.setChecked(params.get("checked"));
//				vaccDTO.setPet_idx(dto.getPet_idx());
//				//해당 백신의 번호 
//				int vacc_idx = dao.getIdx(params.get("vacc_name"));
//				vaccDTO.setVacc_idx(vacc_idx);
//				logger.info("백신 번호 :"+vaccDTO.getVacc_idx());
//				for(ArrayList<Pet_vaccineDTO> insert : vaccDTO) {
//					logger.info("insert:"+insert);
//				}
				
			}						
			page="Pet/list";//성공시 반려동물 목록으로 이동
		}else{//반려동물 등록 실패
			
		}
		session.removeAttribute("fileList");//파일 업로드가 다 끝난다면 session 에서 삭제
		mav.setViewName(page);	
		
		return mav;
	}

	public String deletePet(int pet_idx) {
		logger.info(pet_idx+"번 삭제중..");
		dao.deletePet(pet_idx);
		logger.info("삭제 완료..");
		return "redirect:/listPet";
	}

	public String star(int pet_idx) {
		logger.info("대표 반려동물 선택 idx :"+pet_idx);
		dao.star(pet_idx);
		return "Pet/list";
	}

	public ModelAndView updatePet(int pet_idx) {
		logger.info("반려동물 업데이트 :"+pet_idx);
		return null;
	}

	public List<Map> vaccList(String chk) {
		List<Map> vaccList =  dao.vaccList(chk);
		logger.info("백신 리스트 동물 확인 :"+vaccList.size());
		return vaccList;
	}
	

}
