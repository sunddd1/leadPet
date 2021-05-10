package com.spring.main.service;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
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
		String id = (String) session.getAttribute("loginId");
		if(id==null) {
			id="...";
		}
		logger.info("스케줄 서비스 : " +start+"//"+last+"//"+id);
		ArrayList<VaccinDTO> vaccinList =  dao.vaccinList(start,last,id);

		logger.info("vaccinList : {}",vaccinList.size());
		
		ArrayList<SchedulerDTO> sche =  dao.scheduler(start,last,id);
		
		logger.info("sche : {}",sche);
		ArrayList<Vaccin_schedulerDTO> vacc = dao.vaccin_scheduler(start,last,id);

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
		String id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		ArrayList<SchedulerDTO> sche =  dao.scheduler(start,last,id);
		
		logger.info("sche : {}",sche);
		ArrayList<Vaccin_schedulerDTO> vacc = dao.vaccin_scheduler(start,last,id);

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
		String id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		logger.info("세션 아이디 : " +id);
		SchedulerDTO sche= dao.calendardetail(idx,id);
		sche.setD_day(sche.getD_day().substring(0,10));
		logger.info("지정날 : {}",sche.getD_day().substring(0,10));

		mav.addObject("sche", sche);
		mav.setViewName("./cal/calendardetail");
		return mav;
	}


	public ModelAndView vaccinDetail(String vac_idx, String vacc_sche_idx, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		ModelAndView mav = new ModelAndView();
		VaccinDTO vacc = dao.vaccinDetail(vac_idx);
		Vaccin_schedulerDTO check= null;
		logger.info("vacc_sche_idx : "+vacc_sche_idx);
		if(!vacc_sche_idx.equals("0")) {
			check = dao.vacc_scheSearch(vacc_sche_idx,id);						
		}
		logger.info("chgeck : "+check);
		mav.addObject("check", check);
		mav.addObject("vacc", vacc);
		mav.addObject("vacc_sche_idx", vacc_sche_idx);
		mav.setViewName("./cal/vaccinDetail");
		return mav;
	}


	
	@Transactional//vacc_idx,vac_idx,date,session
	public HashMap<String, Object> regVaccin(String vacc_idx, String vac_idx, String date, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int suc = 0;
		//조회 
		Vaccin_schedulerDTO vacc = dao.vacc_scheSearch(vacc_idx,id);
		logger.info("vacc 여부 : "+vacc);
		if(vacc!=null) {
			if(vacc.getExecuted().equals("N")) {
				suc = dao.updateVaccin(vac_idx,date,id);
				logger.info("수정 함 : "+vac_idx +"/"+date);				
			}
		}else {
			suc =  dao.regVaccin(vac_idx,date,id);
			int a = dao.regVaccin_suc(vac_idx);
			logger.info("a : "+a);
		}
		logger.info("suc : "+suc);

		map.put("suc", suc);
		return map;
	}
	
	

	public HashMap<String, Object> regSchedule(SchedulerDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int suc =0;
		if(dto.getSche_idx()>0) {
			logger.info("업데이트");
			suc =dao.updateSchedule(dto);
			logger.info("업데이트1");
		}else {
			logger.info("일정 등록");
			suc = dao.regSchedule(dto);
		}
		logger.info("suc : "+suc);
		map.put("suc", suc);
		return map;
	}

	public HashMap<String, Object> deleteSche(int idx, int type, int pet, HttpSession session) {
		String id = (String) session.getAttribute("loginId");
		HashMap<String, Object> map = new HashMap<String, Object>();
		int suc = 0;
		if(type==1) {//백신스케줄러
			logger.info("백신일정 삭제");
			suc=dao.deleteVaccSche(idx,id);
			if(suc>0) {
				suc +=dao.deleteVaccSche_suc(pet);				
			}
		}
		if(type==2) {//그냥 스케줄러
			logger.info("일정 삭제");
			suc=dao.deleteSche(idx,id);			
		}
		logger.info("suc : "+suc);
		map.put("suc", suc);
		return map;
	}
	@Transactional
	public HashMap<String, Object> executed(String vac_idx, String vacc_idx, String date, SchedulerDTO dto) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		int suc = 0;
		logger.info("vacc idx : "+vacc_idx);
		if(vacc_idx.equals("0")) {
			logger.info("스케줄 일정완료");
			suc= dao.schExecuted(vac_idx,dto.getId());
			if(dto.getCycle()>0) {
				suc+=dao.addSche(dto);				
			}
		}else {
			suc=dao.executed(vac_idx,dto.getId());
			if(suc>0) {
				// 일정이 완료되면 예상 추가 + 일정추가여부 수정				
				logger.info("등록 함 : "+vac_idx +"/"+date); 
				Date conDate=java.sql.Date.valueOf(date); 
				Date ZZinDate = new Date(dao.cycle(vacc_idx)*7*24*60*60*1000+conDate.getTime()); 
				logger.info("conDate 목 : {} ",ZZinDate);
				logger.info("캘린더 목록 요청 시작 : {} ",date+"/주기 : "+dao.cycle(vacc_idx)*7*24*60*60*1000);
				suc+=dao.upDateDay(vac_idx,ZZinDate);
				suc+=dao.upCnt(vac_idx);
						
			}			
		}
		map.put("suc", suc);
		return map;
	}

	public HashMap<String, Object> popup(String todate, String ladate, HttpSession session) {
		HashMap<String, Object> map = new HashMap<String, Object>();
		logger.info("팝업 서비스");
		String id = (String) session.getAttribute("loginId");
		if(id==null) {
			id="...";
		}
		ArrayList<Vaccin_schedulerDTO> list = dao.popup(todate,ladate,id);
		logger.info("list 내용물 : "+list);
		if(list.size()>0) {
			logger.info("list"+list.get(0).getD_day());
			map.put("list", list);			
		}
		//map.put("size", list.size());
		return map;
	}

	

	


}
