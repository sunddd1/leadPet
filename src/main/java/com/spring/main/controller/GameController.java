package com.spring.main.controller;

import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
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
	@RequestMapping(value = "/gameWeek", method = RequestMethod.GET)
	public ModelAndView weekGame() {
		logger.info("게임 회차 페이지");
		return service.gameWeek();
	}
	@RequestMapping(value = "/gameQueList", method = RequestMethod.GET)
	public String gameQueWeek() {
		logger.info("문제 리스트 페이지 : 시작은 상식퀴즈");
		return "game/gameQueList";
	}
	@RequestMapping(value = "/gameGetList", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> gameQueList(HttpSession session
			,@RequestParam(value="pagePerCnt", defaultValue ="15") int pagePerCnt
			,@RequestParam(value="page", defaultValue ="1") int page)
	{
		logger.info("리스트 가져오기(페이징하기)");
		logger.info("받아온 파라메터 : "+pagePerCnt+"/"+page);
		return service.gameList(pagePerCnt,page);
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
	public ModelAndView quizPlaying(HttpSession session) {
		logger.info("상식퀴즈 게임 화면 : 가장 최근 등록된 회차 상식퀴즈 리스트 불러오기");
		return service.getThisWeekQuiz(session);
	}
	@RequestMapping(value = "/submitQuiz", method = RequestMethod.POST)
	public ModelAndView submitQuiz(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("상식퀴즈 답안 제출(hashMap) : {}",params);
		int min = Integer.parseInt(params.get("quiz_timer").substring(0, 2));
		int sec = Integer.parseInt(params.get("quiz_timer").substring(3, 5));
		int mill = Integer.parseInt(params.get("quiz_timer").substring(6, 8));
		params.put("quiz_timer", Integer.toString((min*100*60+sec*100+mill)));
		params.put("resultTime",min+":"+sec+"."+mill);
		logger.info(params.get("quiz_timer"));
		return service.submitQuiz(params, session);
	}
	@RequestMapping(value = "/nemoWeekDetail", method = RequestMethod.GET)
	public ModelAndView nemoWeekDetail(@RequestParam int idx) {
		logger.info("{}회차 네모로직 상세 페이지",idx);
		return service.nemoWeekDetail(idx);
	}
	@RequestMapping(value = "/nemoDetail", method = RequestMethod.GET)
	public ModelAndView nemoDetail(@RequestParam int idx) {
		logger.info("네모로직 {}번 문제 상세 페이지",idx);
		return service.nemoDetail(idx);
	}
	@RequestMapping(value = "/insertNemoForm", method = RequestMethod.GET)
	public String insertNemoForm(Model medel) {
		logger.info("네모로직 문제등록 페이지");
		return "game/insertNemoForm";
	}
	@RequestMapping(value = "/nemoMake", method = RequestMethod.POST)
	public ModelAndView nemoMake(@RequestParam HashMap<String, String> params) {
		logger.info("네모로직 문제등록 : {}",params);
		return service.nemoMake(params);
	}
	@RequestMapping(value = "/nemoUpdateForm", method = RequestMethod.GET)
	public ModelAndView nemoUpdateForm(@RequestParam int idx) {
		logger.info("네모로직 {}번 문제 수정 폼으로",idx);
		return service.nemoUpdateForm(idx);
	}
	@RequestMapping(value = "/updateNemo", method = RequestMethod.POST)
	public ModelAndView updateNemo(@RequestParam HashMap<String, String> params) {
		logger.info("네모로직 수정사항 저장 : {}",params);
		return service.updateNemo(params);
	}
	@RequestMapping(value = "/mainRank", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> mainRank() {
		logger.info("랭킹요청");
		return service.mainRank();
	}
	@RequestMapping(value = "/nemoPlaying", method = RequestMethod.GET)
	public ModelAndView nemoPlaying(HttpSession session) {
		logger.info("네모로직 게임 화면 : 가장 최근 등록된 회차 네모로직 리스트 불러오기");
		return service.getThisWeekNemo(session);
	}
	@RequestMapping(value = "/submitNemo", method = RequestMethod.POST)
	public ModelAndView submitNemo(@RequestParam HashMap<String, String> params, HttpSession session) {
		logger.info("네모로직 답안 제출(hashMap) : {}",params);
		int min = Integer.parseInt(params.get("nemo_timer").substring(0, 2));
		int sec = Integer.parseInt(params.get("nemo_timer").substring(3, 5));
		int mill = Integer.parseInt(params.get("nemo_timer").substring(6, 8));
		params.put("nemo_timer", Integer.toString((min*100*60+sec*100+mill)));
		params.put("resultTime",min+":"+sec+"."+mill);
		logger.info(params.get("nemo_timer"));
		return service.submitNemo(params, session);
	}
	@RequestMapping(value = "/lastQuizAnswer", method = RequestMethod.GET)
	public ModelAndView lastQuizAnswer() {
		logger.info("지난 상식 퀴즈 내역");
		return service.lastQuizAnswer();
	}
	@RequestMapping(value = "/lastNemoAnswer", method = RequestMethod.GET)
	public ModelAndView lastNemoAnswer() {
		logger.info("지난 네모로직 내역");
		return service.lastNemoAnswer();
	}
	@RequestMapping(value = "/quizRanking", method = RequestMethod.GET)
	public ModelAndView quizRanking(HttpSession session) {
		logger.info("상식 퀴즈 랭킹보기");
		return service.quizRanking(session);
	}
	@RequestMapping(value = "/nemoRanking", method = RequestMethod.GET)
	public ModelAndView nemoRanking(HttpSession session) {
		logger.info("네모 로직 랭킹보기");
		return service.nemoRanking(session);
	}

}
