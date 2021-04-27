package com.spring.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("scheduler")
public class SchedulerDTO {
//	SCHE_IDX NOT NULL NUMBER(5)      
//	REG_DATE          DATE           
//	D_DAY             DATE           
//	CONTENT           NVARCHAR2(500) 
//	CYCLE             NUMBER(5)      
//	ID                NVARCHAR2(50)  

	
	private int sche_idx;
	private String reg_date;
	private String d_day;
	private String content;
	private int cycle;
	private String id;
	private String subject;
	
	public String getSubject() {
		return subject;
	}
	public void setSubject(String subject) {
		this.subject = subject;
	}
	public int getSche_idx() {
		return sche_idx;
	}
	public void setSche_idx(int sche_idx) {
		this.sche_idx = sche_idx;
	}
	public String getReg_date() {
		return reg_date;
	}
	public void setReg_date(String reg_date) {
		this.reg_date = reg_date;
	}
	public String getD_day() {
		return d_day;
	}
	public void setD_day(String d_day) {
		this.d_day = d_day;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public int getCycle() {
		return cycle;
	}
	public void setCycle(int cycle) {
		this.cycle = cycle;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}

}
