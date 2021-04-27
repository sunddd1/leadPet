package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.spring.main.service.CalendarService;

@Controller
public class CalendarController {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired CalendarService service;

	@RequestMapping(value = "/calendar", method = RequestMethod.GET)
	public String home() {
		logger.info("캘린더 요청");
		
		return "./cal/calendar";
	}
	
	@RequestMapping(value = "/scheduler", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> scheduler(@RequestParam String year,@RequestParam String smonth) {
		String start = year+"/"+smonth+"/01";
		int a = Integer.parseInt(smonth)+1;
		if(a>12) {
			year= Integer.toString(Integer.parseInt(year)+1);
			a=1;
		}
		String last = year+"/"+a+"/01";
		logger.info("캘린더 요청 : {} / {}",start,last);
		return service.scheduler(start,last);
	}
	
	@RequestMapping(value = "/calendarList", method = RequestMethod.GET)
	public String calendarList(@RequestParam String date) {
		logger.info("캘린더 목록 요청 : {}",date);
		
		return "./cal/calendarList";
	}
	
	
}
