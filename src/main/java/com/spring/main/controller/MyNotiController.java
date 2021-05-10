package com.spring.main.controller;

import java.util.ArrayList;
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
import org.springframework.web.bind.annotation.SessionAttribute;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MyNotiDTO;
import com.spring.main.dto.NoteDTO;
import com.spring.main.service.MyNotiService;

import oracle.jdbc.driver.Message;

@Controller
public class MyNotiController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
		@Autowired MyNotiService service;
		
		//쪽지보내기 페이지 요청 
		@RequestMapping("/borderlist")
		public String borderlist(Model model,@RequestParam String receiving_id) {
			logger.info("쪽지 보내기 페이지 요청");
			model.addAttribute("receiving_id", receiving_id);
			return "Note/borderList";
		}
		
		//쪽지 전송 
		@RequestMapping(value="/noteSend",method = RequestMethod.POST)
	    public String noteSend(@RequestParam String content,HttpSession session,@RequestParam String receiving_id){
			logger.info("쪽지 받는 ID :"+receiving_id);
			String id = (String)session.getAttribute("loginId");
			return service.noteSend(content,id,receiving_id);
	    }
	
		//받은 쪽지 목록 
		@RequestMapping(value="/noteList")
	    public String noteList(ArrayList<NoteDTO> message,HttpSession session,Model model){
	        logger.info("받은 쪽지 목록 요청");
	        String id = (String)session.getAttribute("loginId");
			return service.noteList(message,id,model);
		}
		
		//보낸 쪽지 목록 
		@RequestMapping(value="/sendList")
	    public String sendList(ArrayList<Message> sendList, Model model,HttpSession session){
	        logger.info("보낸 쪽지 목록 요청");
	        String id = (String)session.getAttribute("loginId");
			return service.sendList(sendList,model,id);
		}
		
		//받은 쪽지 상세보기  
		@RequestMapping(value="/detailNoteList")
	    public ModelAndView detailNoteList(ArrayList<Message> message,@RequestParam int note_idx,Model model,HttpSession session){
	        logger.info("받은 쪽지 상세보기");
	        String id = (String)session.getAttribute("loginId");
			return service.detailNoteList(message, note_idx,id);
		}

		//받은 쪽지 삭제 요청 
		@RequestMapping(value="/delMessageList")
	    public String delMessageList(@RequestParam int note_idx,HttpSession session){
			String id = (String)session.getAttribute("loginId");
	        logger.info("받은 쪽지 삭제");
			return service.delMessage(note_idx,id);
		}
		
		//새로운 쪽지 확인(header)  
		@RequestMapping(value="/notiCheck",method = RequestMethod.GET)
		public @ResponseBody HashMap<String, Object> notiCheck(HttpSession session) {
			String id = (String)session.getAttribute("loginId");
			logger.info("새로운 쪽지 요청 ID :"+id);
			return service.notiCheck(id);
		}

}
