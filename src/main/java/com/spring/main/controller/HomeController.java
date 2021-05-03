package com.spring.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.service.BoardService;

@Controller
public class HomeController {
	
	private final Logger logger = LoggerFactory.getLogger(this.getClass());
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home() {
		logger.info("home");

		return "home";
	}
	
//	@RequestMapping(value = "/Member", method = RequestMethod.GET)
//	public String home(Model model) {
//		logger.info("하이");
//		return "home";
//	}
	
	@GetMapping("/pointForm")
	public String pointForm() {
		return "point/pointForm";
	}
	
	

	
}
