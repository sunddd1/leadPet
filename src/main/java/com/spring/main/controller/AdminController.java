package com.spring.main.controller;

import java.sql.Date;
import java.sql.Timestamp;
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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.service.AdminService;

import oracle.sql.DATE;

@Controller
public class AdminController {

	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminService service;

	@RequestMapping(value = "/admin", method = RequestMethod.GET)
	public String admin(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<AdminDTO> list = service.list();
			logger.info("관리자 수"+list.size());
			model.addAttribute("adminList", list);
//			page="admin/adminList";
//		}
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/changePass", method = RequestMethod.GET)
	public String changePass(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 비밀번호 수정 팝업요청");
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
		logger.info("관리자 비밀번호 수정 요청");
		int success = service.change(newPass,id);
		logger.info("비밀번호 수정 성공여부 :"+success);
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
		logger.info("관리자 삭제 요청");
		logger.info("삭제할 id="+id);
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
		logger.info("관리자 등록 팝업요청");
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
		logger.info("아이디 중복체크 요청");
		int success = service.idCheck(id);
		logger.info("아이디 중복여부:"+success);
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
		logger.info("닉네임 중복체크 요청");
		int success = service.nickCheck(nickname);
		logger.info("닉네임 중복여부:"+success);
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
		logger.info("관리자 등록 요청");
		int success = service.insert(id,nickname,pw);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/search", method = RequestMethod.GET)
	public String search(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("관리자 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.search(params);
		logger.info("검색된 관리자 수"+list.size());
		model.addAttribute("adminList", list);
//			page="admin/adminList";
//		}
		return "admin/adminList";
	}
	
	@RequestMapping(value = "/memberList", method = RequestMethod.GET)
	public String memberList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<MemberDTO> list = service.memberList();
			logger.info("일반 회원 수"+list.size());
			model.addAttribute("memberList", list);
//			page="admin/adminList";
//		}
		return "admin/memberList";
	}
	
	@RequestMapping(value = "/blackList", method = RequestMethod.GET)
	public String blackList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<MemberDTO> list = service.blackList();
			logger.info("블랙 회원 수"+list.size());
			model.addAttribute("blackList", list);
//			page="admin/adminList";
//		}
		return "admin/blackList";
	}
	
	@RequestMapping(value = "/withdrawList", method = RequestMethod.GET)
	public String withdrawList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			ArrayList<MemberDTO> list = service.withdrawList();
			logger.info("탈퇴 회원 수"+list.size());
			model.addAttribute("withdrawList", list);
//			page="admin/adminList";
//		}
		return "admin/withdrawList";
	}
	
	@RequestMapping(value = "/memberSearch", method = RequestMethod.POST)
	public String memberSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("회원 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.memberSearch(params);
		logger.info("검색된 회원 수"+list.size());
		model.addAttribute("memberList", list);
//			page="admin/adminList";
//		}
		return "admin/memberList";
	}
	
	@RequestMapping(value = "/blackSearch", method = RequestMethod.POST)
	public String blackSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("블랙 회원 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.blackSearch(params);
		logger.info("검색된 블랙 회원 수"+list.size());
		model.addAttribute("blackList", list);
//			page="admin/adminList";
//		}
		return "admin/blackList";
	}
	
