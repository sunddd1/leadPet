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
	
}
