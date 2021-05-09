package com.spring.main.dao;

import java.util.ArrayList;
import java.util.List;

import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;

public interface MyNotiDAO {
	
	ArrayList<NoteDTO> MessageList(String id);

	void delMessage(int note_idx, String id);

	
	void checked(int note_idx);
	
	ArrayList<Message> detailList(String loginId, int note_idx);

	ArrayList<Message> sendList(String loginId);
//	
//	String selectFalseCount(String loginId);

	int notiCheck(String loginId);

	void noteSend(String id, String content, String receiving_id);

}
