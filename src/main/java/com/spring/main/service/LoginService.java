package com.spring.main.service;

import java.util.Date;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;

import com.spring.main.dao.LoginDAO;
import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;

@Service
public class LoginService {
	
	public enum Type{
		USER, ADMIN, WITHDRAW, NONE
	}
	
	class Info {
		private String pw = null;
		private Date change_date = null;
		private Type type = Type.NONE;
	}
	
	private final int UNALBE_LOGIN_TIME_AFTER_WITHDRAW = 7;
	private final Logger logger = LoggerFactory.getLogger(this.getClass());

	private final LoginDAO loginDao;
	
	@Autowired
	public LoginService(LoginDAO loginDao) {
		this.loginDao = loginDao;
	}
	
	public Type login(String id, String password) {
		logger.info("login 호출");
		
		if(id == null || password == null) {
			return Type.NONE;
		}
		
		String userId = id.trim();
		String userPw = password.trim();
		
		if(userId.equals("") || userPw.equals("")) {
			return Type.NONE;
		}
		
		Info loginInfo = doLogin(userId, userPw);
		String dbPw = loginInfo.pw;

		// 로그인 타입별로 비밀번호 비교.
		switch (loginInfo.type) {
		case WITHDRAW:
			if(calInterval(loginInfo.change_date, new Date()) > UNALBE_LOGIN_TIME_AFTER_WITHDRAW) {
				loginInfo.type = Type.NONE;
			}
			break;
			
		case USER:
			if(!equalEncodingPw(userPw, dbPw)) {
				loginInfo.type = Type.NONE;
			}
			break;

		case ADMIN:
			if(!userPw.equals(dbPw)) {
				loginInfo.type = Type.NONE;
			}
			break;

		default:
			logger.info("비밀번호 확인 오류");
			loginInfo.type = Type.NONE;
			break;
		}

		logger.info("login 성공");
		return loginInfo.type;
	}
	
	public String findId(String name, String email) {
		logger.info("findId 호출");

		return loginDao.findId(name, email);
	}
	
	public boolean existId(String id, String name, String email) {
		logger.info("validId 호출");
		
		return loginDao.existId(id, name, email) > 0;
	}
	
	private boolean equalEncodingPw(String userPw, String dbPw) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(userPw, dbPw);
	}

	private Info doLogin (String id, String password) {
		Info loginInfo = new Info();
		
		// userLogin
		MemberDTO memberDto = loginDao.userLogin(id);
		
		// user 로그인에 성공.
		if(memberDto != null) {
			loginInfo.change_date = memberDto.getChange_date();
			loginInfo.pw = memberDto.getPassword();
			loginInfo.type = Type.USER;
			
			// 탈퇴했을 경우
			if(memberDto.getWithdraw().equals("Y")) {
				loginInfo.type = Type.WITHDRAW;
			}
			
			return loginInfo;
		}
		
		// adminLogin
		AdminDTO adminDto = loginDao.adminLogin(id);
		
		if(adminDto != null) {
			loginInfo.pw = adminDto.getPassword();
			loginInfo.type = Type.ADMIN;
		}

		// 관리자 로그인도 실패했을 경우 info의 초기값을 반환.
		return loginInfo;
	}
	
	private long calInterval(Date date1, Date date2) {
		long interval = date1.getTime() - date2.getTime();
		return Math.abs(interval / (24 * 60 * 60 *1000));
	}
	
}
