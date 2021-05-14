package com.spring.main.service;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.CoreMatchers.is;
import static org.mockito.Mockito.when;

import java.util.ArrayList;

import org.junit.Test;
import org.junit.runner.RunWith;
import org.mockito.InjectMocks;
import org.mockito.Mock;
import org.mockito.junit.MockitoJUnitRunner;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.MemberDTO;

@RunWith(MockitoJUnitRunner.class)
public class MemberServiceTest {
	
	@Mock
	MemberDAO memberDao;
	
	@InjectMocks
	MemberService memberService;
	
	@Test
	public void 내_아이디와_상대_아이디가_같으면_친구추가_불가() {
		// given
		String myId = "test123";
		String friendId = "test123";
		
		// when
		boolean result = memberService.addInterestId(myId, friendId);
		
		// then
		assertThat(result).isEqualTo(false);
	}
	
	@Test
	public void 내_아이디와_상대_아이디가_같으면_실패() {
		// given
		String myId = "test123";
		String friendId = "test123";
		
		// when
		boolean result = memberService.deleteInterestId(myId, friendId);
		
		// then
		assertThat(result).isEqualTo(false);
	}
	
	/*
	 * point < 200  -> 브론즈
	 * 200 <= point < 400  -> 실버
	 * 400 <= point < 600  -> 골드
	 * 600 <= point < 800  -> 플래티넘
	 * 800 <= point < 1000  -> 다이아몬드
	 */
	@Test
	public void 포인트별로_등급이_정상적으로_나오는지() {
		// given
		String ids[] = {"user1", "user2", "user3", "user4", "user5"};
		int scores[] = {0, 200, 400, 600, 800};
		ArrayList<MemberDTO> members = new ArrayList<MemberDTO>();
		
		for(int i = 0; i < ids.length; ++i) {
			MemberDTO member = new MemberDTO();
			member.setId(ids[i]);
			member.setPoint(scores[i]);
			members.add(member);
			
			when(memberDao.getMember(member.getId())).thenReturn(member);
		}
		
		String expected[] = {"브론즈", "실버", "골드", "플레티넘", "다이아몬드"};
		for(int i = 0; i < ids.length; ++i) {
			// when
			String result = memberService.updateGrade(members.get(i).getId());
			
			// then
			assertThat(result).isEqualTo(expected[i]);
		}
		
		
	}
}
