package com.spring.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("vaccin_scheduler")
public class Vaccin_schedulerDTO {

//	VACC_SCHE_IDX NOT NULL NUMBER(5)     
//	REG_DATE               DATE          
//	D_DAY                  DATE          
//	ID                     NVARCHAR2(50) 
//	VAC_IDX                NUMBER(5)     
//	EXECUTED               NVARCHAR2(10) 
	private int vacc_sche_idx;
	private String reg_date;	
	private String d_day;
	private String id;
	private String executed;
	private int vac_idx;
	
////////////
	private String vacc_name;
	private String pet_name;
	
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getVacc_name() {
		return vacc_name;
	}
	public void setVacc_name(String vacc_name) {
		this.vacc_name = vacc_name;
	}

	public int getVacc_sche_idx() {
		return vacc_sche_idx;
	}
	public void setVacc_sche_idx(int vacc_sche_idx) {
		this.vacc_sche_idx = vacc_sche_idx;
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
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getExecuted() {
		return executed;
	}
	public void setExecuted(String executed) {
		this.executed = executed;
	}
	public int getVac_idx() {
		return vac_idx;
	}
	public void setVac_idx(int vac_idx) {
		this.vac_idx = vac_idx;
	}
	
}
