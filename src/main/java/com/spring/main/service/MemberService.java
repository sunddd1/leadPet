package com.spring.main.service;

import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;
@Service
public class MemberService {
	@Autowired MemberDAO memberDAO;
	
	//회원 탈퇴
	@Transactional
	public void withdrawal(MemberDTO memberDTO) {
		memberDAO.withdrawal(memberDTO);
	}

	public void insertMessage(NoteDTO noteDTO) {
		memberDAO.insertMessage();
		
	}

	public ArrayList<Message> MessageList(String id) {
		return null;
	}
	
	
	
}
