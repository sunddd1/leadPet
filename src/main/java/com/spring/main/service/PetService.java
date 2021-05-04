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
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.PetDAO;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.Pet_imgDTO;

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
//			Pet_imgDTO imgDTO = new Pet_imgDTO();
//			imgDTO.setOriFileName(orifileName);
//			imgDTO.setNewFileName(newfileName);
//			logger.info("imgDTO : "+imgDTO.getOriFileName()+imgDTO.getNewFileName()+imgDTO.getPet_idx());
//			dao.upload(imgDTO);
			mav.addObject("path","/photoPet/"+newfileName);
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		mav.setViewName("Pet/uploadFormPet");
		return mav;
	}
	
//	//파일 업로드 
//	public ModelAndView fileUpload(MultipartFile file, HttpSession session,HashMap<String, String> params) {
//		ModelAndView mav = new ModelAndView();
//		/*file upload 시작*/
//		//1.경로설정 
//		File dir = new File(root+"uploadPet/");
//		
//		//2.경로 없으면 생성
//		if(!dir.exists()) {
//			logger.info("폴더 없음, 생성");
//			dir.mkdir();
//		}
//		
//		//3.파일명 추출
//		String fileName = file.getOriginalFilename();
//		//4.새파일명 생성(현재시간을 밀리세컨드로 환산한 이름)
//		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
//		logger.info(fileName+"=>"+newFileName);
//		
//		/*파일 저장*/
//		try {
//			//java.nio 활용(java 7 부터 적용 됨)
//			logger.info("1");
//			byte[]bytes = file.getBytes();//MultipartFile 에서 바이너리 데이터를 추출 
//			Path filePath = Paths.get(root+"uploadPet/"+newFileName);//저장할 경로를 지정
//			Files.write(filePath,bytes);//파일 저장
//			logger.info("2");
//			//session에 파일 저장 
//			HashMap<String, String> fileList = (HashMap<String, String>) session.getAttribute("fileList");
//			fileList.put(newFileName, fileName);
//			logger.info("현재 저장된 파일 수 :"+fileList.size());
//			
//			//DTO에 담았을때 
////			Pet_imgDTO dto = new Pet_imgDTO();
////			dto.setOriFileName(fileName);
////			dto.setNewFileName(newFileName);
//			
//			
//			
//			session.setAttribute("fileList", fileList);
//			mav.addObject("path","/photo/"+newFileName); //경로 
//		} catch (IOException e) {
//			e.printStackTrace();
//		}
//		
//		 
//		mav.setViewName("Pet/uploadFormPet");
//		return mav;
//	}
	
	//반려동물 등록
	@Transactional
	public ModelAndView write(HashMap<String, String> params, HttpSession session, String id) {
		ModelAndView mav = new ModelAndView();
		String page="redirect:/newPet";	//실패시 등록페이지 	
		String bday = params.get("birth1")+"/"+params.get("birth2")+"/"+params.get("birth3");//년/월/일 =bday 
		logger.info("bday:"+bday);
		PetDTO dto = new PetDTO();//dto 에 추가 
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
			if(photoList.size()>0) {//fileList 데이터 존재 확인 
				logger.info("photo_size :"+photoList.size());
			}
			if(dto!=null) {
				logger.info("여기까지 됐나 dto :"+dto.getPet_idx());
				//업로드한 파일 존재 > 파일 내용 DB 에 추가 
				//photo_idx, oriFileName, newFileName,reg_date pet_idx
//				Pet_imgDTO imgDTO = new Pet_imgDTO();
//				imgDTO.setNewFileName(fileList.keySet());
//				String newFileName = fileList.get(newFileName);
//				logger.info("newFileName:"+newFileName);
				
				for(String key : photoList.keySet()){
					dao.writeFile(dto.getPet_idx(),key,photoList.get(key));
				}
				logger.info("DB 추가 완료");
			
			}						
			page="Pet/list";//성공시 반려동물 목록으로 이동
		}else{//글쓰기 실패
				
			
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
			

}
