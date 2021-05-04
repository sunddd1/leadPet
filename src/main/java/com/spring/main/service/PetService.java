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
	
	public void list(Model model) {
		logger.info("리스트 보이기 처리");
		String loginId = "test1122";
		ArrayList<PetDTO>list = dao.list(loginId);
		
		model.addAttribute("list", list);
	}
	
	//파일 업로드 
	public ModelAndView fileUpload(MultipartFile file, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		/*file upload 시작*/
		//1.경로설정 
		File dir = new File(root+"upload/");
		
		//2.경로 없으면 생성
		if(!dir.exists()) {
			logger.info("폴더 없음, 생성");
			dir.mkdir();
		}
		
		//3.파일명 추출
		String fileName = file.getOriginalFilename();
		//4.새파일명 생성(현재시간을 밀리세컨드로 환산한 이름)
		String newFileName = System.currentTimeMillis()+fileName.substring(fileName.lastIndexOf("."));
		logger.info(fileName+"=>"+newFileName);
		
		/*파일 저장*/
		try {
			//java.nio 활용(java 7 부터 적용 됨)
			byte[]bytes = file.getBytes();//MultipartFile 에서 바이너리 데이터를 추출 
			Path filePath = Paths.get(root+"upload/"+newFileName);//저장할 경로를 지정
			Files.write(filePath,bytes);//파일 저장
			
			//session에 내가 저장한 파일 내역을 저장한다. 
			Pet_imgDTO dto = new Pet_imgDTO();
			dto.setOriFileName(fileName);
			dto.setNewFileName(newFileName);
			session.setAttribute("fileList", dto);
			mav.addObject("path","/photo/"+newFileName); //경로 
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		 
		mav.setViewName("Pet/uploadFormPet");
		return mav;
	}
	
	//반려동물 등록
	@Transactional
	public ModelAndView write(HashMap<String, String> params, HttpSession session, String id) {
		ModelAndView mav = new ModelAndView();
		String page="redirect:/newPet";		
		//글쓰기(DB 저장) {idx}, subject, user_name, content
		//insert 한 내용의 sequence 를 가져오기 위해 generate key 를 사용 해야 한다.
		//그러려면 파라메터 타입으로 빈(dto)을 사용 해야 한다.
		String bday = params.get("birth1")+"/"+params.get("birth2")+"/"+params.get("birth3");
		logger.info("bday:"+bday);
		PetDTO dto = new PetDTO();
		dto.setId(id);
		dto.setKg(params.get("kg"));
		dto.setKind(params.get("kind"));
		dto.setPet_name(params.get("pet_name"));
		dto.setDog_cat(params.get("dog_cat"));
		dto.setBday(bday);
		logger.info("dto:"+dto);
				
		Pet_imgDTO photoDTO = new Pet_imgDTO();
		if(dao.write(dto)>0) {//글쓰기 성공
			//성공하게 되면 키가 파라메터 bean 에 담기게 된다.
			logger.info("idx : "+dto.getPet_idx());
						
			//2. fileList 에 저장된 파일이 있는지 확인 한다.(사이즈 확인)
			if(photoDTO!=null) {
				logger.info("여기까지 됐나");
				//3. 업로드한 파일이 있을 경우 파일 내용을 DB 에 기록 
				//fileIdx, oriFileName, newFileName, idx
				//맵에 있는 모든 값을 빼서 DB 에 넣는다.
//				for(String key : photoDTO.keySet()) {
//					dao.writeFile(key,photoDTO.get(key),dto.getPet_idx());
//				}				
			}						
			page="redirect:/list";//성공시 반려동물 목록으로 이동
		}else{//글쓰기 실패
			
//			for(String newFileName : fileList.keySet()) {//파일을 업로드 한 상태에서 글 쓰기가 실패 되었다면 업로드한 내용을 모두 지워 준다.
//				File file = new File(root+"upload/"+newFileName);
//				file.delete();
//			}	
			
		}
		session.removeAttribute("fileList");//파일 업로드가 다 끝난다면 session 에서 삭제
		mav.setViewName(page);	
		
		return mav;
	}

//	public void update() throws ServletException, IOException {
//		String loginId = (String) req.getSession().getAttribute("myLoginId");
//		if(loginId != null) {
//			FileService file = new FileService(req);
//			MemberDTO dto = file.regist();
//			System.out.println(dto.getOriFileName()+"=>"+dto.getNewFileName());
//		
//			MemberDAO dao = new MemberDAO();
//			int success = dao.updateMember(dto);
//			
//			if(dto.getOriFileName() != null) {
//				String id = dto.getId();
//				String delFileName = dao.getFileName(id);
//				int change = dao.savePhoto(delFileName,dto);
//				System.out.println("교체한 파일 갯수 : "+change);
//				if(delFileName != null) {
//					file.delete(delFileName);
//				}
//			}
//			if(success > 0) {
//				req.setAttribute("photoPath", dto.getNewFileName());
//			}
//			dao.resClose();
//			RequestDispatcher dis = req.getRequestDispatcher("/myPage/updateMF?id="+loginId);
//			dis.forward(req, resp);
//		} else {
//			resp.sendRedirect("../movie/home");
//		}
//	}
}
