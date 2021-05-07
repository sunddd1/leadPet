package com.spring.main.dao;

import java.sql.Date;
import java.util.ArrayList;
import java.util.HashMap;

import com.spring.main.dto.AdminDTO;
import com.spring.main.dto.MemberDTO;
import com.spring.main.dto.SchedulerDTO;
import com.spring.main.dto.VaccinDTO;
import com.spring.main.dto.Vaccin_schedulerDTO;

public interface AdminDAO {

//	Object adminCheck(String loginId);

	ArrayList<AdminDTO> adminList(int start, int end, String search, String keyword);

	int change(String newPass, String id);

	int adminDelete(String id);

	int idCheck(String id);

	int nickCheck(String nickname);

	int insert(String id, String nickname, String pw);

	ArrayList<AdminDTO> search(HashMap<String, String> params);

	ArrayList<MemberDTO> memberList(int start, int end, String search, String keyword);

	ArrayList<MemberDTO> blackList();

	ArrayList<MemberDTO> withdrawList();

	ArrayList<AdminDTO> memberSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> blackSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> withdrawSearch(HashMap<String, String> params);

	Object detailMember(String id);

	int restoreWithdraw(String id);

	ArrayList<AdminDTO> detailPet(String id);

	String toggleMemberDisable(String id);

	int memberBlackY(String id, Date black_date);

	int memberBlackN(String id);

	String insertBlack(String id);

	ArrayList<AdminDTO> reportList();

	ArrayList<AdminDTO> finishList();

	ArrayList<AdminDTO> replyList();

	ArrayList<AdminDTO> finishReplyList();
	
	

	ArrayList<AdminDTO> tipReportList();

	ArrayList<AdminDTO> galReportList();

	ArrayList<AdminDTO> fedReportList();

	ArrayList<AdminDTO> resReportList();

	ArrayList<AdminDTO> runReportList();

	ArrayList<AdminDTO> reportSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> finishListSearch(HashMap<String, String> params);

	Object detailReply(int id);

	ArrayList<AdminDTO> blindNList();

	ArrayList<AdminDTO> blindYList();

	int blindY(int field);
	
	int procY(int field, String loginId);

	int blindN(int idx);

	ArrayList<AdminDTO> blindNSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> blindYSearch(HashMap<String, String> params);

	int blackDate(int black);

	ArrayList<String> loop_free(String string);

	void freedom(String string);

	ArrayList<MemberDTO> pointList();

	ArrayList<AdminDTO> pointListSearch(HashMap<String, String> params);
	
//	ArrayList<AdminDTO> typeReportList(String type);

//////////////
	ArrayList<VaccinDTO> vaccList();
	
	int regVacc(VaccinDTO dto);
	
	VaccinDTO regVaccDetail(String vacc_idx);
	
	int updateRegVacc(VaccinDTO dto);
	
	int deleteVacc(String vacc_idx);
	
	ArrayList<VaccinDTO> VaccSearch(String keyword, int start, int end);
	
	VaccinDTO vaccinDetailadded(int vacc_sche_idx);
	
	ArrayList<Vaccin_schedulerDTO> popup(HashMap<String, Object> map);


	int vaccCount(String keyword);

	int adminCount(String search, String keyword);

	

	




}
