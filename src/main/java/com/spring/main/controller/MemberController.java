package com.spring.main.controller;

import java.util.ArrayList;
import java.util.Map;

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
import org.springframework.web.servlet.ModelAndView;

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
			logger.info("탈퇴 요청");
			return memberService.withdraw(pw,session);
		}
		
		//계정 복구 요청 
		@RequestMapping(value = "/restore", method = RequestMethod.POST)
		public @ResponseBody Map<String, Object> restore(@RequestParam String pw,HttpSession session) {
			logger.info("계정 복구  요청");
			return memberService.restore(pw,session);
		}
		
		

		//내가 쓴 글 목록 
		@RequestMapping(value="/writeList")
	    public ModelAndView writeList(){
	        logger.info("내가 쓴 글 목록 요청");
	        String id = "멍멍";
			return memberService.writeList(id);
		}
		
		//글 상세보기 
		@RequestMapping(value = "/detailWriteList", method = RequestMethod.GET)
		public ModelAndView detailWriteList(@RequestParam int bbs_idx) {	
			logger.info("상세보기 요청");
			return memberService.detailWriteList(bbs_idx);
		}
		
		
		
}
