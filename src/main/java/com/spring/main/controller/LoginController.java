package com.spring.main.controller;

import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	
	@GetMapping("/loginForm")
	public String loginForm() {
		logger.info("loginForm 요청");
		
		return "login/loginForm";
	}
	
	@PostMapping("/regist")
	public ModelAndView regist(@ModelAttribute MemberDTO member) {
		logger.info("regist 요청");
		
		return registService.regist(member);
	}
	
	@GetMapping("/registForm")
	public String registForm() {
		logger.info("registForm 요청");
		
		return "login/registForm";
	}	
	
	// 아래부터 ajax 부분
	
	@GetMapping("/check-duplicate-id")
	@ResponseBody
	public boolean checkDuplicateId(@RequestParam String id) {
		logger.info("checkDuplicateId 요청");

		return registService.checkDuplicateId(id);
	}
	
	@GetMapping("/check-duplicate-nickname")
	@ResponseBody
	public boolean checkDuplicateNickname(@RequestParam String nickname) {
		logger.info("checkDuplicateNickname 요청");
		
		return registService.checkDuplicateNickname(nickname);
	}
}
