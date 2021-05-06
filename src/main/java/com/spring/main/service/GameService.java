package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

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
	
	public HashMap<String, Object> gameList(int pagePerCnt, int page) {
		HashMap<String , Object> map = new HashMap<String, Object>();
		ArrayList<GameDTO> qList = dao.quizList();
		ArrayList<GameDTO> nList = dao.nemoList();
		//전체 게시글 수
		int quizAllCnt = qList.size();
		int nemoAllCnt = nList.size();
		//pagePerCnt 기준으로 몇 페이지나 만들 수 있는가?
		int quizRange = quizAllCnt%pagePerCnt > 0 ? Math.round(quizAllCnt/pagePerCnt)+1 : Math.round(quizAllCnt/pagePerCnt);
		int nemoRange = nemoAllCnt%pagePerCnt > 0 ? Math.round(nemoAllCnt/pagePerCnt)+1 : Math.round(nemoAllCnt/pagePerCnt);
		logger.info("quizRange:{}",quizRange);
		logger.info("nemoRange:{}",nemoRange);
		//시작, 끝
		int end = page * pagePerCnt;//총 몇개까지 보여줘야 하나
		int start = end - (pagePerCnt-1);
		logger.info("start:{}",start);
		logger.info("end:{}",end);
		//생성 가능한 페이지보다 현재 페이지가 클 경우... 현재 페이지를 생성 가능한 페이지로 맞춰준다
		page = (page < quizRange && page < nemoRange)? page 
				: (page > quizRange && page < nemoRange)? quizRange
						: (page < quizRange && page > nemoRange)? nemoRange 
								:  (page > quizRange && page > nemoRange && quizRange > nemoRange)? nemoRange
										: page;		
		
		map.put("quizList", dao.quizListCut(start,end));
		map.put("nemoList", dao.nemoListCut(start,end));
		map.put("quizRange", quizRange);
		map.put("nemoRange", nemoRange);
		map.put("currPage", page);
		
		return map;
	}

	public ModelAndView gameWeek() {
		ModelAndView mav = new ModelAndView();
		ArrayList<GameDTO> qWeekList = dao.qWeekList();
		ArrayList<GameDTO> nWeekList = dao.nWeekList();
		logger.info("quizListSize : {}",qWeekList.size());
		logger.info("nemoListSize : {}",nWeekList.size());
		mav.addObject("qWeekList", qWeekList);
		mav.addObject("nWeekList", nWeekList);
		mav.setViewName("game/gameWeek");
		return mav;
	}

	public ModelAndView quizWeekDetail(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=week_quiz_idx
		ArrayList<GameDTO> quizDetailList = dao.quizWeekDetail(idx);
		logger.info("list_size : {}",quizDetailList.size());
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

	public ModelAndView getThisWeekQuiz(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<GameDTO> ThisWeekQuiz = dao.getThisWeekQuiz();
		logger.info("ThisWeekQuiz : {}",ThisWeekQuiz.size());
		if(ThisWeekQuiz != null) {
			int quizIdx = ThisWeekQuiz.get(0).getWeek_quiz_idx();
			String loginId = (String) session.getAttribute("loginId");
			if(loginId == null) {
				loginId = "noBody";
			}
			GameDTO dto = dao.ifExist(loginId,quizIdx);
			String page = "game/quizPlayingPage";
			if(dto != null) {
				logger.info("이미 게임하셨습니다! : 메인으로 이동");
				page = "redirect:/gameMain";
			} else {
				int success = dao.initialQuizData(loginId,quizIdx);
				if(success>0) {
					logger.info("{}님 {}번 퀴즈 풀이 시작 가능!",loginId,quizIdx);
				}				
			}
			logger.info("{}주차 상식퀴즈",quizIdx);
			logger.info("업데이트 날짜 : {}",ThisWeekQuiz.get(0).getQuiz_update_date());
			mav.addObject("ThisWeekQuiz", ThisWeekQuiz);
			mav.addObject("week_quiz_idx",quizIdx);
			mav.setViewName(page);
		}
		return mav;
	}

	public ModelAndView submitQuiz(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "noBody";
		}
		ArrayList<GameDTO> list = new ArrayList<GameDTO>();
		for(int i=0; i<30; i++) {
			if(params.get("exam"+i) != null) {
				GameDTO dto = new GameDTO();
				dto.setWeek_quiz_idx(Integer.parseInt(params.get("week_quiz_idx")));
				dto.setQuiz_idx(Integer.parseInt(params.get("quiz_idx"+i)));
				logger.info(Integer.toString(dto.getQuiz_idx()));
				dto.setQuiz_question(params.get("quiz_question"+i));
				logger.info(dto.getQuiz_question());
				dto.setQuiz_answer(params.get("exam"+i));
				logger.info(dto.getQuiz_answer());
				dto.setQuiz_timer(Integer.parseInt(params.get("quiz_timer")));
				list.add(dto);				
			}
		}
		logger.info("리스트에 잘 들어갔는지 확인 : {}",list.size());
		int score = 0;
		for(GameDTO interList : list) {
			logger.info(interList.getQuiz_question());
			if(dao.matchQue(interList) != null) {
				score++;				
			}
		}
		logger.info("점수 : {}",score);
		GameDTO dto = new GameDTO();
		int recordScore = dao.recordScore(score,params.get("quiz_timer"),loginId,params.get("week_quiz_idx"));
		logger.info("업데이트 완료된 데이터 : {}",recordScore);
		mav.addObject("loginId", loginId);
		mav.addObject("score", score);
		mav.addObject("resultTime", params.get("resultTime"));
		mav.setViewName("game/quizResultPage");
		return mav;
	}
	
	public ModelAndView nemoWeekDetail(int idx) {
		ModelAndView mav = new ModelAndView();
		
		//idx=week_nemo_idx
		GameDTO dto = dao.weekNemoDetail(idx);
		
		//문제(숫자) 뽑기
		ArrayList<String> qList = new ArrayList<String>();
		String nemoNum = dto.getNemo_question();
		logger.info("전체 문제 : {}",nemoNum);
		//split 사용법 : 문자열배열 = 대상문자열.split("기준문자");
		String[] array = nemoNum.split(",");
		for(int i=0;i<array.length;i++) {
			//logger.info("추출 : {}",array[i]);
			qList.add(array[i]);
		}
		logger.info("qList size : {}",qList.size());
		
		mav.addObject("nemoDetail", dto);
		mav.addObject("qList", qList);
		mav.addObject("aList", dto.getNemo_answer());
		mav.setViewName("game/nemoWeekDetail");
		return mav;
	}
	
	public ModelAndView nemoDetail(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=nemo_idx
		GameDTO dto = dao.nemoDetail(idx);
		
		//문제(숫자) 뽑기
		ArrayList<String> qList = new ArrayList<String>();
		String nemoNum = dto.getNemo_question();
		logger.info("전체 문제 : {}",nemoNum);
		//split 사용법 : 문자열배열 = 대상문자열.split("기준문자");
		String[] array = nemoNum.split(",");
		for(int i=0;i<array.length;i++) {
			//logger.info("추출 : {}",array[i]);
			qList.add(array[i]);
		}
		logger.info("qList size : {}",qList.size());
		
		mav.addObject("nemoDetail", dto);
		mav.addObject("qList", qList);
		mav.addObject("aList", dto.getNemo_answer());
		mav.setViewName("game/perNemoDetail");
		return mav;
	}

	public ModelAndView nemoMake(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		String page = "redirext:/insertNemoForm";
		int success = dao.insertNemo(params);
		if(success>0) {
			logger.info("퀴즈 등록 완료!");
			page = "redirect:/gameQueList";
			mav.setViewName(page);
		}
		return mav;
	}

	public ModelAndView nemoUpdateForm(int idx) {
		ModelAndView mav = new ModelAndView();
		//idx=nemo_idx
		GameDTO dto = dao.nemoDetail(idx);
		
		//문제(숫자) 뽑기
		ArrayList<String> qList = new ArrayList<String>();
		String nemoNum = dto.getNemo_question();
		logger.info("전체 문제 : {}",nemoNum);
		//split 사용법 : 문자열배열 = 대상문자열.split("기준문자");
		String[] array = nemoNum.split(",");
		for(int i=0;i<array.length;i++) {
			//logger.info("추출 : {}",array[i]);
			qList.add(array[i]);
		}
		logger.info("qList size : {}",qList.size());
		
		mav.addObject("nemoDetail", dto);
		mav.addObject("qList", qList);
		mav.addObject("aList", dto.getNemo_answer());
		mav.setViewName("game/nemoUpdateForm");
		return mav;
	}

	public ModelAndView updateNemo(HashMap<String, String> params) {
		ModelAndView mav = new ModelAndView();
		int success = dao.updateNemo(params);
		if(success>0) {
			mav.setViewName("redirect:/nemoDetail?idx="+params.get("nemo_idx"));
		} else {
			mav.setViewName("redirect:/nemoUpdateForm?idx="+params.get("nemo_idx"));
		}
		return mav;
	}


	public HashMap<String, Object> mainRank() {
		HashMap<String, Object> list = new HashMap<String, Object>();
		ArrayList<GameDTO> quiz = dao.quizRank();
		list.put("quiz", quiz);
		quiz = dao.nemoRank();
		list.put("nemo", quiz);
		return list;
	}

	public ModelAndView getThisWeekNemo(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		ArrayList<GameDTO> ThisWeekNemo = dao.getThisWeekNemo();
		logger.info("ThisWeekNemo : {}",ThisWeekNemo.size());
		if(ThisWeekNemo != null) {
			int nemoWeekIdx = ThisWeekNemo.get(0).getWeek_nemo_idx();
			String loginId = (String) session.getAttribute("loginId");
			if(loginId == null) {
				loginId = "noBody";
			}
			GameDTO dto = dao.ifExistNemo(loginId,nemoWeekIdx);
			String page = "game/nemoPlayingPage";
			if(dto != null) {
				logger.info("이미 게임하셨습니다! : 메인으로 이동");
				page = "redirect:/gameMain";
			} else {
				int success = dao.initialNemoData(loginId,nemoWeekIdx);
				if(success>0) {
					logger.info("{}님 {}번 네모 풀이 시작 가능!",loginId,nemoWeekIdx);
				}
				dto = dao.nemoDetail(ThisWeekNemo.get(0).getNemo_idx());
				//문제(숫자) 뽑기
				ArrayList<String> qList = new ArrayList<String>();
				String nemoNum = dto.getNemo_question();
				logger.info("전체 문제 : {}",nemoNum);
				//split 사용법 : 문자열배열 = 대상문자열.split("기준문자");
				String[] array = nemoNum.split(",");
				for(int i=0;i<array.length;i++) {
					//logger.info("추출 : {}",array[i]);
					qList.add(array[i]);
				}
				logger.info("qList size : {}",qList.size());
				mav.addObject("nemoDetail", dto);
				mav.addObject("qList", qList);
				mav.addObject("aList", dto.getNemo_answer());		
			}
			mav.setViewName(page);
		}
		return mav;
	}

	public ModelAndView submitNemo(HashMap<String, String> params, HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "noBody";
		}
		params.put("id",loginId);
		String page = "redirect:/gameMain";
		int success = dao.recordNemo(params);
		if(success>0) {
			page = "game/nemoResultPage";
			mav.addObject("loginId", loginId);
			mav.addObject("nemo_success", params.get("nemo_success"));
			mav.addObject("resultTime", params.get("resultTime"));
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView lastQuizAnswer() {
		ModelAndView mav = new ModelAndView();
		ArrayList<GameDTO> lastWeekQuiz = dao.getLastWeekQuiz();
		logger.info("lastWeekQuiz : {}",lastWeekQuiz.size());
		mav.addObject("qWeekDetail", lastWeekQuiz);
		mav.addObject("week_quiz_idx", lastWeekQuiz.get(0).getWeek_quiz_idx());
		mav.addObject("lastQuiz", lastWeekQuiz.get(0).getWeek_quiz_idx());
		mav.setViewName("game/quizWeekDetail");
		return mav;
	}

	public ModelAndView lastNemoAnswer() {
		ModelAndView mav = new ModelAndView();
		GameDTO dto = dao.getLastWeekNemo();
		logger.info("lastWeekNemo : {}",dto.getNemo_subject());
		
		//문제(숫자) 뽑기
		ArrayList<String> qList = new ArrayList<String>();
		String nemoNum = dto.getNemo_question();
		logger.info("전체 문제 : {}",nemoNum);
		//split 사용법 : 문자열배열 = 대상문자열.split("기준문자");
		String[] array = nemoNum.split(",");
		for(int i=0;i<array.length;i++) {
			//logger.info("추출 : {}",array[i]);
			qList.add(array[i]);
		}
		logger.info("qList size : {}",qList.size());
		
		mav.addObject("nemoDetail", dto);
		mav.addObject("qList", qList);
		mav.addObject("aList", dto.getNemo_answer());
		mav.addObject("lastNemo", dto.getWeek_nemo_idx());
		mav.setViewName("game/nemoWeekDetail");
		return mav;
	}

	public ModelAndView quizRanking(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "hello";
		}
		ArrayList<GameDTO> ranking = dao.getQuizRanking();
		String page = "redirect:/gameMain";
		if(ranking != null) {
			logger.info(ranking.size()+"개");
			mav.addObject("quizRanking", ranking);
			mav.addObject("loginId", loginId);
			page = "game/quizRanking";
		}
		mav.setViewName(page);
		return mav;
	}

	public ModelAndView nemoRanking(HttpSession session) {
		ModelAndView mav = new ModelAndView();
		String loginId = (String) session.getAttribute("loginId");
		if(loginId == null) {
			loginId = "hello";
		}
		ArrayList<GameDTO> ranking = dao.getNemoRanking();
		String page = "redirect:/gameMain";
		if(ranking != null) {
			logger.info(ranking.size()+"개");
			mav.addObject("nemoRanking", ranking);
			mav.addObject("loginId", loginId);
			page = "game/nemoRanking";
		}
		mav.setViewName(page);
		return mav;
	}
	
}
