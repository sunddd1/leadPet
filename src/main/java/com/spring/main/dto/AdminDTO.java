package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("admin")
public class AdminDTO {

	//admin 테이블
	private String admin_id;
	private String password;
	private String nickname;
	private Date reg_date;
	
	//blackList 테이블
	private int black_cnt;

	public String getAdmin_id() {
		return admin_id;
	}

	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getNickname() {
		return nickname;
	}

	public void setNickname(String nickname) {
		this.nickname = nickname;
	}

	public Date getReg_date() {
		return reg_date;
	}

	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}

	public int getBlack_cnt() {
		return black_cnt;
	}

	public void setBlack_cnt(int black_cnt) {
		this.black_cnt = black_cnt;
	}
	
	
}