	@RequestMapping(value = "/withdrawSearch", method = RequestMethod.POST)
	public String withdrawSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("탈퇴 회원 검색 요청");
		logger.info("셀렉트 :"+params.get("search")+"검색 키워드 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.withdrawSearch(params);
		logger.info("검색된 탈퇴 회원 수"+list.size());
		model.addAttribute("withdrawList", list);
//			page="admin/adminList";
//		}
		return "admin/withdrawList";
	}
	
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
		logger.info("회원 상세보기 팝업요청");
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
			@RequestParam(value="id") String id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("회원 복구 요청");
		int success = service.restoreWithdraw(id);
		logger.info("복구여부 : "+success);
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
		logger.info("반려동물 수"+list.size());
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
			logger.info("블랙 요청");
			if(service.toggleMemberDisable(id).equals("N")) {
				black = black+1;
				int cnt = service.blackDate(black);
				cnt = cnt*24*60*60*1000;
				java.util.Date date = new java.util.Date();
				java.sql.Date black_date = new java.sql.Date(date.getTime()+cnt);
				logger.info("black_date"+black_date+"/"+date+"/"+cnt);
				service.memberBlackY(id,black_date);
//				service.insertBlack(id);
				return "Y";
			}else {
//				service.memberBlackN(id);
				return "N";
			}
	//		page="admin/adminList";
//		}
	}
	
	@RequestMapping(value = "/reportList", method = RequestMethod.GET)
	public String reportList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.reportList();
		logger.info("미처리 글 신고 수"+list.size());
		model.addAttribute("reportList", list);
//			page="admin/adminList";
//		}
		return "admin/reportList";
	}
	
	@RequestMapping(value = "/finishList", method = RequestMethod.GET)
	public String finishList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.finishList();
		logger.info("처리 글 신고 수"+list.size());
		model.addAttribute("finishList", list);
//			page="admin/adminList";
//		}
		return "admin/finishList";
	}
	
	@RequestMapping(value = "/replyList", method = RequestMethod.GET)
	public String replyList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.replyList();
		logger.info("미처리 댓글 신고 수"+list.size());
		model.addAttribute("replyList", list);
//			page="admin/adminList";
//		}
		return "admin/replyList";
	}
	
	@RequestMapping(value = "/finishReplyList", method = RequestMethod.GET)
	public String finishReplyList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.finishReplyList();
		logger.info("처리 댓글 신고 수"+list.size());
		model.addAttribute("finishReplyList", list);
//			page="admin/adminList";
//		}
		return "admin/finishReplyList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/type", method = RequestMethod.GET)
	public HashMap<String, Object> type(
			Model model, 
			HttpSession session,
			@RequestParam(value="type") String type
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			logger.info("선택된 타입:"+type);
			HashMap<String, Object> map = new HashMap<String, Object>();
			ArrayList<AdminDTO> list = null;
			if(type.equals("tip")) {
				list =	service.tipReportList();
				logger.info("팁 신고 수"+list.size());
			}else if(type.equals("gal")){
				list =	service.galReportList();
				logger.info("갤러리 신고 수"+list.size());
			}else if(type.equals("fed")){
				list =	service.fedReportList();
				logger.info("사료 신고 수"+list.size());
			}else if(type.equals("res")){
				list =	service.resReportList();
				logger.info("식당 신고 수"+list.size());
			}else if(type.equals("run")){
				list =	service.runReportList();
				logger.info("산책 신고 수"+list.size());
			}
//		ArrayList<AdminDTO> list =	service.typeReportList(type);
//		logger.info("신고 수"+list.size());
//		model.addAttribute("reportList", list);
//			page="admin/adminList";
//		}
			map.put("reportList", list);
			return map;
	}
	
	@RequestMapping(value = "/reportSearch", method = RequestMethod.POST)
	public String reportSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("검색 아이디 :"+params.get("keyword"));
		ArrayList<AdminDTO> list = service.reportSearch(params);
		logger.info("미처리 글 검색된 수"+list.size());
		model.addAttribute("reportList", list);
//			page="admin/adminList";
//		}
		return "admin/reportList";
	}
	
	@RequestMapping(value = "/finishListSearch", method = RequestMethod.GET)
	public String finishListSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.finishListSearch(params);
		logger.info("처리 글 검색 수"+list.size());
		model.addAttribute("finishList", list);
//			page="admin/adminList";
//		}
		return "admin/finishList";
	}
	
	@RequestMapping(value = "/detailReply", method = RequestMethod.GET)
	public String detailReply(
			Model model, 
			HttpSession session,
			@RequestParam int id
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		logger.info("신고댓글 상세보기 팝업요청");
		model.addAttribute("dto",service.detailReply(id));
//			page="admin/adminList";
//		}
		return "admin/detailReply";
	}
	
	@RequestMapping(value = "/blindNList", method = RequestMethod.GET)
	public String blindNList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.blindNList();
		model.addAttribute("blindNList", list);
