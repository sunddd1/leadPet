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
import com.spring.main.dto.MemberDTO;

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

	public boolean withdraw(String id, String pw) {
		//비번 일치 확인 
		boolean result = checkPw(id, pw);
		if(result) {
			//탈퇴 
			dao.withdraw(id);
		}

		return result;
	}

	public boolean restore(String id, String pw) {
		//비번 일치 확인 
		boolean result = checkPw(id, pw);
		if(result) {
			// 복구
			dao.restore(id);
		}

		return result;
	}

	

	public MemberDTO getMember(String id) {
		logger.info(id);
		
		return dao.getMember(id);
	}

	public ModelAndView writeList( String id) {
		ModelAndView mav = new ModelAndView();
		logger.info("목록 불러오는 중");
		logger.info("요청 유저 닉네임 : "+id);
		String page = "home";
		ArrayList<BoardDTO> dto = dao.writeList(id);
		
		if(dto.size()>0) {
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
