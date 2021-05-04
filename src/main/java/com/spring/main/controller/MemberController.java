package com.spring.main.controller;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.MemberDTO;
import com.spring.main.service.LoginService;
import com.spring.main.service.MemberService;
@Controller
public class MemberController {
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	@Autowired MemberService memberService;
	@Autowired LoginService loginService;


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
		public ModelAndView withdraw(@RequestParam String pw,HttpSession session) {
			String id = (String)session.getAttribute("loginId");
			
			if(id == null) {
				return new ModelAndView("login/loginForm");
			}
			
			String page = "Member/pwCheck";
			String msg = "비밀번호가 틀렸습니다.";
			
			// 탈퇴 실패
			if(!memberService.withdraw(id, pw)) {
				return new ModelAndView(page, "msg", msg);
			}
			
			// 탈퇴 성공 후 탈퇴일 갱신.
			memberService.updateChangeDate(id);
			//로그인 세션 삭제
			session.removeAttribute("loginId");
			session.invalidate();
			logger.info("로그인 세션 삭제 ");
	
			page= "login/loginForm";
			msg = "탈퇴에 성공했습니다.";

			return new ModelAndView(page, "msg", msg);
		}
		
		//계정 복구 요청 
		@RequestMapping(value = "/restore", method = RequestMethod.POST)
		public ModelAndView restore(@RequestParam String pw,HttpSession session) {
			String id = (String)session.getAttribute("loginId");
			
			if(id == null) {
				return new ModelAndView("login/loginForm");
			}
			
			String page = "Member/restore";
			String msg = "비밀번호가 틀렸습니다.";
			
			// 탈퇴 실패
			if(!memberService.restore(id, pw)) {
				return new ModelAndView(page, "msg", msg);
			}

			page = "home";
			
			return new ModelAndView(page);
		}
		
		

		//내가 쓴 글 목록 
		@RequestMapping(value="/writeList")
	    public ModelAndView writeList(){
	        logger.info("내가 쓴 글 목록 요청");
			return memberService.writeList();
		}
		
		
		
		//글 상세보기 
		@RequestMapping(value = "/detailWriteList", method = RequestMethod.GET)
		public ModelAndView detailWriteList(@RequestParam int bbs_idx) {	
			logger.info("상세보기 요청");
			return memberService.detailWriteList(bbs_idx);
		}
		
		//작성글 삭제 
		@RequestMapping(value = "/deleteWriteList")
		public String deleteWriteList(@RequestParam int bbs_idx) {	
			logger.info("작성글 삭제 요청");
			return memberService.deleteWriteList(bbs_idx);
		}

		@RequestMapping("/member-detail")
		public ModelAndView detail(@RequestParam String id) {
			logger.info("멤버 상세보기");
			
			ModelAndView mav = new ModelAndView();
			
			mav.addObject("member", memberService.getMember(id));
			mav.setViewName("Member/myInfo");
			
			return mav;
		}
		
		@PostMapping("/member-update-form")
		public ModelAndView updateForm(@RequestParam String id, @RequestParam String password) {
			logger.info("updateForm 요청");
			
			ModelAndView mav = new ModelAndView();
			String viewName = "forward:/member-detail";
			String msg = "비밀번호가 일치하지 않습니다.";

			// 비밀번호 확인 성공
			if(loginService.login(id, password) != null) {
				mav.addObject("member", memberService.getMember(id));
				viewName = "Member/myUpdateForm";
				mav.setViewName(viewName);
				return mav;
			}
			
			logger.info(id);
			
			mav.addObject("msg", msg);
			mav.addObject("id", id);
			mav.setViewName(viewName);
			return mav;
		}
		
		@PostMapping("/member-update")
		public String updateMember(@ModelAttribute MemberDTO member) {
			logger.info("update 요청");
			
			memberService.update(member);
			
			return "forward:/member-detail";
		}
}
