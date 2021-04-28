package com.spring.main.dao;

import java.util.ArrayList;

import com.spring.main.dto.GameDTO;

public interface GameDAO {

	ArrayList<GameDTO> quizList();

	ArrayList<GameDTO> nemoList();

	ArrayList<GameDTO> qWeekList();

	ArrayList<GameDTO> nWeekList();

	ArrayList<GameDTO> quizWeekDetail(int idx);
	
}
