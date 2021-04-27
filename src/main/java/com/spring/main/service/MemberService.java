package com.spring.main.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;
@Service
public class MemberService {
	@Autowired MemberDAO memberDAO;
	
	//회원 탈퇴
	@Transactional
	public void withdrawal(MemberDTO dto) {
		memberDAO.withdrawal(dto);
	}
	
	
}
