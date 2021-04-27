package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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




}
