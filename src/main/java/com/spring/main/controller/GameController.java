package com.spring.main.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.service.GameService;

@Controller
public class GameController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired GameService service;

	@RequestMapping(value = "/gameMain", method = RequestMethod.GET)
	public String gameMain(Model model) {
		logger.info("게임 메인 페이지");
		return "game/gameMainPage";
	}
	@RequestMapping(value = "/nemoLogic", method = RequestMethod.GET)
	public String nemoLogic(Model model) {
		logger.info("네모 로직 페이지");
		return "game/nemoTest";
	}
	@RequestMapping(value = "/nemoEx", method = RequestMethod.GET)
	public String nemoEx(Model model) {
		logger.info("성남님이 준 네모로직");
		return "game/nemoEx";
	}
	@RequestMapping(value = "/gameWeek", method = RequestMethod.GET)
	public String weekGame(Model model) {
		logger.info("게임 회차 페이지");
		return "game/gameWeek";
	}
	@RequestMapping(value = "/gameQueList", method = RequestMethod.GET)
	public ModelAndView gameQueList(Model model) {
		logger.info("문제 리스트 페이지 : 시작은 상식퀴즈");
		return service.gameList();
	}
}
