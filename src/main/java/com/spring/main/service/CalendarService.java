package com.spring.main.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.CalendarDAO;
import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.dto.Vaccin_schedulerDTO;


@Service
public class CalendarService {

	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired CalendarDAO dao;
	
	@Transactional
	public HashMap<String, Object> scheduler(String start, String last, HttpSession session) {
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

	@Transactional
	public ModelAndView calendarList(String start, String last, HttpSession session) {
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

		return mav;
	}


	public ModelAndView calendardetail(String idx, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		SchedulerDTO sche= dao.calendardetail(idx);
		sche.setD_day(sche.getD_day().substring(0,10));
		logger.info("지정날 : {}",sche.getD_day().substring(0,10));
		mav.addObject("sche", sche);
		mav.setViewName("./cal/calendardetail");
		return mav;
	}


	public ModelAndView vaccinDetail(String idx, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		VaccinDTO vacc = dao.vaccinDetail(idx);
		mav.addObject("vacc", vacc);
		mav.setViewName("./cal/vaccinDetail");
		return mav;
	}

	@Transactional//vacc_idx,vac_idx,date,session
	public HashMap<String, Object> regVaccin(String vacc_idx, String vac_idx, String date, HttpSession session) {
		String id = "testId";
		int suc =  dao.regVaccin(vac_idx,date,id);
		long cycle = dao.cycle(vacc_idx)*7*24*60*60*1000;
		/*
		 * int year = Integer.parseInt(date.substring(0, date.indexOf("-"))); int month
		 * =Integer.parseInt(date.substring(date.indexOf("-")+1,date.lastIndexOf("-")));
		 * int day =conDate.getTime()+vac_idx='9988' 
		 * Integer.parseInt(date.substring(date.lastIndexOf("-")+1,date.length()));
		 */
		
		Date conDate =java.sql.Date.valueOf(date);
		long a =cycle;
		Date ZZinDate = new Date(a+conDate.getTime());
		logger.info("conDate 목 : {} ",ZZinDate);
		logger.info("캘린더 목록 요청 시작 : {} ",date+"/주기 : "+cycle);
		suc+=dao.upDateDay(vac_idx,ZZinDate);
		HashMap<String, Object> map = new HashMap<String, Object>();
		return map;
	}




}
