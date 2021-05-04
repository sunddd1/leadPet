package com.spring.main.service;

import java.sql.Date;
import java.util.ArrayList;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spring.main.dao.AdminDAO;

@Service
public class ScheduleService {

	@Autowired AdminDAO dao;
	
	//@Scheduled(fixedDelay = 5000)//밀리세컨드 기준 5초 기다렸다가 실행
	//@Scheduled(fixedRate = 5000)//5초마다 실행
	//fixed... 를 사용하면 반복 주기를 밀리세컨드로 계산해야해서 복잡하다.
	//그래서 표현이 더 다양한 cron을 주로 사용한다.
	@Scheduled(cron = "0 0 0 * * *")//초 분 시 일 월 요일 연도(생략가능)
	public void loop_free() {
		Date date = new Date(System.currentTimeMillis()+24*60*60*1000);
		System.out.println(date.toString());
		ArrayList<String> criminal = dao.loop_free(date.toString());
		System.out.println(criminal);
		if(criminal.size()>0) {
			for (int i = 0; i < criminal.size(); i++) {
				dao.freedom(criminal.get(i));
			}
		}
	}
	
}
