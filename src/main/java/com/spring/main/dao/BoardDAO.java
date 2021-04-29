package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import com.spring.main.dto.BoardDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list();

	ArrayList<BoardDTO> tab(HashMap<String, String> map);

	int write(BoardDTO dto);

	void writeFile(String key, String string, int bbs_idx);

}
