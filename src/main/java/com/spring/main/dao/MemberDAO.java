package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.MemberDTO;

public interface MemberDAO {


	String checkPw(String id);


	int restore(String loginId);

	int withdraw(String loginId);

	
	BoardDTO writeList(String loginId);


	void upHit(int bbs_idx);


	BoardDTO detail(int bbs_idx);


	ArrayList<BoardDTO> fileList(int bbs_idx);


	MemberDTO getMember(String id);


	int updateChangeDate(String id);


	int update(MemberDTO member);

	
}
