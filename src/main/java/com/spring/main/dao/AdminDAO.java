package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;

public interface AdminDAO {

//	Object adminCheck(String loginId);

	ArrayList<AdminDTO> adminList();

	int change(String oriPass, String newPass);

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

	




}
