package com.spring.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

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
	
	public String login(String id, String password) {
		logger.info("login 호출");
		
		if(id == null || password == null) {
			return null;
		}
		
		String userId = id.trim();
		String userPw = password.trim();
		
		if(userId.equals("") || userPw.equals("")) {
			return null;
		}
		
		MemberDTO memberDto = loginDao.login(userId);
		
		if(memberDto == null) {
			return null;
		}

		if(checkEqualPw(userPw, memberDto.getPassword()) == false) {
			return null;
		}
		
		logger.info("login 성공");
		return id;
	}
	
	public String findId(String name, String email) {
		logger.info("findId 호출");

		return loginDao.findId(name, email);
	}
	
	public boolean existId(String id, String name, String email) {
		logger.info("validId 호출");
		
		return loginDao.existId(id, name, email) > 0;
	}
	
	private boolean checkEqualPw(String userPw, String dbPw) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(userPw, dbPw);
	}

	
}
