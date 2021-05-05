package com.spring.main.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.dto.Vaccin_schedulerDTO;

public interface CalendarDAO {

	ArrayList<SchedulerDTO> scheduler(String start, String last, String id);

	ArrayList<Vaccin_schedulerDTO> vaccin_scheduler(String start, String last, String id);

	ArrayList<VaccinDTO> vaccinList(String start, String last ,String id);

	SchedulerDTO calendardetail(String idx, String id);

	ArrayList<SchedulerDTO> calendarList(String date);

	VaccinDTO vaccinDetail(String vac_idx);

	int regVaccin(String vac_idx, String date, String id);

	int upDateDay(String vac_idx,Date zZinDate);

	long cycle(String vacc_idx);

	int updateVaccin(String vac_idx, String date, String id);

	int updateSchedule(SchedulerDTO dto);

	int regSchedule(SchedulerDTO dto);

	int deleteSche(int idx, String id);

	int deleteVaccSche(int idx, String id);

	int regVaccin_suc(String vac_idx);

	int deleteVaccSche_suc(int idx);

	Vaccin_schedulerDTO vacc_scheSearch(String vac_idx, String id);

	int executed(int vac_idx);

	int executed(String vac_idx, String id);

	ArrayList<Vaccin_schedulerDTO> popup(String todate, String ladate, String id);

	int upCnt(String vac_idx);

	int schExecuted(String vac_idx, String id);
	
	int addSche(SchedulerDTO dto);

	Object paging(int start, int end);

}
