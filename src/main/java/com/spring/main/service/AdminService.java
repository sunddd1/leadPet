package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.AdminDTO;

@Service
public class AdminService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDAO dao;

//	public Object adminCheck(String loginId) {
//		return dao.adminCheck(loginId);
//	}
	
	public ArrayList<AdminDTO> list() {
		logger.info("관리자 리스트 서비스 도착");
		return dao.adminList();
	}

	public int change(String oriPass, String newPass) {
		logger.info("비밀번호 수정 서비스 도착");
		return dao.change(oriPass,newPass);
	}



}
