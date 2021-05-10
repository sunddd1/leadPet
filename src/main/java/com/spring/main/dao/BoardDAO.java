package com.spring.main.dao;

import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.BoardDTO;
import com.spring.main.dto.PetDTO;
import com.spring.main.dto.ReplyDTO;
import com.spring.main.dto.ReportDTO;
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

	ArrayList<ReplyDTO> replyList(HashMap<String, Object> map);

	int replyWrite(ReplyDTO reply);


	BoardDTO BoardUpdateForm(String bbs_idx);

	ReplyDTO replyUpdateForm(HashMap<String, Object> map);

	int replyUpdate(ReplyDTO reply);

	int replyDel(String reply_idx);


	void writeContentFile(String string, String string2, int bbs_idx);
	ArrayList<BoardDAO> searchBbs(String category, String keyword, int start, int end);

	int allCount(String keyword);

	int anCount(String keyword, String category);


	int BoardUpdate(BoardDTO dto);

	void deletefile(String newfileName);

	void deleteContentFile(String newfileName);

	String reportSearch(ReportDTO dto);

	int boardreport(ReportDTO dto);

	int replyReport(HashMap<String, String> map);

	String replyReportSearch(HashMap<String, String> map);

	String boardReportSearch(String bbs_idx);

	int boardDel(String bbs_idx);

	int pointPlus(String id);

	int pointMinus(String id);

	int pointHistory(String id);

	int pointmHistory(String id);

}
