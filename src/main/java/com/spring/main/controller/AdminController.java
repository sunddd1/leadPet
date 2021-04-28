package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.service.AdminService;

@Controller
public class AdminController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<AdminDTO> list = service.list();
			logger.info("관리자 수"+list.size());
			model.addAttribute("adminList", list);
//			page="admin/adminList";
//		}
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public String changePass(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 비밀번호 수정 팝업요청");
//			page="admin/adminList";
//		}
		return "admin/changePass";
	}
	
	@ResponseBody
	@RequestMapping(value = "/change", method = RequestMethod.GET)
	public int change
		(
			Model model, 
			HttpSession session, 
			@RequestParam(value="oriPass") String oriPass,
			@RequestParam(value="newPass") String newPass
		) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(oriPass+"/"+newPass);
		logger.info("관리자 비밀번호 수정 요청");
		int success = service.change(oriPass,newPass);
		logger.info("비밀번호 수정 성공여부 :"+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/adminDelete", method = RequestMethod.GET)
	public String adminDelete(Model model, HttpSession session, @RequestParam String id) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 삭제 요청");
		logger.info("삭제할 id="+id);
		int success = service.adminDelete(id);
//			page="admin/adminList";
//		}
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/adminInsert", method = RequestMethod.GET)
	public String adminInsert(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 등록 팝업요청");
//			page="admin/adminList";
//		}
		return "admin/adminInsert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public int  idCheck(
			Model model, 
			HttpSession session,
			@RequestParam(value="id") String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("아이디 중복체크 요청");
		int success = service.idCheck(id);
		logger.info("아이디 중복여부:"+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.GET)
	public int  nickCheck(
			Model model, 
			HttpSession session,
			@RequestParam(value="nickname") String nickname
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("닉네임 중복체크 요청");
		int success = service.nickCheck(nickname);
		logger.info("닉네임 중복여부:"+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public int insert(
			Model model, 
			HttpSession session,
			@RequestParam(value="id") String id,
			@RequestParam(value="nickname") String nickname,
			@RequestParam(value="pw") String pw
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 등록 요청");
		int success = service.insert(id,nickname,pw);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.search(params);
		logger.info("검색된 관리자 수"+list.size());
		model.addAttribute("adminList", list);
//			page="admin/adminList";
//		}
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<MemberDTO> list = service.memberList();
			logger.info("일반 회원 수"+list.size());
			model.addAttribute("memberList", list);
//			page="admin/adminList";
//		}
		return "admin/memberList";
	}
	
	@RequestMapping(value = "/blackList", method = RequestMethod.GET)
	public String blackList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<MemberDTO> list = service.blackList();
			logger.info("블랙 회원 수"+list.size());
			model.addAttribute("blackList", list);
//			page="admin/adminList";
//		}
		return "admin/blackList";
	}
	
	@RequestMapping(value = "/withdrawList", method = RequestMethod.GET)
	public String withdrawList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<MemberDTO> list = service.withdrawList();
			logger.info("탈퇴 회원 수"+list.size());
			model.addAttribute("withdrawList", list);
//			page="admin/adminList";
//		}
		return "admin/withdrawList";
	}
	
	@RequestMapping(value = "/memberSearch", method = RequestMethod.POST)
	public String memberSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("회원 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.memberSearch(params);
		logger.info("검색된 회원 수"+list.size());
		model.addAttribute("memberList", list);
//			page="admin/adminList";
//		}
		return "admin/memberList";
	}
	
	@RequestMapping(value = "/blackSearch", method = RequestMethod.POST)
	public String blackSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("블랙 회원 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.blackSearch(params);
		logger.info("검색된 블랙 회원 수"+list.size());
		model.addAttribute("blackList", list);
//			page="admin/adminList";
//		}
		return "admin/blackList";
	}
	
	@RequestMapping(value = "/withdrawSearch", method = RequestMethod.POST)
	public String withdrawSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("탈퇴 회원 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.withdrawSearch(params);
		logger.info("검색된 탈퇴 회원 수"+list.size());
		model.addAttribute("withdrawList", list);
//			page="admin/adminList";
//		}
		return "admin/withdrawList";
	}
	
	@RequestMapping(value = "/detailMember", method = RequestMethod.GET)
	public String detailMember(
			Model model, 
			HttpSession session,
			@RequestParam String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("회원 상세보기 팝업요청");
		model.addAttribute("dto",service.detailMember(id));
//			page="admin/adminList";
//		}
		return "admin/detailMember";
	}
	
	@RequestMapping(value = "/restoreWithdraw", method = RequestMethod.GET)
	public int restoreWithdraw(
			Model model, 
			HttpSession session,
			@RequestParam(value="id") String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("회원 복구 요청");
		int success = service.restoreWithdraw(id);
//			page="admin/adminList";
//		}
		return success;
	}
}
