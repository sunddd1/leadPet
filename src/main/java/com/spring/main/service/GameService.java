package com.spring.main.service;

import java.util.ArrayList;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.GameDAO;
import com.spring.main.dto.GameDTO;

@Service
public class GameService {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GameDAO dao;
	
	public ModelAndView gameList() {
		ModelAndView mav = new ModelAndView();
		ArrayList<GameDTO> qList = dao.quizList();
		ArrayList<GameDTO> nList = dao.nemoList();
		logger.info("quizListSize : {}",qList);
		logger.info("nemoListSize : {}",nList);
		mav.addObject("quizList", qList);
		mav.addObject("nemoList", nList);
		mav.setViewName("game/gameQueList");
		return mav;
	}

	public ModelAndView gameWeek() {
		ModelAndView mav = new ModelAndView();
		ArrayList<GameDTO> qWeekList = dao.qWeekList();
		ArrayList<GameDTO> nWeekList = dao.nWeekList();
		logger.info("quizListSize : {}",qWeekList);
		logger.info("nemoListSize : {}",nWeekList);
		mav.addObject("qWeekList", qWeekList);
		mav.addObject("nWeekList", nWeekList);
		mav.setViewName("game/gameWeek");
		return mav;
	}

	public ModelAndView quizWeekDetail(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=week_quiz_idx
		ArrayList<GameDTO> quizDetailList = dao.quizWeekDetail(idx);
		mav.addObject("qWeekDetail", quizDetailList);
		mav.addObject("week_quiz_idx", idx);
		mav.setViewName("game/quizWeekDetail");
		return mav;
	}

	public ModelAndView quizDetail(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=quiz_idx
		GameDTO dto = dao.perQuizDetail(idx);
		mav.addObject("quizDetail", dto);
		mav.addObject("quiz_idx", idx);
		mav.setViewName("game/perQuizDetail");
		return mav;
	}
}
