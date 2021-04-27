package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.CalendarDAO;
import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.dto.Vaccin_schedulerDTO;


@Service
public class CalendarService {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CalendarDAO dao;
	
	
	public HashMap<String, Object> scheduler(String start, String last) {
		ArrayList<VaccinDTO> vaccinList =  dao.vaccinList(start,last,"testId");

		logger.info("vaccinList : {}",vaccinList.size());
		
		ArrayList<SchedulerDTO> sche =  dao.scheduler(start,last);
		
		logger.info("sche : {}",sche);
		ArrayList<Vaccin_schedulerDTO> vacc = dao.vaccin_scheduler(start,last);

		logger.info("vacc : {}",vacc);
		
		HashMap<String, Object> map = new HashMap<String, Object>();
		map.put("vaccinList",vaccinList);
		map.put("sche",sche);
		map.put("vacc",vacc);
		logger.info(""+map.get("vaccinList"));
		return map;
		
	
	}


	public ModelAndView calendarList(String start, String last) {
		ModelAndView mav = new ModelAndView();
		ArrayList<SchedulerDTO> sche =  dao.scheduler(start,last);
		
		logger.info("sche : {}",sche);
		ArrayList<Vaccin_schedulerDTO> vacc = dao.vaccin_scheduler(start,last);

		logger.info("vacc : {}",vacc);
		String year =start.substring(0, start.indexOf("/"));
		String month =start.substring(start.indexOf("/")+1,start.lastIndexOf("/"));
		String day = start.substring(start.lastIndexOf("/")+1,start.length());
		
		logger.info("무슨 날인가 ? {}",year+month+day);

		mav.addObject("year", year);
		mav.addObject("month", month);
		mav.addObject("day", day);
		mav.addObject("sche", sche);
		mav.addObject("vacc", vacc);
		mav.setViewName("./cal/calendarList");
		/*
		 * HashMap<String, Object> map = new HashMap<String, Object>();
		 * map.put("sche",sche); map.put("vacc",vacc);
		 */
		return mav;
	}


	public ModelAndView calendardetail(String idx, String type) {
		ModelAndView mav = new ModelAndView();
		SchedulerDTO sche= dao.calendardetail(idx,type);
		sche.setD_day(sche.getD_day().substring(0,10));
		logger.info("지정날 : {}",sche.getD_day().substring(0,10));
		mav.addObject("sche", sche);
		mav.setViewName("./cal/calendardetail");
		return mav;
	}




}
