package com.spring.main.controller;

import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.service.AdminService;

@Controller
public class AdminController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;
	
	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public ModelAndView admin(@RequestParam(required = false) String search,
			@RequestParam(required = false) String keyword) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		logger.info(search);
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/adminList");
		return mav;
	}

	@ResponseBody
	@RequestMapping(value = "/adminList", method = RequestMethod.GET)
	public HashMap<String, Object> adminList(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String search,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(search+"/"+keyword);
//			page="admin/adminList";
//		}
		return service.list(pagePerCnt,page,search,keyword);
		
	}
	

	
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public String changePass(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("????????? ???????????? ?????? ????????????");
//			page="admin/adminList";
//		}
		return "admin/changePass";
	}
	
	@ResponseBody
	@RequestMapping(value = "/change", method = RequestMethod.GET)
	public int change
		(
			Model model, 
			HttpSession session, 
			@RequestParam(value="newPass") String newPass,
			@RequestParam(value="id") String id
		) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(newPass+"/"+id);
		logger.info("????????? ???????????? ?????? ??????");
		int success = service.change(newPass,id);
		logger.info("???????????? ?????? ???????????? :"+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/adminDelete", method = RequestMethod.GET)
	public String adminDelete(Model model, HttpSession session, @RequestParam String id) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("????????? ?????? ??????");
		logger.info("????????? id="+id);
		int success = service.adminDelete(id);
//			page="admin/adminList";
//		}
		return "redirect:/admin";
	}
	
	@RequestMapping(value = "/adminInsert", method = RequestMethod.GET)
	public String adminInsert(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("????????? ?????? ????????????");
//			page="admin/adminList";
//		}
		return "admin/adminInsert";
	}
	
	@ResponseBody
	@RequestMapping(value = "/idCheck", method = RequestMethod.GET)
	public int  idCheck(
			Model model, 
			HttpSession session,
			@RequestParam(value="id") String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("????????? ???????????? ??????");
		int success = service.idCheck(id);
		logger.info("????????? ????????????:"+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@ResponseBody
	@RequestMapping(value = "/nickCheck", method = RequestMethod.GET)
	public int  nickCheck(
			Model model, 
			HttpSession session,
			@RequestParam(value="nickname") String nickname
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("????????? ???????????? ??????");
		int success = service.nickCheck(nickname);
		logger.info("????????? ????????????:"+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@ResponseBody
	@RequestMapping(value = "/insert", method = RequestMethod.GET)
	public int insert(
			Model model, 
			HttpSession session,
			@RequestParam(value="id") String id,
			@RequestParam(value="nickname") String nickname,
			@RequestParam(value="pw") String pw
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("????????? ?????? ??????");
		int success = service.insert(id,nickname,pw);
//			page="admin/adminList";
//		}
		return success;
	}
	
//	@RequestMapping(value = "/search", method = RequestMethod.GET)
//	public String search(
//			Model model, 
//			HttpSession session,
//			@RequestParam HashMap<String, String> params
//			) {
////		String loginId = (String) session.getAttribute("loginId");
////		service.adminCheck(loginId);
////		String page ="admin/adminList";
////		if(loginId != null) {
//		logger.info("????????? ?????? ??????");
//		logger.info("????????? :"+params.get("search")+"?????? ????????? :"+params.get("keyword"));
//		ArrayList<AdminDTO> list = service.search(params);
//		logger.info("????????? ????????? ???"+list.size());
//		model.addAttribute("adminList", list);
////			page="admin/adminList";
////		}
//		return "admin/adminList";
//	}
	
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public ModelAndView memberList(
			@RequestParam(required = false) String search,
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		logger.info(search);
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/memberList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/memberListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> memberListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String search,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(search+"/"+keyword);
//			page="admin/adminList";
//		}
		return service.memberList(pagePerCnt,page,search,keyword);
		
	}
	
	@RequestMapping(value = "/blackList", method = RequestMethod.GET)
	public ModelAndView blackList(
			@RequestParam(required = false) String search,
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		logger.info(search);
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/blackList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/blackListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> blackListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String search,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(search+"/"+keyword);
//			page="admin/adminList";
//		}
		return service.blackList(pagePerCnt,page,search,keyword);
		
	}
	
	@RequestMapping(value = "/withdrawList", method = RequestMethod.GET)
	public ModelAndView withdrawList(
			@RequestParam(required = false) String search,
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		logger.info(search);
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/withdrawList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/withdrawListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> withdrawListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String search,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(search+"/"+keyword);
//			page="admin/adminList";
//		}
		return service.withdrawList(pagePerCnt,page,search,keyword);
		
	}
	
//	@RequestMapping(value = "/memberSearch", method = RequestMethod.POST)
//	public String memberSearch(
//			Model model, 
//			HttpSession session,
//			@RequestParam HashMap<String, String> params
//			) {
////		String loginId = (String) session.getAttribute("loginId");
////		service.adminCheck(loginId);
////		String page ="admin/adminList";
////		if(loginId != null) {
//		logger.info("?????? ?????? ??????");
//		logger.info("????????? :"+params.get("search")+"?????? ????????? :"+params.get("keyword"));
//		ArrayList<AdminDTO> list = service.memberSearch(params);
//		logger.info("????????? ?????? ???"+list.size());
//		model.addAttribute("memberList", list);
////			page="admin/adminList";
////		}
//		return "admin/memberList";
//	}
//	
//	@RequestMapping(value = "/blackSearch", method = RequestMethod.POST)
//	public String blackSearch(
//			Model model, 
//			HttpSession session,
//			@RequestParam HashMap<String, String> params
//			) {
////		String loginId = (String) session.getAttribute("loginId");
////		service.adminCheck(loginId);
////		String page ="admin/adminList";
////		if(loginId != null) {
//		logger.info("?????? ?????? ?????? ??????");
//		logger.info("????????? :"+params.get("search")+"?????? ????????? :"+params.get("keyword"));
//		ArrayList<AdminDTO> list = service.blackSearch(params);
//		logger.info("????????? ?????? ?????? ???"+list.size());
//		model.addAttribute("blackList", list);
////			page="admin/adminList";
////		}
//		return "admin/blackList";
//	}
//	
//	@RequestMapping(value = "/withdrawSearch", method = RequestMethod.POST)
//	public String withdrawSearch(
//			Model model, 
//			HttpSession session,
//			@RequestParam HashMap<String, String> params
//			) {
////		String loginId = (String) session.getAttribute("loginId");
////		service.adminCheck(loginId);
////		String page ="admin/adminList";
////		if(loginId != null) {
//		logger.info("?????? ?????? ?????? ??????");
//		logger.info("????????? :"+params.get("search")+"?????? ????????? :"+params.get("keyword"));
//		ArrayList<AdminDTO> list = service.withdrawSearch(params);
//		logger.info("????????? ?????? ?????? ???"+list.size());
//		model.addAttribute("withdrawList", list);
////			page="admin/adminList";
////		}
//		return "admin/withdrawList";
//	}
	
	@RequestMapping(value = "/detailMember", method = RequestMethod.GET)
	public String detailMember(
			Model model, 
			HttpSession session,
			@RequestParam String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("?????? ???????????? ????????????");
		model.addAttribute("dto",service.detailMember(id));
//			page="admin/adminList";
//		}
		return "admin/detailMember";
	}
	
	@ResponseBody
	@RequestMapping(value = "/restoreWithdraw", method = RequestMethod.GET)
	public Integer restoreWithdraw(
			Model model, 
			HttpSession session,
			@RequestParam String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("?????? ?????? ??????:"+id);
		int success = service.restoreWithdraw(id);
		logger.info("???????????? : "+success);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/detailPet", method = RequestMethod.GET)
	public String detailPet(Model model, HttpSession session,@RequestParam String id) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		model.addAttribute("dto",service.detailMember(id));
		ArrayList<AdminDTO> list = service.detailPet(id);
		logger.info("???????????? ???"+list.size());
		model.addAttribute("petList", list);
//			page="admin/adminList";
//		}
		return "admin/detailPet";
	}
	
	
	@Transactional
	@RequestMapping(value = "/toggleMemberDisable", method = RequestMethod.GET)
	public @ResponseBody String toggleMemberDisable(
			Model model, 
			HttpSession session,
			@RequestParam(value="id") String id,
			@RequestParam(value="black") int black
			) {
		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			logger.info("?????? ??????");
			if(service.toggleMemberDisable(id).equals("N")) {
				black = black+1;
				int cnt = service.blackDate(black);
				cnt = cnt*24*60*60*1000;
				java.util.Date date = new java.util.Date();
				java.sql.Date black_date = new java.sql.Date(date.getTime()+cnt);
				logger.info("black_date"+black_date+"/"+date+"/"+cnt);
				service.memberBlackY(id,black_date);
				service.insertBlack(id,loginId);
				return "Y";
			}else {
				service.memberBlackN(id);
				return "N";
			}
	//		page="admin/adminList";
//		}
	}
	
	@RequestMapping(value = "/reportList", method = RequestMethod.GET)
	public ModelAndView reportList(
			@RequestParam(required = false) String search,
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("search",search);
		logger.info(search);
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/reportList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/reportListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> reportListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String search,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(search+"/"+keyword);
//			page="admin/adminList";
//		}
		return service.reportList(pagePerCnt,page,search,keyword);
		
	}
	
	@RequestMapping(value = "/finishList", method = RequestMethod.GET)
	public ModelAndView finishList(
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/finishList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/finishListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> finishListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(keyword);
//			page="admin/adminList";
//		}
		return service.finishList(pagePerCnt,page,keyword);
		
	}
	@RequestMapping(value = "/pointList", method = RequestMethod.GET)
	public ModelAndView pointList(
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/pointList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/pointListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> pointListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(keyword);
//			page="admin/adminList";
//		}
		return service.pointList(pagePerCnt,page,keyword);
		
	}
	
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public ModelAndView replyList(
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/replyList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/replyListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> replyListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(keyword);
//			page="admin/adminList";
//		}
		return service.replyList(pagePerCnt,page,keyword);
		
	}
	
	@RequestMapping(value = "/finishReplyList", method = RequestMethod.GET)
	public ModelAndView finishReplyList(
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/finishReplyList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/finishReplyListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> finishReplyListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(keyword);
//			page="admin/adminList";
//		}
		return service.finishReplyList(pagePerCnt,page,keyword);
		
	}
	
	@RequestMapping(value = "/blindNList", method = RequestMethod.GET)
	public ModelAndView blindNList(
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/blindNList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/blindNListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> blindNListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info(keyword);
//			page="admin/adminList";
//		}
		return service.blindNList(pagePerCnt,page,keyword);
		
	}
	
	
	@RequestMapping(value = "/blindYList", method = RequestMethod.GET)
	public ModelAndView blindYList(
			@RequestParam(required = false) String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("keyword",keyword);
		mav.setViewName("admin/blindYList");
//			page="admin/adminList";
//		}
		return mav;
	}
	
	@ResponseBody
	@RequestMapping(value = "/blindYListSearch", method = RequestMethod.GET)
	public HashMap<String, Object> blindYListSearch(
			Model model, 
			HttpSession session,
			@RequestParam int pagePerCnt, 
			@RequestParam int page,
			@RequestParam String keyword
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("keyword:"+keyword);
//			page="admin/adminList";
//		}
		return service.blindYList(pagePerCnt,page,keyword);
		
	}
//	@ResponseBody
//	@RequestMapping(value = "/type", method = RequestMethod.GET)
//	public HashMap<String, Object> type(
//			Model model, 
//			HttpSession session,
//			@RequestParam String type
//			) {
////		String loginId = (String) session.getAttribute("loginId");
////		service.adminCheck(loginId);
////		String page ="admin/adminList";
////		if(loginId != null) {
//			logger.info("????????? ??????:"+type);
//			HashMap<String, Object> map = new HashMap<String, Object>();
//			ArrayList<AdminDTO> list = null;
//			if(type.equals("tip")) {
//				list =	service.tipReportList();
//				logger.info("??? ?????? ???"+list.size());
//			}else if(type.equals("gal")){
//				list =	service.galReportList();
//				logger.info("????????? ?????? ???"+list.size());
//			}else if(type.equals("fed")){
//				list =	service.fedReportList();
//				logger.info("?????? ?????? ???"+list.size());
//			}else if(type.equals("res")){
//				list =	service.resReportList();
//				logger.info("?????? ?????? ???"+list.size());
//			}else if(type.equals("run")){
//				list =	service.runReportList();
//				logger.info("?????? ?????? ???"+list.size());
//			}
////		ArrayList<AdminDTO> list =	service.typeReportList(type);
////		logger.info("?????? ???"+list.size());
////		model.addAttribute("reportList", list);
////			page="admin/adminList";
////		}
//			map.put("reportList", list);
//			return map;
//	}
	
	@RequestMapping(value = "/detailReply", method = RequestMethod.GET)
	public String detailReply(
			Model model, 
			HttpSession session,
			@RequestParam int field
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("???????????? ???????????? ????????????");
		model.addAttribute("dto",service.detailReply(field));
//			page="admin/adminList";
//		}
		return "admin/detailReply";
	}
	
	@RequestMapping(value = "/procY", method = RequestMethod.GET)
	public String procY(
			Model model, 
			HttpSession session,
			@RequestParam int field
			) {
		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			service.procY(field,loginId);
			service.blindY(field);
//			page="admin/adminList";
//		}
		return "admin/reportList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/blindY", method = RequestMethod.GET)
	public int blindY(
			Model model, 
			HttpSession session,
			@RequestParam int idx
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			int success = service.onlyBlindY(idx);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@ResponseBody
	@RequestMapping(value = "/blindN", method = RequestMethod.GET)
	public int blindN(
			Model model, 
			HttpSession session,
			@RequestParam int idx
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			int success = service.onlyBlindN(idx);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/replyprocY", method = RequestMethod.GET)
	public String replyprocY(
			Model model, 
			HttpSession session,
			@RequestParam int field
			) {
		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			service.replyprocY(field,loginId);
			service.replyblindY(field);
//			page="admin/adminList";
//		}
		return "admin/replyList";
	}
	
	////////regVaccForm
	@RequestMapping(value = "/vaccList", method = RequestMethod.GET)
	public ModelAndView vaccList(HttpSession session) {
		logger.info("?????? ????????? ????????????");
		return service.vaccList(session);
	}
	@RequestMapping(value = "/regVaccForm", method = RequestMethod.GET)
	public String regVaccForm(HttpSession session) {
		logger.info("?????? ????????? ????????????");
		return "./admin/regVaccForm";
	}
	
	@RequestMapping(value = "/regVacc", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> regVacc(HttpSession session,@ModelAttribute VaccinDTO dto) {
		logger.info("dto ?????? : "+dto.getVacc_name()+"/"+dto.getContent()+"/"+dto.getCycle()+"/"+dto.getVacc_cnt()+"/"+dto.getDog_cat() );
		return service.regVacc(dto);
	}
	
	@RequestMapping(value = "/regVaccDetail", method = RequestMethod.GET)
	public ModelAndView regVaccDetail(HttpSession session,@RequestParam String vacc_idx) {
		logger.info("?????? ???????????? "+vacc_idx);
		return service.regVaccDetail(vacc_idx);
	}
	
	@RequestMapping(value = "/deleteVacc", method = RequestMethod.GET)
	public ModelAndView deleteVacc(HttpSession session,@RequestParam String vacc_idx) {
		logger.info("?????? ???????????? "+vacc_idx);
		return service.deleteVacc(vacc_idx);
	}
	
	@RequestMapping(value = "/VaccSearch", method = RequestMethod.GET)
	public @ResponseBody HashMap<String, Object> VaccSearch(HttpSession session,@RequestParam int pagePerCnt, @RequestParam int page,@RequestParam String keyword) {
		logger.info("?????? ???????????? "+keyword);
		logger.info("?????? ???????????? ????????? "+pagePerCnt +"/"+page);
		return service.VaccSearch(page,pagePerCnt,keyword);
	}
	
	@RequestMapping(value = "/reqVaccSearch", method = RequestMethod.GET)
	public ModelAndView reqVaccSearch(@RequestParam String keyword) {
		logger.info("???????????? : {} ",keyword );
		ModelAndView mav = new ModelAndView();
		mav.addObject("vaCkeyword", keyword);
		mav.setViewName("admin/vaccinList");
		return mav;
	}
	
}
