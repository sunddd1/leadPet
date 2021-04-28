package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.dto.Vaccin_schedulerDTO;

public interface CalendarDAO {

	ArrayList<SchedulerDTO> scheduler(String start, String last);

	ArrayList<Vaccin_schedulerDTO> vaccin_scheduler(String start, String last);

	ArrayList<VaccinDTO> vaccinList(String start, String last ,String id);

	SchedulerDTO calendardetail(String idx, String type);

	ArrayList<SchedulerDTO> calendarList(String date);

	Vaccin_schedulerDTO vaccinDetail(String idx);

}
