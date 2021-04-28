package com.spring.main.dao;

import com.spring.main.dto.MemberDTO;

public interface LoginDAO {

	MemberDTO login(String id);

	String findId(String name, String email);

	int existId(String id, String name, String email);

}
