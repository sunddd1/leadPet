package com.spring.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.RegistDAO;
import com.spring.main.dto.MemberDTO;

@Service
public class RegistService {

	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final RegistDAO registDao;
	
	@Autowired
	public RegistService(RegistDAO registDao) {
		this.registDao = registDao;
	}

	public boolean regist(MemberDTO member) {
		logger.info("regist 호출");	
		
		// 유효성 검사 로직 추가해야함.
		
		member.setPassword(encodePw(member.getPassword()));

		return registDao.registMember(member) > 0;
	}

	public boolean checkDuplicateId(String id) {
		logger.info("checkDuplicateId 호출");
		
		return registDao.checkDuplicateId(id) == 0;
	}

	public boolean checkDuplicateNickname(String nickname) {
		logger.info("checkDuplicateNickname 호출");
		
		return registDao.checkDuplicateNickname(nickname) == 0;
	}
	
	public boolean changePw(String id, String password) {
		logger.info("changePw 호출");

		return registDao.changePw(id, encodePw(password)) > 0;
	}
	
	private String encodePw(String password) {
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.encode(password);
	}

	
}
