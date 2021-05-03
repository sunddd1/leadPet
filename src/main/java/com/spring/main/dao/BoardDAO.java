package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.ReplyDTO;
import com.spring.main.dto.bbs_imgDTO;

public interface BoardDAO {

	ArrayList<BoardDTO> list();

	ArrayList<BoardDTO> tab(HashMap<String, String> map);

	int write(BoardDTO dto);

	void writeFile(String key, String string, int bbs_idx);


	ArrayList<BoardDAO> bbsTop5();

	ArrayList<BoardDAO> galTop3();

	void upViews(String bbs_idx);

	BoardDTO boardDetail(String bbs_idx);

	ArrayList<bbs_imgDTO> viewimg(String bbs_idx);

	PetDTO writeForm(String id);

	HashMap<String, Object> recoConfirm(String id, String bbs_idx);

	int recoTableUp(String id, String bbs_idx);

	int recoPlus(String bbs_idx);

	int recoTableDown(String id, String bbs_idx);

	int recoMinus(String bbs_idx);

	ArrayList<ReplyDTO> replyList(String id, String bbs_idx);

	int replyWrite(ReplyDTO reply);


}