//			page="admin/adminList";
//		}
		return "admin/blindNList";
	}
	
	@RequestMapping(value = "/blindYList", method = RequestMethod.GET)
	public String blindYList(Model model, HttpSession session) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.blindYList();
		model.addAttribute("blindYList", list);
//			page="admin/adminList";
//		}
		return "admin/blindYList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/blindY", method = RequestMethod.GET)
	public int blindY(
			Model model, 
			HttpSession session,
			@RequestParam(value="idx") int idx
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		int success = service.blindY(idx);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/procY", method = RequestMethod.GET)
	public String procY(
			Model model, 
			HttpSession session,
			@RequestParam int rep_idx
			) {
		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
			service.procY(rep_idx,loginId);
//			page="admin/adminList";
//		}
		return "admin/reportList";
	}
	
	@ResponseBody
	@RequestMapping(value = "/blindN", method = RequestMethod.GET)
	public int blindN(Model model, HttpSession session,@RequestParam(value="idx") int idx) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		int success = service.blindN(idx);
//			page="admin/adminList";
//		}
		return success;
	}
	
	@RequestMapping(value = "/blindNSearch", method = RequestMethod.POST)
	public String blindNSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.blindNSearch(params);
		model.addAttribute("blindNList", list);
//			page="admin/adminList";
//		}
		return "admin/blindNList";
	}
	
	@RequestMapping(value = "/blindYSearch", method = RequestMethod.POST)
	public String blindYSearch(
			Model model, 
			HttpSession session,
			@RequestParam HashMap<String, String> params
			) {
//		String loginId = (String) session.getAttribute("loginId");
//		service.adminCheck(loginId);
//		String page ="admin/adminList";
//		if(loginId != null) {
		ArrayList<AdminDTO> list = service.blindYSearch(params);
		model.addAttribute("blindYList", list);
//			page="admin/adminList";
//		}
		return "admin/blindYList";
	}
	
	////////regVaccForm
	@RequestMapping(value = "/vaccList", method = RequestMethod.GET)
	public ModelAndView vaccList(HttpSession session) {
		logger.info("백신 리스트 불러오기");
		return service.vaccList(session);
	}
	@RequestMapping(value = "/regVaccForm", method = RequestMethod.GET)
	public String regVaccForm(HttpSession session) {
		logger.info("백신 리스트 불러오기");
		return "./admin/regVaccForm";
	}
	
	@RequestMapping(value = "/regVacc", method = RequestMethod.POST)
	public @ResponseBody HashMap<String, Object> regVacc(HttpSession session,@ModelAttribute VaccinDTO dto) {
		logger.info("dto 확인 : "+dto.getVacc_name()+"/"+dto.getContent()+"/"+dto.getCycle()+"/"+dto.getVacc_cnt()+"/"+dto.getDog_cat() );
		return service.regVacc(dto);
	}
	
	@RequestMapping(value = "/regVaccDetail", method = RequestMethod.GET)
	public ModelAndView regVaccDetail(HttpSession session,@RequestParam String vacc_idx) {
		logger.info("백신 상세보기 "+vacc_idx);
		return service.regVaccDetail(vacc_idx);
	}
	
	@RequestMapping(value = "/deleteVacc", method = RequestMethod.GET)
	public ModelAndView deleteVacc(HttpSession session,@RequestParam String vacc_idx) {
		logger.info("백신 삭제요청 "+vacc_idx);
		return service.deleteVacc(vacc_idx);
	}
	
	@RequestMapping(value = "/VaccSearch", method = RequestMethod.GET)
	public ModelAndView VaccSearch(HttpSession session,@RequestParam String keyword) {
		logger.info("백신 검색요청 "+keyword);
		return service.VaccSearch(keyword);
	}
	
	
	
}
