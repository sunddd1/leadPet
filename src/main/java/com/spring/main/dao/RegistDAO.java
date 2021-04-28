package com.spring.main.dao;

import com.spring.main.dto.MemberDTO;

public interface RegistDAO {

	int registMember(MemberDTO member);

	int checkDuplicateId(String id);

	int checkDuplicateNickname(String nickname);
	
}
