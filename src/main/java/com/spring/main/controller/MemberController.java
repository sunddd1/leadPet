package com.spring.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MemberDTO;
import com.spring.main.service.MemberService;
@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService memberService;
	
		@RequestMapping("/checkPw")
		public String checkPw(@RequestBody String password, HttpSession session) {
			logger.info("비밀번호 확인 요청");
			
			String result = null;
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
			logger.info("DB 비밀번호 : "+memberDTO.getPassword());
			logger.info("입력한 비밀번호 : "+password);
			
			if(encoder.matches(password, memberDTO.getPassword())) {
				result = "pwConfirmOK";
			}else {
				result = "pwConfirmNO";
			}
			return result;
		}
	
		//탈퇴 페이지 요청 
		@RequestMapping(value = "/withdrawal", method = RequestMethod.GET)
		public ModelAndView withdrawal() {
			return new ModelAndView("Member/pwCheck");
		}
		
		//탈퇴 요청 
		@RequestMapping(value = "/withdraw", method = RequestMethod.GET)
		public String withdraw(HttpSession session,@RequestBody MemberDTO memberDTO) {
			//비번 일치 확인 
			String result = checkPw(memberDTO.getPassword(),session);
			
			if(result.equals("pwConfirmOK")) {
				//탈퇴 
				memberService.withdrawal(memberDTO);
				
				//로그인 세션 삭제
				Object object = session.getAttribute("login");
				if(object!=null) {
					session.removeAttribute("login");
					session.invalidate();
				}
				result = "success";
			}else {
				//비번 틀림 
				result = "fail";
			}
			
			return result;
		}

		
}
