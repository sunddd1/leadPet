package com.spring.main.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dao.GameDAO;
import com.spring.main.dto.GameDTO;

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

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GameDAO gameDao;
	//"0 0 0 * * MON"
	@Scheduled(cron = "0 0 0 * * MON")
	public void loop_makeWeekQ() {
		//월요일 00시가 되면 week_quiz / week_nemo에 겹치지 않게 문제를 넣는다
		//지난 주차의 랭킹에 따라 각 멤버들의 포인트를 올려준다
		
		//상식퀴즈 입력
		 ArrayList<GameDTO> queList = gameDao.quizList(); 
		 HashMap<Object, Object> numMap = new HashMap<Object, Object>();
		  
		 int asc = 1; 
		 boolean stop = true; 
		 while(stop) { 
			 int idxNum = (int)Math.round(Math.random()*(queList.size()-1)+1);
			 if(!numMap.containsValue(idxNum)) {
				 logger.info("숫자 : {}", idxNum);
				 numMap.put("param"+(asc++), idxNum); 
			} 
			 if(numMap.size() == 10) {
				 stop = false; 
			} 
		} 
		 int success = gameDao.makeWeekQuiz(numMap); 
		 if(success>0) {
			 logger.info("주간 퀴즈 입력 성공"); 
		 }
		 
		 //네모로직 입력 
		 queList = gameDao.nemoList(); 
		 success = 0; 
		 stop = true; 
		 while(stop){
			 int idxNum = (int) Math.round(Math.random()*(queList.size()-1)+1);
			 logger.info("숫자 : {}", idxNum); GameDTO dto = gameDao.searchExist(idxNum);
			 if(dto == null) { 
				 success = gameDao.makeWeekNemo(idxNum); 
			} 
			 if(success>0) {
				 logger.info("주간 네모 입력 성공"); 
				 stop = false; 
				 } 
			 }
		
		//상식퀴즈 랭킹에 따른 포인트 부여
		ArrayList<GameDTO> idList = gameDao.getQRankiForPoint();
		for(int i=0; i<10; i++) {
			int ifUp = gameDao.upPointTen(idList.get(i).getId());
			logger.info("10위까지 포인트 올리기 : {}",idList.get(i).getId());
			if(idList.get(i).getROWNUM() <= 3) {
				ifUp = gameDao.upPointTwen(idList.get(i).getId());
				logger.info("3위까지 포인트 올리기 : {}",idList.get(i).getId());
				if(idList.get(i).getROWNUM() == 1) {
					ifUp = gameDao.upPointTwen(idList.get(i).getId());
					logger.info("1위 포인트 올리기 : {}",idList.get(i).getId());
				}
			}
			logger.info(idList.get(i).getId());
		}
		
		//네모로직 랭킹에 따른 포인트 부여
		idList = gameDao.getNRankForPoint();
		for(int i=0; i<10; i++) {
			int ifUp = gameDao.upPointTen(idList.get(i).getId());
			logger.info("10위까지 포인트 올리기 : {}",idList.get(i).getId());
			if(idList.get(i).getROWNUM() <= 3) {
				ifUp = gameDao.upPointTwen(idList.get(i).getId());
				logger.info("3위까지 포인트 올리기 : {}",idList.get(i).getId());
				if(idList.get(i).getROWNUM() == 1) {
					ifUp = gameDao.upPointTwen(idList.get(i).getId());
					logger.info("1위 포인트 올리기 : {}",idList.get(i).getId());
				}
			}
		}
	}
	
}
