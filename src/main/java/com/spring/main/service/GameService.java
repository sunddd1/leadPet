package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

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

	public ModelAndView insertQuiz(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		String page = "redirext:/insertQuizForm";
		int success = dao.insertQuiz(params);
		if(success>0) {
			logger.info("퀴즈 등록 완료!");
			page = "redirect:/gameQueList";
			mav.setViewName(page);
		}
		return mav;
	}

	public ModelAndView quizBlind(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=quiz_idx
		int success = dao.quizBlind(idx);
		if(success>0) {
			logger.info("{}번 문제 블라인드 처리 완료",idx);
		}
		mav.setViewName("redirect:/gameQueList");
		return mav;
	}

	public ModelAndView quizUpdateForm(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=quiz_idx
		GameDTO dto = dao.perQuizDetail(idx);
		mav.addObject("quizDetail", dto);
		mav.addObject("quiz_idx", idx);
		mav.setViewName("game/quizUpdateForm");
		return mav;
	}

	public ModelAndView updateQuiz(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		//idx=quiz_idx
		int success = dao.updateQuiz(params);
		if(success>0) {
			mav.setViewName("redirect:/quizDetail?idx="+params.get("quiz_idx"));
		} else {
			mav.setViewName("redirect:/quizUpdateForm?idx="+params.get("quiz_idx"));
		}
		return mav;
	}
}
