package com.spring.main.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;

public interface MyNotiDAO {
	
	ArrayList<Message> MessageList(String loginId);

	void delMessage(int note_idx);

	void noteSend(String content, String loginId);
	
	void checked(int note_idx);
	
	ArrayList<Message> detailList(String loginId, int note_idx);

	ArrayList<Message> sendList(String loginId);
	
	String selectFalseCount(String loginId);

	int notiCheck(String loginId);

}
