package com.spring.main.service;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.NoteDTO;

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

	

	
	public boolean checkPw(String id, String pw) {
		logger.info("비밀번호 확인 요청");

		String DBpass = dao.checkPw(id);
		
		logger.info("DB 비밀번호 : "+DBpass);
		logger.info("입력한 비밀번호 : "+pw);
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(pw, DBpass);
	}

	public String withdraw(String id, String pw) {
		//비번 일치 확인 
		String page = "pwCheck";
		
		if(checkPw(id, pw)) {
			//탈퇴 
			dao.withdrawa(id);

			logger.info("비번 일치");
			page= "redirect:/login-form";
		}else {
			//비번 틀림 
			logger.info("비번 틀림");
		}
		
		return page;
	}

	public String restore(String id, String pw) {
		//비번 일치 확인 
		String page = "pwCheck";
		
		if(checkPw(id, pw)) {
			//계정 복구 
			dao.restore(id);

			logger.info("비번 일치");
			page= "redirect:/login-form";
		}else {
			//비번 틀림 
			logger.info("비번 틀림");
		}
		
		return page;
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
		return "Note/sendList";
	}

	public String sendList(ArrayList<Message> sendList, Model model) {
		logger.info("보낸 쪽지 읽기 시작");
		String loginId = "test1122";
		sendList = dao.sendList(loginId);
        model.addAttribute("sendList", sendList);
        logger.info("보낸 쪽지 읽기 종료");
        return "Note/sendList";
	}

	public String detailNoteList(String id,int note_idx) {
		logger.info("쪽지 상세보기");
		String loginId = "wwww";
		dao.detailNoteList(loginId,note_idx,id);
		return "Note/Message";
	}

	public MemberDTO getMember(String id) {
		logger.info(id);
		
		return dao.getMember(id);
	}

	public boolean updateChangeDate(String id) {
		logger.info("멤버 탈퇴일 최신으로 변경");
		
		return dao.updateChangeDate(id) > 0;
	}

	public int update(MemberDTO member) {
		logger.info("멤버 업데이트");
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setPassword(encoder.encode(member.getPassword()));
		
		return dao.update(member);
	}
	
	
}
