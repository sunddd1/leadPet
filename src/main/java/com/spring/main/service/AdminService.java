package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;

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

	public int adminDelete(String id) {
		logger.info("관리자 삭제 서비스 도착");
		return dao.adminDelete(id);
	}

	public int idCheck(String id) {
		logger.info("아이디 중복체크 서비스 도착");
		return dao.idCheck(id);
	}
	
	public int nickCheck(String nickname) {
		logger.info("닉네임 중복체크 서비스 도착");
		return dao.nickCheck(nickname);
	}
	
	public int insert(String id, String nickname, String pw) {
		logger.info("관리자 등록 서비스 도착");
		return dao.insert(id,nickname,pw);
	}

	public ArrayList<AdminDTO> search(HashMap<String, String> params) {
		logger.info("관리자 검색 서비스 도착");
		return dao.search(params);
	}

	public ArrayList<MemberDTO> memberList() {
		logger.info("회원 리스트 서비스 도착");
		return dao.memberList();
	}

	public ArrayList<MemberDTO> blackList() {
		logger.info("블랙 리스트 서비스 도착");
		return dao.blackList();
	}

	public ArrayList<MemberDTO> withdrawList() {
		logger.info("탈퇴 리스트 서비스 도착");
		return dao.withdrawList();
	}

	public ArrayList<AdminDTO> memberSearch(HashMap<String, String> params) {
		logger.info("회원 검색 서비스 도착");
		return dao.memberSearch(params);
	}

	public ArrayList<AdminDTO> blackSearch(HashMap<String, String> params) {
		logger.info("블랙 회원 검색 서비스 도착");
		return dao.blackSearch(params);
	}

	public ArrayList<AdminDTO> withdrawSearch(HashMap<String, String> params) {
		logger.info("탈퇴 회원 검색 서비스 도착");
		return dao.withdrawSearch(params);
	}

	public Object detailMember(String id) {
		logger.info("회원 상세보기 서비스 도착");
		return dao.detailMember(id);
	}

	




}
