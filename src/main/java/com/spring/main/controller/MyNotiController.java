package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MyNotiDTO;
import com.spring.main.service.MyNotiService;

import oracle.jdbc.driver.Message;

@Controller
public class MyNotiController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
		@Autowired MyNotiService service;
		
		//쪽지보내기 페이지 요청 
		@RequestMapping("/borderlist")
		public String borderlist() {
			logger.info("쪽지 보내기 페이지 요청");
			return "Note/borderList";
		}
		
		//쪽지 전송 
		@RequestMapping(value="/noteSend",method = RequestMethod.POST)
	    public String noteSend(@RequestParam String content){
			logger.info("쪽지 전송 요청"+content);
			return service.noteSend(content);
	    }
	
		//받은 쪽지 목록 
		@RequestMapping(value="/noteList")
	    public String noteList(ArrayList<Message> message, Model model,@RequestParam String id){
	        logger.info("받은 쪽지 목록 요청");
			return service.noteList(message,model,id);
		}
		
		//보낸 쪽지 목록 
		@RequestMapping(value="/sendList")
	    public String sendList(ArrayList<Message> sendList, Model model,@RequestParam String id){
	        logger.info("보낸 쪽지 목록 요청");
			return service.sendList(sendList,model,id);
		}
		
		//받은 쪽지 상세보기  
		@RequestMapping(value="/detailNoteList")
	    public String detailNoteList(ArrayList<Message> message,@RequestParam int note_idx,Model model){
	        logger.info("받은 쪽지 상세보기");
			return service.detailNoteList(message, note_idx,model);
		}
		
		//쪽지/로그인 정보 
		@RequestMapping("/header")
		public ModelAndView header() {
			logger.info("알림/로그인 정보 요청");
			return new ModelAndView("Member/header");
		}
		

		//받은 쪽지 삭제 요청 
		@RequestMapping(value="/delMessageList")
	    public String delMessageList(@RequestParam int note_idx,@RequestParam String id){
	        logger.info("받은 쪽지 삭제");
	        boolean notiCheck = service.isNotiCheck(note_idx);
			return service.delMessage(note_idx,notiCheck,id);
		}
		
		//새로운 쪽지 확인(header)  
		@RequestMapping(value="/notiCheck",method = RequestMethod.GET)
		public @ResponseBody HashMap<String, Object> notiCheck(@RequestParam String id) {
			logger.info("새로운 쪽지 요청 ");
			return service.notiCheck(id);
		}

}
