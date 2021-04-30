package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.BoardDTO;

import oracle.jdbc.driver.Message;

public interface MemberDAO {


	String checkPw(String string);


	int restore(String loginId);

	int withdraw(String loginId);

	ArrayList<Message> MessageList(String loginId);

	void delMessage(int note_idx);

	void noteSend(String content, String loginId);


	ArrayList<Message> sendList(String loginId);


	ArrayList<Message> detailList(String loginId, int note_idx);


	void checked(int note_idx);


	BoardDTO writeList(String loginId);


	void upHit(int bbs_idx);


	BoardDTO detail(int bbs_idx);


	ArrayList<BoardDTO> fileList(int bbs_idx);

	
}
