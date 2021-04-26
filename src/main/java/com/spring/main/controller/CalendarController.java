package com.spring.main.controller;

import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.CalendarService;

@Controller
public class CalendarController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarService service;

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public ModelAndView home(Locale locale, Model model) {
		logger.info("캘린더 요청");
		
		return service.calendar();
	}
}
