package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("point")
public class PointDTO {

	private String id;
	private String gain;
	private Date reg_date;
	private int pm_point;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getGain() {
		return gain;
	}
	public void setGain(String gain) {
		this.gain = gain;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public int getPm_point() {
		return pm_point;
	}
	public void setPm_point(int pm_point) {
		this.pm_point = pm_point;
	}
	
	
}
