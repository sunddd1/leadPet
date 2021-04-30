package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.BoardDTO;

import oracle.jdbc.driver.Message;
@Service
public class MemberService {
	@Autowired MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	//회원 탈퇴
//	@Transactional
//	public void withdrawal(String loginId) {
//		dao.withdrawal(loginId);
//	}

	

	
	public String checkPw(String pw) {
		logger.info("비밀번호 확인 요청");
		
		String result = null;
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		
		String DBpass = dao.checkPw("hello");
		
		logger.info("DB 비밀번호 : "+DBpass);
		logger.info("입력한 비밀번호 : "+pw);
		
		if(encoder.matches(pw, DBpass)) {
			logger.info("비번 확인 함수 성공 ");
			result = "pwConfirmOK";
		}else {
			result = "pwConfirmNO";
		}
		return result;
	}

	public String withdraw(String pw,HttpSession session) {
		//비번 일치 확인 
		String result = checkPw(pw);
		String loginId = "hello";
		String page = "pwCheck";
		
		if(result.equals("pwConfirmOK")) {
			//탈퇴 
			dao.withdraw(loginId);
			logger.info("탈퇴 z쿼리 ");
			//로그인 세션 삭제
			Object object = session.getAttribute("login");
			if(object!=null) {
				session.removeAttribute("login");
				session.invalidate();
				logger.info("로그인 세션 삭제 ");
			}
			result = "success";
			logger.info("비번 일치");
			page= "login/loginForm";
		}else {
			//비번 틀림 
			result = "fail";
			logger.info("비번 틀림");
		}
		
		return page;
	}

	public	Map<String, Object> restore(String pw,HttpSession session) {
		//비번 일치 확인 
		String result = checkPw(pw);
		String loginId = "hello";
		String page = "restore";
		Map<String, Object> restore = new HashMap<String, Object>();
		if(result.equals("pwConfirmOK")) {
			logger.info("계정복구요청");
			//계정 복구 
			dao.restore(loginId);
			
			//로그인 세션 삭제
			Object object = session.getAttribute("login");
			if(object!=null) {
				session.removeAttribute("login");
				session.invalidate();
				logger.info("로그인 세션 삭제 ");
			}
			result = "success";
			logger.info("비번 일치");
			page= "home";
		}else {
			//비번 틀림 
			result = "fail";
			logger.info("비번 틀림");
		}
		restore.put("page", page);
		restore.put("result", result);
		return restore;
	}

	public String noteList(ArrayList<Message> message,Model model) {
		logger.info("받은 쪽지 읽기 시작");
		String loginId = "wwww";
        message = dao.MessageList(loginId);
        model.addAttribute("messageList", message);
        logger.info("받은 쪽지 읽기 종료");
        return "Note/noteList";
	}

	public String delMessage(int note_idx) {
		String loginId = "wwww";
		logger.info(note_idx+"번 삭제("+loginId+")");
		dao.delMessage(note_idx);
		return "redirect:/noteList";
	}

	public String noteSend(String content) {
		logger.info("쪽지 전송중..");
		String loginId="wwww";
		dao.noteSend(loginId,content);
		logger.info("쪽지 전송 완료");
		return "redirect:/sendList";
	}

	public String sendList(ArrayList<Message> sendList, Model model) {
		logger.info("보낸 쪽지 읽기 시작");
		String loginId = "test1122";
		sendList = dao.sendList(loginId);
        model.addAttribute("sendList", sendList);
        logger.info("보낸 쪽지 읽기 종료");
        return "Note/sendList";
	}

	public String detailNoteList(ArrayList<Message> detailList,int note_idx,Model model) {
		logger.info("쪽지 상세보기");
		String loginId = "wwww";
		detailList = dao.detailList(loginId,note_idx);
		logger.info(note_idx+"번 읽음 처리");
		dao.checked(note_idx);
		model.addAttribute("detailList", detailList);
		return "Note/Message";
	}

	public ModelAndView writeList( String id) {
		ModelAndView mav = new ModelAndView();
		logger.info("목록 불러오는 중");
		logger.info("요청 유저 닉네임 : "+id);
		String page = "home";
		BoardDTO dto = dao.writeList(id);
		logger.info("들어옴? ::"+dto.getBbs_idx());
		
		if(dto != null) {
			page="Member/writeList";
			mav.addObject("write", dto);
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView detailWriteList(int bbs_idx) {
		logger.info(bbs_idx+"번 상세보기");
		BoardDTO dto = dao.detail(bbs_idx);//글 상세보기 
		ArrayList<BoardDTO> fileList = dao.fileList(bbs_idx);//해당 글 파일 목록 
		return null;
	}

//	@Transactional
//	public ModelAndView detail(String bbs_idx) {				
//		dao.upHit(bbs_idx);//조회수 올리기		
//		BoardDTO dto = dao.detail(bbs_idx);//상세정보 가져오기
//		ArrayList<PhotoBean> fileList = dao.fileList(bbs_idx);//해당 글의 파일 리스트
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("dto", dto);
//		mav.addObject("fileList", fileList);
//		mav.setViewName("detail");		
//		return mav;
//	}

	

	


	
	
}
