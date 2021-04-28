package com.spring.main.service;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.LoginDAO;
import com.spring.main.dto.MemberDTO;

@Service
public class LoginService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	private final LoginDAO loginDao;
	
	@Autowired
	public LoginService(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}
	
	public ModelAndView login(HttpServletRequest req, String id, String password) {
		logger.info("login 호출");
		
		ModelAndView mav = new ModelAndView();
		String viewName = "/login/loginForm";
		String msg = "로그인에 실패했습니다.";
		
		MemberDTO memberDto = loginDao.login(id);
		
		if(memberDto != null && checkEqualPw(password, memberDto.getPassword())) {	
			logger.info("login 성공");
			//viewName = "/main";
			viewName = "/login/loginForm";
			msg = "로그인에 성공했습니다.";
			
			req.setAttribute("loginId", id);
		}
		
		mav.addObject("id", id);
		mav.addObject("msg", msg);
		mav.setViewName(viewName);
		return mav;
	}
	
	public Map<String, Object> findId(String id, String email) {
		logger.info("findId 호출");
		
		Map<String, Object> output = new HashMap<String, Object>();
		String searchId = loginDao.findId(id, email);
		
		if(searchId != null) {			
			output.put("result", true);
			output.put("id", searchId);
		}
		
		return output;
	}
	
	private boolean checkEqualPw(String userPw, String dbPw) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(userPw, dbPw);
	}
}
