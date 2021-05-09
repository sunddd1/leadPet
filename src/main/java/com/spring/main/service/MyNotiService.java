package com.spring.main.service;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.MyNotiDAO;
import com.spring.main.dto.NoteDTO;

import oracle.jdbc.driver.Message;
@Service
public class MyNotiService {
	@Autowired MyNotiDAO dao;
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());

	
	public String noteList(ArrayList<NoteDTO> message, String id,Model model) {
		String page = "redirect:/noteList";
		logger.info("받은 쪽지 읽기 시작");
        message = dao.MessageList(id);
        logger.info("받은 쪽지 :"+message.size()+"개");
        model.addAttribute("messageList", message);
		return "Note/MyNoti";
	}

	public String delMessage(int note_idx,String id) {
		logger.info(note_idx+"번 삭제("+id+")");
		dao.delMessage(note_idx,id);
		return "redirect:/noteList";
	}

	public String noteSend(String content, String id, String receiving_id) {
		logger.info("쪽지 전송중..");
		dao.noteSend(id,content,receiving_id);//리시빙 아이디파람 어디서받지 
		logger.info("쪽지 전송 완료");
		return "redirect:/sendList";
	}

	public String sendList(ArrayList<Message> sendList, Model model, String id) {
		logger.info("보낸 쪽지 읽기 시작");
		sendList = dao.sendList(id);
        model.addAttribute("sendList", sendList);
        logger.info("보낸 쪽지 읽기 종료");
        return "Note/sendList";
	}

	public ModelAndView detailNoteList(ArrayList<Message> detailList,int note_idx,String id) {
		logger.info("쪽지 상세보기");
		detailList = dao.detailList(id,note_idx);
		logger.info(note_idx+"번 읽음 처리");
		dao.checked(note_idx);
		ModelAndView mav = new ModelAndView();
		mav.addObject("detailList", detailList);
		mav.setViewName("Note/Message");
		return mav;
	}


	public HashMap<String, Object> notiCheck(String id) {
		int success = 0;
		HashMap<String, Object> map = new HashMap<String, Object>();
		success = dao.notiCheck(id);
		logger.info("success:"+success);
		map.put("success", success);
		return map;
	}


	


	
}
