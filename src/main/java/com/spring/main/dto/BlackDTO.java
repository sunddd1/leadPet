package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("black")
public class BlackDTO {

	private int black_idx;
	private String id;
	private String admin_id;
	private String reason;
	private Date reg_date;
	private int black_cnt;
	
	public int getBlack_idx() {
		return black_idx;
	}
	public void setBlack_idx(int black_idx) {
		this.black_idx = black_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
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
