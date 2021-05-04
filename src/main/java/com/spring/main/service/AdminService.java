package com.spring.main.service;

import java.sql.Date;
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

	public int change(String newPass, String id) {
		logger.info("비밀번호 수정 서비스 도착");
		return dao.change(newPass,id);
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

	public ArrayList<AdminDTO> detailPet(String id) {
		logger.info("반려동물 상세보기 서비스 도착");
		return dao.detailPet(id);
	}
	
	public int restoreWithdraw(String id) {
		logger.info("회원 복구 서비스 도착");
		return dao.restoreWithdraw(id);
	}

	public String toggleMemberDisable(String id) {
		logger.info("블랙 서비스 요청");
		return dao.toggleMemberDisable(id);
	}

	public int memberBlackY(String id, Date black_date) {
		logger.info("블랙 요청");
		return dao.memberBlackY(id,black_date);
	}

	public int memberBlackN(String id) {
		logger.info("블랙 해제 요청");
		return dao.memberBlackN(id);
	}

	public String insertBlack(String id) {
		logger.info("블랙 추가 요청");
		return dao.insertBlack(id);
	}

	public ArrayList<AdminDTO> reportList() {
		logger.info("미처리 신고 서비스 요청");
		return dao.reportList();
	}

	public ArrayList<AdminDTO> finishList() {
		logger.info("처리 신고 서비스 요청");
		return dao.finishList();
	}

	public ArrayList<AdminDTO> replyList() {
		logger.info("미처리 댓글 서비스 요청");
		return dao.replyList();
	}

	public ArrayList<AdminDTO> finishReplyList() {
		logger.info("처리 댓글 신고 서비스 요청");
		return dao.finishReplyList();
	}

	public ArrayList<AdminDTO> tipReportList() {
		logger.info("팁 신고 서비스 요청");
		return dao.tipReportList();
	}

	public ArrayList<AdminDTO> galReportList() {
		logger.info("갤러리 신고 서비스 요청");
		return dao.galReportList();
	}

	public ArrayList<AdminDTO> fedReportList() {
		logger.info("사료 신고 서비스 요청");
		return dao.fedReportList();
	}

	public ArrayList<AdminDTO> resReportList() {
		logger.info("식당 신고 서비스 요청");
		return dao.resReportList();
	}

	public ArrayList<AdminDTO> runReportList() {
		logger.info("산책 신고 서비스 요청");
		return dao.runReportList();
	}

	public ArrayList<AdminDTO> reportSearch(HashMap<String, String> params) {
		logger.info("미처리 신고 검색 서비스 도착");
		return dao.reportSearch(params);
	}

	public ArrayList<AdminDTO> finishListSearch(HashMap<String, String> params) {
		logger.info("처리 신고 검색 서비스 도착");
		return dao.finishListSearch(params);
	}

	public Object detailReply(int id) {
		logger.info("신고댓글 상세보기 서비스 도착");
		return dao.detailReply(id);
	}

	public ArrayList<AdminDTO> blindNList() {
		logger.info("블라인드 리스트 서비스 도착");
		return dao.blindNList();
	}

	public ArrayList<AdminDTO> blindYList() {
		logger.info("블라인드 리스트 서비스 도착");
		return dao.blindYList();
	}

	public int blindY(int idx) {
		logger.info("블라인드 Y처리 서비스 도착");
		return dao.blindY(idx);
	}

	public int blindN(int idx) {
		logger.info("블라인드 N처리 서비스 도착");
		return dao.blindN(idx);
	}

	public ArrayList<AdminDTO> blindNSearch(HashMap<String, String> params) {
		logger.info("블라인드 N 닉네임 검색 서비스 도착");
		return dao.blindNSearch(params);
	}

	public ArrayList<AdminDTO> blindYSearch(HashMap<String, String> params) {
		logger.info("블라인드 Y 닉네임 검색 서비스 도착");
		return dao.blindYSearch(params);
	}

	public int blackDate(int black) {
		logger.info("블랙 날짜 서비스 도착");
		return dao.blackDate(black);
		
	}

//	public ArrayList<AdminDTO> typeReportList(String type) {
//		logger.info("타입 신고 서비스 요청");
//		return dao.typeReportList(type);
//	}


	




}
