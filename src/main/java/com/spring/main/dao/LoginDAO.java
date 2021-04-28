package com.spring.main.dao;

import com.spring.main.dto.MemberDTO;

public interface LoginDAO {

	MemberDTO login(String id);

	String findId(String id, String email);

}
