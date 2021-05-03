package com.spring.main.service;

import java.util.ArrayList;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;

import com.spring.main.dao.MyNotiDAO;
import com.spring.main.dto.MyNotiDTO;
import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;
@Service
public class MyNotiService {
	@Autowired MyNotiDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	public String noteList(ArrayList<Message> message,Model model) {
		logger.info("받은 쪽지 읽기 시작");
		String loginId = "wwww";
        message = dao.MessageList(loginId);
        model.addAttribute("messageList", message);
        logger.info("받은 쪽지 읽기 종료");
        return "Note/noteList";
	}

	public String delMessage(int note_idx, boolean notiCheck) {
		String loginId = "wwww";
		logger.info(note_idx+"번 삭제("+loginId+")");
		dao.delMessage(note_idx);
		return "redirect:/noteList";
	}

	public String noteSend(String content) {
		logger.info("쪽지 전송중..");
		String loginId="wwww";
		dao.noteSend(loginId,content);
		logger.info("쪽지 전송 완료");
		return "redirect:/sendList";
	}

	public String sendList(ArrayList<Message> sendList, Model model) {
		logger.info("보낸 쪽지 읽기 시작");
		String loginId = "test1122";
		sendList = dao.sendList(loginId);
        model.addAttribute("sendList", sendList);
        logger.info("보낸 쪽지 읽기 종료");
        return "Note/sendList";
	}

	public String detailNoteList(ArrayList<Message> detailList,int note_idx,Model model) {
		logger.info("쪽지 상세보기");
		String loginId = "wwww";
		detailList = dao.detailList(loginId,note_idx);
		logger.info(note_idx+"번 읽음 처리");
		dao.checked(note_idx);
		model.addAttribute("detailList", detailList);
		return "Note/Message";
	}
	
	//새로운 쪽지 목록 
	public boolean isNotiCheck(int note_idx) {
			String loginId = "wwww";
			String falseCnt = dao.selectFalseCount(loginId);
			if (falseCnt == null) {
				return true;
			}
			return false;
		
	}

	public String newNoti(Model model) {
		
		return null;
	}

	


	
}
