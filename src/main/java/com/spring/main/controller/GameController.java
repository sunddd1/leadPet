package com.spring.main.controller;

import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.GameDTO;
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
	public ModelAndView weekGame() {
		logger.info("게임 회차 페이지");
		return service.gameWeek();
	}
	@RequestMapping(value = "/gameQueList", method = RequestMethod.GET)
	public ModelAndView gameQueList() {
		logger.info("문제 리스트 페이지 : 시작은 상식퀴즈");
		return service.gameList();
	}
	@RequestMapping(value = "/quizWeekDetail", method = RequestMethod.GET)
	public ModelAndView quizWeekDetail(@RequestParam int idx) {
		logger.info("{}회차 상식퀴즈 상세 페이지",idx);
		return service.quizWeekDetail(idx);
	}
	@RequestMapping(value = "/quizDetail", method = RequestMethod.GET)
	public ModelAndView quizDetail(@RequestParam int idx) {
		logger.info("상식퀴즈 {}번 문제 상세 페이지",idx);
		return service.quizDetail(idx);
	}
	@RequestMapping(value = "/insertQuizForm", method = RequestMethod.GET)
	public String insertQuiz(Model model) {
		logger.info("상식퀴즈 문제등록 페이지");
		return "game/insertQuizForm";
	}
	@RequestMapping(value = "/insertQuiz", method = RequestMethod.POST)
	public ModelAndView insertQuiz(@RequestParam HashMap<String, String> params) {
		logger.info("상식퀴즈 문제등록 : {}",params);
		return service.insertQuiz(params);
	}
	@RequestMapping(value = "/quizBlind", method = RequestMethod.GET)
	public ModelAndView quizBlind(@RequestParam int idx) {
		logger.info("상식퀴즈 {}번 문제 블라인드 처리",idx);
		return service.quizBlind(idx);
	}
	@RequestMapping(value = "/quizUpdateForm", method = RequestMethod.GET)
	public ModelAndView quizUpdateForm(@RequestParam int idx) {
		logger.info("상식퀴즈 {}번 문제 수정 폼으로",idx);
		return service.quizUpdateForm(idx);
	}
	@RequestMapping(value = "/updateQuiz", method = RequestMethod.POST)
	public ModelAndView updateQuiz(@RequestParam HashMap<String, String> params) {
		logger.info("상식퀴즈 수정사항 저장 : ",params);
		return service.updateQuiz(params);
	}
	@RequestMapping(value = "/quizPlaying", method = RequestMethod.GET)
	public ModelAndView quizPlaying(Model model) {
		logger.info("상식퀴즈 게임 화면 : 가장 최근 등록된 회차 상식퀴즈 리스트 불러오기");
		return service.getThisWeekQuiz();
	}
}
