package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("vaccin")
public class VaccinDTO {
//	VACC_IDX  NOT NULL NUMBER(5)      
//	VACC_NAME          NVARCHAR2(30)  
//	CONTENT            NVARCHAR2(500) 
//	CYCLE              NUMBER(5)      
//	VACC_CNT           NUMBER(5)      
//	DOG_CAT            NVARCHAR2(10)  
	
	private int vacc_idx;
	private String vacc_name;
	private String content;
	private int cycle;
	private int vacc_cnt;
	private String dog_cat;
	private String type;
	
	///checked
	private int vac_idx;
	private int pet_idx;
	private String vacc_date;
	private String pet_name;
	private Date expected_date;
	private String executed;
	private String checked;
	private String added;
	private Date d_day;
	

	
	public String getVacc_date() {
		return vacc_date;
	}
	public void setVacc_date(String vacc_date) {
		this.vacc_date = vacc_date;
	}
	public Date getD_day() {
		return d_day;
	}
	public void setD_day(Date d_day) {
		this.d_day = d_day;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	public String getAdded() {
		return added;
	}
	public void setAdded(String added) {
		this.added = added;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public String getExecuted() {
		return executed;
	}
	public void setExecuted(String executed) {
		this.executed = executed;
	}
	public Date getExpected_date() {
		return expected_date;
	}
	public void setExpected_date(Date expected_date) {
		this.expected_date = expected_date;
	}
	public int getVac_idx() {
		return vac_idx;
	}
	public void setVac_idx(int vac_idx) {
		this.vac_idx = vac_idx;
	}
	public int getPet_idx() {
		return pet_idx;
	}
	public void setPet_idx(int pet_idx) {
		this.pet_idx = pet_idx;
	}

	public int getVacc_idx() {
		return vacc_idx;
	}
	public void setVacc_idx(int vacc_idx) {
		this.vacc_idx = vacc_idx;
	}
	public String getVacc_name() {
		return vacc_name;
	}
	public void setVacc_name(String vacc_name) {
		this.vacc_name = vacc_name;
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
	public int getVacc_cnt() {
		return vacc_cnt;
	}
	public void setVacc_cnt(int vacc_cnt) {
		this.vacc_cnt = vacc_cnt;
	}
	public String getDog_cat() {
		return dog_cat;
	}
	public void setDog_cat(String dog_cat) {
		this.dog_cat = dog_cat;
	}
}
