package com.spring.main.service;

import java.util.HashMap;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
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

	public ModelAndView regist(MemberDTO member) {
		logger.info("regist 호출");
		
		ModelAndView mav = new ModelAndView();
		String viewName = "/regist";
		String msg = "회원가입에 실패했습니다.";
		
		// 유효성 검사 로직 추가해야함.
		
		
		if( registDao.registMember(member) > 0) {
			viewName = "/login";
			msg = "회원가입에 성공했습니다.";
		}
		
		mav.addObject("msg", msg);
		mav.setViewName(viewName);
		return mav;
	}
	
	public boolean checkDuplicateId(String id) {
		logger.info("checkDuplicateId 호출");
		
		return registDao.checkDuplicateId(id) == 0;
	}

	public boolean checkDuplicateNickname(String nickname) {
		logger.info("checkDuplicateNickname 호출");
		
		return registDao.checkDuplicateNickname(nickname) == 0;
	}
	
}
