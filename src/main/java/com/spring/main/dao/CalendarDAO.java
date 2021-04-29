package com.spring.main.dao;

import java.sql.Date;
import java.util.ArrayList;

import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.dto.Vaccin_schedulerDTO;

public interface CalendarDAO {

	ArrayList<SchedulerDTO> scheduler(String start, String last);

	ArrayList<Vaccin_schedulerDTO> vaccin_scheduler(String start, String last);

	ArrayList<VaccinDTO> vaccinList(String start, String last ,String id);

	SchedulerDTO calendardetail(String idx);

	ArrayList<SchedulerDTO> calendarList(String date);

	VaccinDTO vaccinDetail(String idx);

	int regVaccin(String vac_idx, String date, String id);

	int upDateDay(String vac_idx,Date zZinDate);

	long cycle(String vacc_idx);

	int updateVaccin(String vac_idx, String date);

	int updateSchedule(SchedulerDTO dto);

	int regSchedule(SchedulerDTO dto);

	int deleteSche(int idx);

	int deleteVaccSche(int idx);

	int regVaccin_suc(String vac_idx);

	int deleteVaccSche_suc(int idx);

	VaccinDTO vacc_scheSearch(String vac_idx);

	int executed(int vac_idx);

	int executed(String vac_idx);

}
