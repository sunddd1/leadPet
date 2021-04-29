package com.spring.main.controller;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	public ModelAndView login(HttpServletRequest req ,@RequestParam String id, @RequestParam String password) {
		logger.info("login 요청");
		
		return loginService.login(req, id, password);
	}
	
	@GetMapping("/loginForm")
	public String loginForm() {
		logger.info("loginForm 요청");
		
		return "login/loginForm";
	}
	
	@GetMapping("/findIdForm")
	public String findIdForm() {
		logger.info("findIdForm 요청");
		
		return "login/findIdForm";
	}
	
	@GetMapping("/changePwForm")
	public String changePwForm() {
		logger.info("changePwForm 요청");

		return "login/changePwForm";
	}
	
	@GetMapping("/changePw")
	public String changePw(@RequestParam String id, @RequestParam String password) {
		logger.info("changePw 요청");
		
		return registService.changePw(id, password);
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
	
	@GetMapping("/logout")
	public String logout(HttpServletRequest req) {
		logger.info("logout 요청");
		
		req.removeAttribute("loginId");
		return "main";
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
	
	@GetMapping("/find-id")
	@ResponseBody
	public Map<String, Object> findId(@RequestParam String name, @RequestParam String email) {
		logger.info("findId 요청");
		
		return loginService.findId(name, email);
	}
	
	@GetMapping("/exist-id")
	@ResponseBody
	public boolean existId(@RequestParam String id, @RequestParam String name,
										@RequestParam String email) {
		logger.info("existId 요청");
		
		return loginService.existId(id, name, email);
	}
}
