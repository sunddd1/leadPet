package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("report")
public class ReportDTO {

	private int rep_idx;
	private int field;
	private String reason;
	private String proc_ex;
	private Date reg_date;
	private String id;
	private String type_name;
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
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
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
