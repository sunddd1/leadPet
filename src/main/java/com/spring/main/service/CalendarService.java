package com.spring.main.service;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.CalendarDAO;


@Service
public class CalendarService {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CalendarDAO dao;
	
	
	public ModelAndView calendar() {
		ModelAndView mav = new ModelAndView();
		
		
		
		mav.setViewName("./cal/calendar");
		return mav;
	}

}
