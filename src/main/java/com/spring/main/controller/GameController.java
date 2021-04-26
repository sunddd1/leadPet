package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.spring.main.service.GameService;

@Controller
public class GameController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GameService service;

	@RequestMapping(value = "/game", method = RequestMethod.GET)
	public String home(Model model) {
		return "home";
	}
}
