package com.spring.main.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

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
	public ModelAndView login(HttpSession session ,@RequestParam String id, @RequestParam String password) {
		logger.info("login 요청");
		
		ModelAndView mav = new ModelAndView();
		String msg = "로그인에 실패했습니다.";
		
		LoginService.Type loginType = loginService.login(id, password);

		if(loginType != LoginService.Type.NONE) {
			session.setAttribute("loginId", id);
		}
		
		switch (loginType) {
		case ADMIN:
			session.setAttribute("isMaganer", true);
			break;
			
		case USER:
			break;
			
		case WITHDRAW:
			return new ModelAndView("/Member/restore");
			
		default:
			logger.info("로그인 실패");
			
			return new ModelAndView("/login/loginForm", "msg", msg);
		}

		msg = "로그인에 성공했습니다.";
		
		mav.setViewName("home");
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	@GetMapping("/login-form")
	public String loginForm() {
		logger.info("loginForm 요청");
		
		return "login/loginForm";
	}
	
	@GetMapping("/find-id-form")
	public String findIdForm() {
		logger.info("findIdForm 요청");
		
		return "login/findIdForm";
	}
	
	@GetMapping("/change-pw-form")
	public String changePwForm() {
		logger.info("changePwForm 요청");

		return "login/changePwForm";
	}
	
	@PostMapping("/change-pw")
	public String changePw(@RequestParam String id, @RequestParam String password) {
		logger.info("changePw 요청");

		return registService.changePw(id, password) ? "login/loginForm" : "login/changePwForm";
	}
	
	@PostMapping("/regist")
	public ModelAndView regist(@ModelAttribute MemberDTO member) {
		logger.info("regist 요청");
		
		ModelAndView mav = new ModelAndView();
		String viewName = "/login/regist";
		String msg = "회원가입에 실패했습니다.";
		
		if(registService.regist(member)) {
			viewName = "/login/loginForm";
			msg = "회원가입에 성공했습니다.";
		}
		
		mav.setViewName(viewName);
		mav.addObject("msg", msg);
		
		return mav;
	}
	
	@GetMapping("/registForm")
	public String registForm() {
		logger.info("registForm 요청");
		
		return "login/registForm";
	}
	
	@GetMapping("/logout")
	public String logout(HttpSession session) {
		logger.info("logout 요청");
		if(session.getAttribute("isMaganer") != null) {
			session.removeAttribute("isMaganer");
		}
		session.removeAttribute("loginId");
		return "redirect:/";
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
		
		Map<String, Object> output = new HashMap<String, Object>();
		String searchId = loginService.findId(name, email);
		
		if(searchId != null) {
			output.put("result", true);
			output.put("id", searchId);
		}
		
		return output;
	}
	
	@GetMapping("/exist-id")
	@ResponseBody
	public boolean existId(@RequestParam String id, @RequestParam String name,
										@RequestParam String email) {
		logger.info("existId 요청");
		
		return loginService.existId(id, name, email);
	}
}
