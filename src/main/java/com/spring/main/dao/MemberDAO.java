package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;

public interface MemberDAO {


	String checkPw(String string);


	int restore(String loginId);

	int withdrawa(String loginId);

	ArrayList<Message> MessageList(String loginId);

	void delMessage(int note_idx);

	void noteSend(NoteDTO dto);


	void noteSend(String content, String loginId);


	ArrayList<Message> sendList(String loginId);


	NoteDTO detailNoteList(String loginId, int note_idx, String id);


	MemberDTO getMember(String id);


	int updateChangeDate(String id);


	int update(MemberDTO member);

	
}
