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
	String plain="";//평문 
	String hash="";//암호문 
	
		@RequestMapping("/checkPw")
		public String checkPw(@RequestBody String pw, HttpSession session) {
			logger.info("비밀번호 확인 요청");
			
			String result = null;
			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
			
			MemberDTO memberDTO = (MemberDTO) session.getAttribute("login");
			logger.info("DB 비밀번호 : "+memberDTO.getPassword());
			logger.info("입력한 비밀번호 : "+pw);
			
			if(encoder.matches(pw, memberDTO.getPassword())) {
				result = "pwConfirmOK";
			}else {
				result = "pwConfirmNO";
			}
			return result;
		}
		
//		@RequestMapping(value = "/checkPw", method = RequestMethod.GET)
//		public String checkPw(Model model,@RequestParam String pw) {
//			plain = pw;
//			logger.info("평문 : " +pw);
//			String result = null;
//			BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
//			hash = encoder.encode(pw);
//			logger.info("암호문 : " +hash);
//			boolean success = encoder.matches(pw, hash);//비교
//			String msg = "입력 내용이 일치하지 않습니다.";
//			if(success) {
//				msg="입력 내용이 일치 합니다.";
//			}
//			model.addAttribute("msg", msg);
//			return "Member";
//		}
	
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
