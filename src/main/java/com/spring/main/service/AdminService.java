package com.spring.main.service;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.spring.main.dao.AdminDAO;
import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.VaccinDTO;

@Service
public class AdminService {
	
	private Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Autowired AdminDAO dao;

//	public Object adminCheck(String loginId) {
//		return dao.adminCheck(loginId);
//	}
	
	public HashMap<String, Object> list(int pagePerCnt, int page, String search, String keyword) {
		logger.info("관리자 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.adminCount(search,keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.adminList(start,end,search,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> memberList(int pagePerCnt, int page, String search, String keyword) {
		logger.info("회원 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.memberCount(search,keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.memberList(start,end,search,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> blackList(int pagePerCnt, int page, String search, String keyword) {
		logger.info("블랙 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.blackCount(search,keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.blackList(start,end,search,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> withdrawList(int pagePerCnt, int page, String search, String keyword) {
		logger.info("탈퇴 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.withdrawCount(search,keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.withdrawList(start,end,search,keyword));
		
		return map;
	}

	public HashMap<String, Object> reportList(int pagePerCnt, int page, String search, String keyword) {
		logger.info("신고 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.reportCount(search,keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.reportList(start,end,search,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> finishList(int pagePerCnt, int page, String keyword) {
		logger.info("신고처리 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.finishCount(keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.finishList(start,end,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> pointList(int pagePerCnt, int page, String keyword) {
		logger.info("포인트 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.pointCount(keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.pointList(start,end,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> replyList(int pagePerCnt, int page, String keyword) {
		logger.info("미처리 댓글 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.replyCount(keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.replyList(start,end,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> finishReplyList(int pagePerCnt, int page, String keyword) {
		logger.info("처리 댓글 신고 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.finishReplyCount(keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.finishReplyList(start,end,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> blindNList(int pagePerCnt, int page, String keyword) {
		logger.info("블라인드N 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.blindNCount(keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.blindNList(start,end,keyword));
		
		return map;
	}
	
	public HashMap<String, Object> blindYList(int pagePerCnt, int page, String keyword) {
		logger.info("블라인드Y 리스트 서비스 도착");
		HashMap<String, Object> map = new HashMap<String, Object>();
		keyword = "%"+keyword+"%";
		int allCnt = dao.blindYCount(keyword);
		
		logger.info("allCnt:"+allCnt);
		int range = allCnt%pagePerCnt >0?Math.round(allCnt/pagePerCnt)+1 : Math.round(allCnt/pagePerCnt);
		map.put("range", range);
		logger.info("page:"+page);
		map.put("currPage", page);
		page=page>range ? range:page;
		
		int end = page * pagePerCnt;
		int start = end - pagePerCnt+1;
		map.put("list", dao.blindYList(start,end,keyword));
		
		return map;
	}
	
	public int change(String newPass, String id) {
		logger.info("비밀번호 수정 서비스 도착");
		return dao.change(newPass,id);
	}

	public int adminDelete(String id) {
		logger.info("관리자 삭제 서비스 도착");
		return dao.adminDelete(id);
	}

	public int idCheck(String id) {
		logger.info("아이디 중복체크 서비스 도착");
		return dao.idCheck(id);
	}
	
	public int nickCheck(String nickname) {
		logger.info("닉네임 중복체크 서비스 도착");
		return dao.nickCheck(nickname);
	}
	
	public int insert(String id, String nickname, String pw) {
		logger.info("관리자 등록 서비스 도착");
		return dao.insert(id,nickname,pw);
	}

	public ArrayList<AdminDTO> search(HashMap<String, String> params) {
		logger.info("관리자 검색 서비스 도착");
		return dao.search(params);
	}

	public Object detailMember(String id) {
		logger.info("회원 상세보기 서비스 도착");
		return dao.detailMember(id);
	}

	public ArrayList<AdminDTO> detailPet(String id) {
		logger.info("반려동물 상세보기 서비스 도착");
		return dao.detailPet(id);
	}
	
	public int restoreWithdraw(String id) {
		logger.info("회원 복구 서비스 도착");
		return dao.restoreWithdraw(id);
	}

	public String toggleMemberDisable(String id) {
		logger.info("블랙 서비스 요청");
		return dao.toggleMemberDisable(id);
	}

	public int memberBlackY(String id, Date black_date) {
		logger.info("블랙 요청");
		return dao.memberBlackY(id,black_date);
	}

	public int memberBlackN(String id) {
		logger.info("블랙 해제 요청");
		return dao.memberBlackN(id);
	}

	public int insertBlack(String id, String loginId) {
		logger.info("블랙 추가 요청");
		return dao.insertBlack(id,loginId);
	}

	public ArrayList<AdminDTO> tipReportList() {
		logger.info("팁 신고 서비스 요청");
		return dao.tipReportList();
	}

	public ArrayList<AdminDTO> galReportList() {
		logger.info("갤러리 신고 서비스 요청");
		return dao.galReportList();
	}

	public ArrayList<AdminDTO> fedReportList() {
		logger.info("사료 신고 서비스 요청");
		return dao.fedReportList();
	}

	public ArrayList<AdminDTO> resReportList() {
		logger.info("식당 신고 서비스 요청");
		return dao.resReportList();
	}

	public ArrayList<AdminDTO> runReportList() {
		logger.info("산책 신고 서비스 요청");
		return dao.runReportList();
	}

	public ArrayList<AdminDTO> reportSearch(HashMap<String, String> params) {
		logger.info("미처리 신고 검색 서비스 도착");
		return dao.reportSearch(params);
	}

	public ArrayList<AdminDTO> finishListSearch(HashMap<String, String> params) {
		logger.info("처리 신고 검색 서비스 도착");
		return dao.finishListSearch(params);
	}

	public Object detailReply(int field) {
		logger.info("신고댓글 상세보기 서비스 도착");
		return dao.detailReply(field);
	}

	public int blindY(int field) {
		logger.info("블라인드 Y처리 서비스 도착");
		return dao.blindY(field);
	}
	
	public int onlyBlindY(int idx) {
		logger.info("블라인드 Y");
		return dao.onlyBlindY(idx);
	}
	
	public int procY(int field, String loginId) {
		logger.info("처리유무 Y처리 서비스 도착");
		return dao.procY(field,loginId);
	}
	
	public int replyprocY(int field, String loginId) {
		logger.info("댓글 처리유무 Y처리 서비스 도착");
		return dao.replyprocY(field,loginId);
		
	}

	public int replyblindY(int field) {
		logger.info("댓글 블라인드 Y처리 서비스 도착");
		return dao.replyblindY(field);
		
	}

	public int blindN(int idx) {
		logger.info("블라인드 N처리 서비스 도착");
		return dao.blindN(idx);
	}
	
	public int onlyBlindN(int idx) {
		logger.info("블라인드 N");
		return dao.onlyBlindN(idx);
	}


	public ArrayList<AdminDTO> blindNSearch(HashMap<String, String> params) {
		logger.info("블라인드 N 닉네임 검색 서비스 도착");
		return dao.blindNSearch(params);
	}

	public ArrayList<AdminDTO> blindYSearch(HashMap<String, String> params) {
		logger.info("블라인드 Y 닉네임 검색 서비스 도착");
		return dao.blindYSearch(params);
	}

	public int blackDate(int black) {
		logger.info("블랙 날짜 서비스 도착");
		return dao.blackDate(black);
		
	}

//	public ArrayList<AdminDTO> typeReportList(String type) {
//		logger.info("타입 신고 서비스 요청");
//		return dao.typeReportList(type);
//	}
	
	
	public ArrayList<AdminDTO> pointListSearch(HashMap<String, String> params) {
		logger.info("포인트 검색 서비스 도착");
		return dao.pointListSearch(params);
	}


/////////////////
	public ModelAndView vaccList(HttpSession session) {
	ModelAndView mav = new ModelAndView();
	ArrayList<VaccinDTO> list = dao.vaccList();
	
	mav.addObject("list", list);
	mav.setViewName("admin/vaccinList");
	return mav;
	}
	
	public HashMap<String, Object> regVacc(VaccinDTO dto) {
	HashMap<String, Object> map = new HashMap<String, Object>();
	int suc =0;
	if(dto.getVacc_idx()>0) {
	suc = dao.updateRegVacc(dto);
	}else {
	suc = dao.regVacc(dto);			
	}
	
	map.put("suc", suc);
	return map;
	}
	
	public ModelAndView regVaccDetail(String vacc_idx) {
	ModelAndView mav = new ModelAndView();
	VaccinDTO vacc = dao.regVaccDetail(vacc_idx);
	vacc.setType(vacc.getVacc_name().substring(vacc.getVacc_name().indexOf("(")+1, vacc.getVacc_name().lastIndexOf(")")));
	vacc.setVacc_name(vacc.getVacc_name().substring(0, vacc.getVacc_name().indexOf("(")));
	mav.addObject("vacc", vacc);
	mav.setViewName("admin/regVaccForm");
	return mav;
	}
	
	public ModelAndView deleteVacc(String vacc_idx) {
	ModelAndView mav = new ModelAndView();
	int suc= dao.deleteVacc(vacc_idx);
	logger.info("삭제여부 : "+suc);
	mav.setViewName("redirect:./vaccList");
	return mav;
	}
	
	public @ResponseBody HashMap<String, Object> VaccSearch(int page, int pagePerCnt,String keyword) {
		keyword = "%"+keyword+"%";
		HashMap<String, Object> map = new HashMap<String, Object>();
		int allCnt = dao.vaccCount(keyword);
		
		int range = allCnt%pagePerCnt >0 ? ((int)Math.floor(allCnt/pagePerCnt))+1 : allCnt/pagePerCnt;
		page = page>range? range:page;
		
		int end = page * pagePerCnt;
		System.out.println("end = "+page+"*"+pagePerCnt);
		
		int start = end-pagePerCnt+1;
		System.out.println("start = "+end+"-"+pagePerCnt+"+1");
		logger.info("키워드 : "+ keyword +"//" +start+"//"+end+"//"+range);
		
		
		ArrayList<VaccinDTO> result = dao.VaccSearch(keyword,start,end);
		logger.info("result : "+result.size());
		
		map.put("list", result);
		map.put("range",range);
		map.put("currPage",page);
	
		return map;
	}

	public int allCount() {
		return 0;
	}

	
	

	

	

	


	


	




}
