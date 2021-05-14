package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MemberDAO;
import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.InterestUserDTO;
import com.spring.main.dto.MemberDTO;
@Service
public class MemberService {
	@Autowired MemberDAO dao;
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
//	//회원 탈퇴
//	@Transactional
//	public void withdrawal(String loginId) {
//		dao.withdrawal(loginId);
//	}

	

	
	public boolean checkPw(String id, String pw) {
		logger.info("비밀번호 확인 요청");
		
		String DBpass = dao.checkPw(id);

		logger.info("DB 비밀번호 : "+DBpass);
		logger.info("입력한 비밀번호 : "+pw);

		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		return encoder.matches(pw, DBpass);
	}

	public boolean withdraw(String id, String pw) {
		//비번 일치 확인 
		boolean result = checkPw(id, pw);
		if(result) {
			//탈퇴 
			dao.withdraw(id);
		}

		return result;
	}

	public boolean restore(String id, String pw) {
		//비번 일치 확인 
		boolean result = checkPw(id, pw);
		if(result) {
			// 복구
			dao.restore(id);
		}

		return result;
	}

	

	public MemberDTO getMember(String id) {
		logger.info(id);
		
		return dao.getMember(id);
	}

	public ModelAndView writeList(String id) {
		ModelAndView mav = new ModelAndView();
		logger.info("목록 불러오는 중");
		logger.info("요청 유저 닉네임 : "+id);
		String page = "home";
		ArrayList<BoardDTO> dto = dao.writeList(id);
		logger.info("작성글 크기 :"+dto.size());
		if(dto.size()>0) {
			page="Member/writeList";
			mav.addObject("write", dto);
			mav.addObject("nickNameId", id);
		}
		if(dto.size()==0) {//작성한 글이 없을 때 
			String msg = "작성된 글이 없습니다.";
			return new ModelAndView(page, "msg", msg);
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView detailWriteList(int bbs_idx) {
		logger.info(bbs_idx+"번 상세보기");
		BoardDTO dto = dao.detail(bbs_idx);//글 상세보기 
		ArrayList<BoardDTO> fileList = dao.fileList(bbs_idx);//해당 글 파일 목록 
		ModelAndView mav = new ModelAndView();
		mav.setViewName("Member/writeDetail");
		return mav;
	}

	public boolean updateChangeDate(String id) {
		logger.info("멤버 탈퇴일 최신으로 변경");
		
		return dao.updateChangeDate(id) > 0;
	}

	public int update(MemberDTO member) {
		logger.info("멤버 업데이트");
		
		BCryptPasswordEncoder encoder = new BCryptPasswordEncoder();
		member.setPassword(encoder.encode(member.getPassword()));
		
		return dao.update(member);
	}

	public String deleteWriteList(int bbs_idx) {
		String loginId="test1122";
		logger.info(bbs_idx+"번 삭제("+loginId+")");
		dao.deleteWriteList(loginId,bbs_idx);
		return "redirect:/writeList";
	}
	
	@Transactional
	public String updateGrade(String id) {
		logger.info("등급 업데이트");
		
		MemberDTO member = dao.getMember(id);
		
		int point = member.getPoint();
		String grade = null;
		
		if(point < 200) {
			grade = "브론즈";
		} else if(point < 400) {
			grade = "실버";
		} else if(point < 600) {
			grade = "골드";
		} else if(point < 800) {
			grade = "플레티넘";
		} else if(point < 1000) {
			grade = "다이아몬드";
		}
		
		member.setGrade(grade);
		dao.update(member);
		
		return grade;
	}
	
	public boolean addInterestId(String myId, String friendId) {
		logger.info("addInterestId 호출");
		
		if(myId.equals(friendId)) {
			return false;
		}
		
		return dao.addInterestId(myId, friendId) > 0;
	}
	
	public boolean deleteInterestId(String myId, String friendId) {
		logger.info("deleteInterestId 호출");
		
		if(myId.equals(friendId)) {
			return false;
		}
		
		return dao.deleteInterestId(myId, friendId) > 0;
	}

	public boolean hasInterestId(String myId, String interestId) {
		logger.info("hasInterestId 호출");
		
		return dao.hasInterestId(myId, interestId) > 0;
	}

	public HashMap<String, Object> getInterestUsers(String myId, int cntPerPage, int page) {
		logger.info("getInterestUsers 호출");
		
		int allCnt = dao.getInterestUserCount(myId);
		if(allCnt == 0) {
			allCnt = 1;
		}
		
		int range = allCnt % cntPerPage > 0 ? Math.round(allCnt/cntPerPage)+1 : Math.round(allCnt/cntPerPage);
		
		page = page>range ? range : page;
		
		// 시작, 끝
		int end = page * cntPerPage;
		int start = end - cntPerPage + 1;
		
		logger.info("start : {} end : {}", start, end);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("list", dao.getInterestUserList(myId, start, end));
			
		map.put("range", range);
		map.put("curPage", page);
		
		return map;
	}

	public String findIdByNickname(String nickname) {
		logger.info("findIdByNickname 호출");
		
		return dao.findIdByNickname(nickname);
	}
}
