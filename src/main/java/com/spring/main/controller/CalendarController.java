package com.spring.main.controller;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
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
	public @ResponseBody HashMap<String, Object> scheduler(@RequestParam String year,@RequestParam String smonth, HttpSession session) {
		String start = year+"/"+smonth+"/01";
		int a = Integer.parseInt(smonth)+1;
		if(a>12) {
			year= Integer.toString(Integer.parseInt(year)+1);
			a=1;
		}
		String last = year+"/"+a+"/01";
		logger.info("캘린더 요청 : {} / {} ",start,last);
		return service.scheduler(start,last,session);
	}


	@RequestMapping(value = "/calendarList", method = RequestMethod.GET)
	public  ModelAndView calendarList(@RequestParam String date, HttpSession session) {
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
		return service.calendarList(start,last,session);
	}
	
	
	@RequestMapping(value = "/calendardetail", method = RequestMethod.GET)
	public ModelAndView calendardetail(@RequestParam String idx, HttpSession session) {
		logger.info("캘린더 상세 요청 : {} ",idx);
		
		return service.calendardetail(idx,session);
	}
	
	@RequestMapping(value = "/vaccinDetail", method = RequestMethod.GET)
	public ModelAndView vaccinDetail(@RequestParam String vac_idx,@RequestParam String vacc_sche_idx, HttpSession session) {
		logger.info("idx : {}",vac_idx+"//"+vacc_sche_idx);
		return service.vaccinDetail(vac_idx,vacc_sche_idx,session);
	}

	
	@RequestMapping(value = "/regVaccin", method = RequestMethod.POST)//id 들어감
	public  @ResponseBody HashMap<String, Object> regVaccin(@RequestParam String vac_idx,@RequestParam String vacc_idx, @RequestParam String date, HttpSession session) {
		logger.info("vac_idx : {} / {}",vac_idx+"/"+vacc_idx,date);
		return service.regVaccin(vacc_idx,vac_idx,date,session);
	}
	
	@RequestMapping(value = "/regScheForm", method = RequestMethod.GET)
	public String regScheForm(HttpSession session,Model mav) {
		logger.info("등록폼");
		SimpleDateFormat format1 = new SimpleDateFormat ( "yyyy-MM-dd");
		Calendar time = Calendar.getInstance();
		logger.info("날짜" + format1.format((time.getTime())));
		mav.addAttribute("time", format1.format(time.getTime()));
		return "./cal/calendardetail";
	}
	
	@RequestMapping(value = "/regSchedule", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> regSchedule(HttpSession session,@ModelAttribute SchedulerDTO dto) {
		logger.info("파라메터들 : "+dto.getContent()+"/"+dto.getSubject()+"/"+dto.getCycle()+"/"+dto.getD_day()+"/"+dto.getSche_idx());
		dto.setId((String)session.getAttribute("loginId"));
		return service.regSchedule(dto);
	}
	
	@RequestMapping(value = "/deleteSche", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> deleteSche(HttpSession session,@RequestParam int idx, @RequestParam int type, @RequestParam int pet) {
		logger.info("삭제요청 파라메터들 : "+idx +"/"+type+"/"+pet);
		return service.deleteSche(idx,type,pet,session);
	}
	

	@RequestMapping(value = "/executed", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> executed(HttpSession session, @ModelAttribute SchedulerDTO dto,@RequestParam String vac_idx,@RequestParam String vacc_idx,@RequestParam String date) {
		logger.info("vac_idx : "+vac_idx+"//"+date);
		if(dto.getD_day() != null) {
			logger.info("dto : "+dto.getContent()+"//"+dto.getSubject()+"//"+dto.getCycle()+"//"+dto.getD_day());
			Date conDate=java.sql.Date.valueOf(dto.getD_day()); 
			Date ZZinDate = new Date(dto.getCycle()*7*24*60*60*1000+conDate.getTime()); 
			dto.setD_day(ZZinDate.toString());
			logger.info("찐 : "+ZZinDate+"//"+dto.getD_day());			
		}
		String id = (String) session.getAttribute("loginId");
		dto.setId(id);
		return service.executed(vac_idx,vacc_idx,date,dto);
	}
	
	@RequestMapping(value = "/popup", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> popup(HttpSession session,@RequestParam String todate,@RequestParam String ladate ) {
		logger.info("팝업 확인 : "+todate +"---"+ ladate);
		return service.popup(todate,ladate,session);
	}
	
	////////regVaccForm
	@RequestMapping(value = "/vaccList", method = RequestMethod.GET)
	public ModelAndView vaccList(HttpSession session) {
		logger.info("백신 리스트 불러오기");
		return service.vaccList(session);
	}
	@RequestMapping(value = "/regVaccForm", method = RequestMethod.GET)
	public String regVaccForm(HttpSession session) {
		logger.info("백신 리스트 불러오기");
		return "./admin/regVaccForm";
	}
	
	@RequestMapping(value = "/regVacc", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> regVacc(HttpSession session,@ModelAttribute VaccinDTO dto) {
		logger.info("dto 확인 : "+dto.getVacc_name()+"/"+dto.getContent()+"/"+dto.getCycle()+"/"+dto.getVacc_cnt()+"/"+dto.getDog_cat() );
		return service.regVacc(dto);
	}
	
	@RequestMapping(value = "/regVaccDetail", method = RequestMethod.GET)
	public ModelAndView regVaccDetail(HttpSession session,@RequestParam String vacc_idx) {
		logger.info("백신 상세보기 "+vacc_idx);
		return service.regVaccDetail(vacc_idx);
	}
	
	@RequestMapping(value = "/deleteVacc", method = RequestMethod.GET)
	public ModelAndView deleteVacc(HttpSession session,@RequestParam String vacc_idx) {
		logger.info("백신 삭제요청 "+vacc_idx);
		return service.deleteVacc(vacc_idx);
	}
	
	@RequestMapping(value = "/VaccSearch", method = RequestMethod.GET)
	public ModelAndView VaccSearch(HttpSession session,@RequestParam String keyword) {
		logger.info("백신 검색요청 "+keyword);
		return service.VaccSearch(keyword);
	}
}
