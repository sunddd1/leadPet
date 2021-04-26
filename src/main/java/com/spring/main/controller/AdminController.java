package com.spring.main.controller;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.main.service.AdminService;

@Controller
public class AdminController {

private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
}
