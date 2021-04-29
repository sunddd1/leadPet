package com.spring.main.controller;

import java.util.ArrayList;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.NoteDTO;
import com.spring.main.service.MemberService;

import oracle.jdbc.driver.Message;
@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService memberService;


		//탈퇴 페이지 요청 
		@RequestMapping("/withdrawal")
		public ModelAndView withdrawal() {
			logger.info("탈퇴 페이지 요청");
			return new ModelAndView("Member/pwCheck");
		}
		
		//계정 복구 페이지 요청 
		@RequestMapping("/restoreForm")
		public ModelAndView restoreForm() {
			logger.info("계정 복구 페이지 요청");
			return new ModelAndView("Member/restore");
		}
		
		//탈퇴 요청 
		@RequestMapping(value = "/withdraw", method = RequestMethod.POST)
		public String withdraw(@RequestParam String pw,HttpSession session) {

			return memberService.withdraw(pw,session);
		}
		
		//계정 복구 요청 
		@RequestMapping(value = "/restore", method = RequestMethod.POST)
		public String restore(@RequestParam String pw,HttpSession session) {

			return memberService.restore(pw,session);
		}
		
		//쪽지보내기 페이지 요청 
		@RequestMapping("/borderlist")
		public String borderlist() {
			logger.info("쪽지 보내기 페이지 요청");
			return "Note/borderList";
		}
		
		//쪽지 전송 
		@RequestMapping(value="/noteSend",method = RequestMethod.POST)
	    public String noteSend(@RequestParam String content,@RequestParam String id){
			logger.info("쪽지 전송 요청 :"+content,id);
			return memberService.noteSend(content,id);
	    }
	
		//받은 쪽지 목록 
		@RequestMapping(value="/noteList")
	    public String noteList(ArrayList<Message> message, Model model){
	        logger.info("받은 쪽지 목록 요청");
			return memberService.noteList(message,model);
		}
		
		//받은 쪽지 삭제 요청 
		@RequestMapping(value="/delMessageList")
	    public String delMessageList(@RequestParam int note_idx){
	        logger.info("받은 쪽지 삭제");
			return memberService.delMessage(note_idx);
		}
		
		//보낸 쪽지 목록 
		@RequestMapping(value="/sendList")
	    public String sendList(ArrayList<Message> sendList, Model model){
	        logger.info("보낸 쪽지 목록 요청");
			return memberService.sendList(sendList,model);
		}
		
		//받은 쪽지 상세보기  
		@RequestMapping(value="/detailNoteList")
	    public String detailNoteList(ArrayList<Message> message,@RequestParam int note_idx,Model model){
	        logger.info("받은 쪽지 상세보기");
			return memberService.detailNoteList(message, note_idx,model);
		}
		
//		//쪽지 읽음 표시 
//		@RequestMapping(value="/checked")
//		public String checked(@RequestParam int note_idx){
//	        logger.info("보낸 쪽지 목록 요청");
//			return memberService.checked(note_idx);
//		}
}
