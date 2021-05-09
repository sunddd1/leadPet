package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("note")
public class NoteDTO {
//	NOTE_IDX	NUMBER(5,0)
//	CONTENT	NVARCHAR2(500 CHAR)
//	REG_DATE	DATE
//	RECEIVING_ID	NVARCHAR2(50 CHAR)
//	CHECKED	NVARCHAR2(10 CHAR)
//	ID	NVARCHAR2(50 CHAR)
//	DEL	NVARCHAR2(10 CHAR)
	private int note_idx;
	private String content;
	private Date reg_date;
	private String receiving_id;
	private String checked;
	private String id;
	private String del;
	public int getNote_idx() {
		return note_idx;
	}
	public void setNote_idx(int note_idx) {
		this.note_idx = note_idx;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getReceiving_id() {
		return receiving_id;
	}
	public void setReceiving_id(String receiving_id) {
		this.receiving_id = receiving_id;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getDel() {
		return del;
	}
	public void setDel(String del) {
		this.del = del;
	}
	
}
