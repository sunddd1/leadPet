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
import org.springframework.web.servlet.ModelAndView;

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
		logger.info("캘린더 요청 : {} / {} ",start,last);
		return service.scheduler(start,last);
	}


	@RequestMapping(value = "/calendarList", method = RequestMethod.GET)
	public @ResponseBody ModelAndView calendarList(@RequestParam String date) {
		logger.info("캘린더 목록 요청 : {}",date);
		String year =date.substring(0, date.indexOf("/"));
		String month =date.substring(date.indexOf("/")+1,date.lastIndexOf("/"));
		String day = date.substring(date.lastIndexOf("/")+1,date.length());
		String start=year+"/"+month+"/"+day;
		logger.info("캘린더 목록 요청 시작 : {} ",start);

		int year1 = Integer.parseInt(year);
		int month1 = Integer.parseInt(month);
		int day1 = Integer.parseInt(day)+1;
		
		if(day1>31) {
			day1=1;
			month1 += 1;
			if(month1 == 13) {
				year1 +=1;
				month1 = 1;
			}
		}else if(day1 >30) {
			if(month1 == 4 || month1 == 6 || month1 == 9 || month1 == 11) {
				day1=1;
				month1 += 1;
			}
		}else if(day1 >29) {
			if(month1 ==2 && (year1%4)==0 ) {
				day1= 1;
				month1 += 1;
			}
		}else if(day1 >28) {
			if(month1 ==2) {
				day1= 1;
				month1 += 1;
			}
		}		
		year = Integer.toString(year1);
		month = Integer.toString(month1);
		day = Integer.toString(day1);
		
		logger.info("캘린더 목록 요청11 : {} ",year);
		logger.info("캘린더 목록 요청11 : {} ",month);
		logger.info("캘린더 목록 요청11 : {} ",day);
		String last = year+"/"+month+"/"+ day;

		logger.info("캘린더 목록 요청 종료 : {} ",last);
		return service.calendarList(start,last);
	}
	
	
	@RequestMapping(value = "/calendardetail", method = RequestMethod.GET)
	public ModelAndView calendardetail(@RequestParam String idx,@RequestParam String type,@RequestParam String date) {
		logger.info("캘린더 상세 요청 : {} /{}",idx,type+"/"+date);
		
		return service.calendardetail(idx,type);
	}
	
	@RequestMapping(value = "/calendarListMove", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> calendarListMove(@RequestParam String date) {
		
		return null;
	}
	
}
