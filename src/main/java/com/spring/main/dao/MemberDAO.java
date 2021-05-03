package com.spring.main.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;

public interface MemberDAO {


	String checkPw(String string);


	int restore(String loginId);

	int withdraw(String loginId);

	
	BoardDTO writeList(String loginId);


	void upHit(int bbs_idx);


	BoardDTO detail(int bbs_idx);


	ArrayList<BoardDTO> fileList(int bbs_idx);


	

	
}
