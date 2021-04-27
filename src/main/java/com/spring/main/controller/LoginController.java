package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MemberDTO;
import com.spring.main.service.LoginService;
import com.spring.main.service.RegistService;

@Controller
public class LoginController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	
	private final LoginService loginService;
	private final RegistService registService;
	
	@Autowired
	public LoginController(LoginService loginService, RegistService registService) {
		this.loginService = loginService;
		this.registService = registService;
	}
	
	@PostMapping("/login")
	public ModelAndView login(@RequestParam String id, @RequestParam String password) {
		logger.info("login 요청");
		
		return loginService.login(id, password);
	}
	
	@PostMapping("/regist")
	public ModelAndView regist(@ModelAttribute MemberDTO member) {
		logger.info("regist 요청");
		
		return registService.regist(member);
	}
}
