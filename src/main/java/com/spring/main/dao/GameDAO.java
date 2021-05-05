package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.GameDTO;

public interface GameDAO {

	ArrayList<GameDTO> quizList();

	ArrayList<GameDTO> nemoList();

	ArrayList<GameDTO> qWeekList();

	ArrayList<GameDTO> nWeekList();

	ArrayList<GameDTO> quizWeekDetail(int idx);

	GameDTO perQuizDetail(int idx);

	int insertQuiz(HashMap<String, String> params);

	int quizBlind(int idx);

	int updateQuiz(HashMap<String, String> params);

	ArrayList<GameDTO> getThisWeekQuiz();

	int initialQuizData(String loginId, int quizIdx);

	GameDTO ifExist(String loginId, int quizIdx);

	String matchQue(GameDTO gameDTO);

	int recordScore(int score, String quiz_timer, String loginId, String week_quiz_idx);
	
	GameDTO weekNemoDetail(int idx);

	GameDTO nemoDetail(int idx);

	int insertNemo(HashMap<String, String> params);

	int updateNemo(HashMap<String, String> params);

	ArrayList<GameDTO> quizRank();

	ArrayList<GameDTO> nemoRank();
	
}
