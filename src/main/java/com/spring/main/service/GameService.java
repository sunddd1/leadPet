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
		mav.addObject("quizList", qList);
		mav.addObject("nemoList", nList);
		mav.setViewName("game/gameQueList");
		return mav;
	}
}
