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

	ArrayList<MemberDTO> blackList(int start, int end, String search, String keyword);

	ArrayList<MemberDTO> withdrawList(int start, int end, String search, String keyword);

	ArrayList<AdminDTO> memberSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> blackSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> withdrawSearch(HashMap<String, String> params);

	Object detailMember(String id);

	int restoreWithdraw(String id);

	ArrayList<AdminDTO> detailPet(String id);

	String toggleMemberDisable(String id);

	int memberBlackY(String id, Date black_date);

	int memberBlackN(String id);

	int insertBlack(String id, String loginId);

	ArrayList<AdminDTO> reportList(int start, int end, String search, String keyword);

	ArrayList<AdminDTO> finishList(int start, int end, String keyword);

	ArrayList<AdminDTO> replyList(int start, int end, String keyword);

	ArrayList<AdminDTO> finishReplyList(int start, int end, String keyword);
	
	ArrayList<AdminDTO> tipReportList();

	ArrayList<AdminDTO> galReportList();

	ArrayList<AdminDTO> fedReportList();

	ArrayList<AdminDTO> resReportList();

	ArrayList<AdminDTO> runReportList();

	ArrayList<AdminDTO> reportSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> finishListSearch(HashMap<String, String> params);

	Object detailReply(int field);

	ArrayList<AdminDTO> blindNList(int start, int end, String keyword);

	ArrayList<AdminDTO> blindYList(int start, int end, String keyword);

	int blindY(int field);
	
	int procY(int field, String loginId);

	int blindN(int idx);

	ArrayList<AdminDTO> blindNSearch(HashMap<String, String> params);

	ArrayList<AdminDTO> blindYSearch(HashMap<String, String> params);

	int blackDate(int black);

	ArrayList<String> loop_free(String string);

	void freedom(String string);

	ArrayList<MemberDTO> pointList(int start, int end, String keyword);

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

	int memberCount(String search, String keyword);

	int blackCount(String search, String keyword);

	int withdrawCount(String search, String keyword);

	int reportCount(String search, String keyword);

	int finishCount(String keyword);

	int pointCount(String keyword);

	int replyCount(String keyword);

	int replyprocY(int field, String loginId);

	int replyblindY(int field);

	int finishReplyCount(String keyword);

	int blindNCount(String keyword);

	int onlyBlindY(int idx);

	int blindYCount(String keyword);

	int onlyBlindN(int idx);

	

	




}
