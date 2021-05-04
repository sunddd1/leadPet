package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("report")
public class ReportDTO {

	private int rep_idx;
	private int field;
	private String reason;
	private String proc_ex;
	private String reg_date;
	private String id;
	private String type;
	private String admin_id;
	private Date proc_date;
	
	public int getRep_idx() {
		return rep_idx;
	}
	public void setRep_idx(int rep_idx) {
		this.rep_idx = rep_idx;
	}
	public int getField() {
		return field;
	}
	public void setField(int field) {
		this.field = field;
	}
	public String getReason() {
		return reason;
	}
	public void setReason(String reason) {
		this.reason = reason;
	}
	public String getProc_ex() {
		return proc_ex;
	}
	public void setProc_ex(String proc_ex) {
		this.proc_ex = proc_ex;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAdmin_id() {
		return admin_id;
	}
	public void setAdmin_id(String admin_id) {
		this.admin_id = admin_id;
	}
	public Date getProc_date() {
		return proc_date;
	}
	public void setProc_date(Date proc_date) {
		this.proc_date = proc_date;
	}
	
	
	
}
