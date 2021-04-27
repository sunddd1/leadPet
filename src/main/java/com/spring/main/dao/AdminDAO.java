package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;

public interface AdminDAO {

//	Object adminCheck(String loginId);

	ArrayList<AdminDTO> adminList();

	int change(String oriPass, String newPass);

	int adminDelete(String id);

	int insert();

}
