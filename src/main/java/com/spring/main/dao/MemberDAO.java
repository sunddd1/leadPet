package com.spring.main.dao;

import java.util.ArrayList;

import oracle.jdbc.driver.Message;

public interface MemberDAO {


	void insertMessage();

	String checkPw(String string);


	int restore(String loginId);

	int withdrawa(String loginId);

	ArrayList<Message> MessageList(String loginId);

	
	void delMessage(int note_idx);

	
}
