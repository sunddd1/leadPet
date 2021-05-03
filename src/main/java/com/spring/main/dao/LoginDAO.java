package com.spring.main.dao;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;

public interface LoginDAO {

	MemberDTO userLogin(String id);

	AdminDTO adminLogin(String id);
	
	String findId(String name, String email);

	int existId(String id, String name, String email);

	

}
