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
	public int change(Model model, HttpSession session, @RequestParam(value="oriPass") String oriPass, @RequestParam(value="newPass") String newPass) {
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
		return "admin/adminList";
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
	
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public String insert(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 등록 요청");
		int success = service.insert();
//			page="admin/adminList";
//		}
		return "admin/adminInsert";
	}
		
}
