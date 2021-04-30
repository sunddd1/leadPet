package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;

public interface AdminDAO {

//	Object adminCheck(String loginId);

	ArrayList<AdminDTO> adminList();

	int change(String newPass, String id);

	int adminDelete(String id);

	int idCheck(String id);

	int nickCheck(String nickname);

	int insert(String id, String nickname, String pw);

	ArrayList<AdminDTO> search(HashMap<String, String> params);

	ArrayList<MemberDTO> memberList();

	ArrayList<MemberDTO> blackList();

	ArrayList<MemberDTO> withdrawList();

	ArrayList<AdminDTO> memberSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> blackSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> withdrawSearch(HashMap<String, String> params);

	Object detailMember(String id);

	int restoreWithdraw(String id);

	ArrayList<AdminDTO> detailPet(String id);

	String toggleMemberDisable(String id);

	int memberBlackY(String id);

	int memberBlackN(String id);

	String insertBlack(String id);

	ArrayList<AdminDTO> reportList();

	ArrayList<AdminDTO> finishList();

	ArrayList<AdminDTO> replyList();

	ArrayList<AdminDTO> finishReplyList();
	
	

	ArrayList<AdminDTO> tipReportList();

	ArrayList<AdminDTO> galReportList();

	ArrayList<AdminDTO> fedReportList();

	ArrayList<AdminDTO> resReportList();

	ArrayList<AdminDTO> runReportList();

	ArrayList<AdminDTO> reportSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> finishListSearch(HashMap<String, String> params);

//	ArrayList<AdminDTO> typeReportList(String type);

	




}
