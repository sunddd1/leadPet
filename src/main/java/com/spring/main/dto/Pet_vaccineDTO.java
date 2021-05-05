package com.spring.main.dto;

import org.apache.ibatis.type.Alias;

import oracle.sql.DATE;

@Alias("vaccin_pet")
public class Pet_vaccineDTO {
	private int vac_idx;
	private String vacc_date;
	private DATE expected_date;
	private String checked;
	private int vacc_cnt;
	private int vacc_idx;
	private int pet_idx;
	private String added;
	
	public int getVac_idx() {
		return vac_idx;
	}
	public void setVac_idx(int vac_idx) {
		this.vac_idx = vac_idx;
	}
	public String getVacc_date() {
		return vacc_date;
	}
	public void setVacc_date(String string) {
		this.vacc_date = string;
	}
	public DATE getExpected_date() {
		return expected_date;
	}
	public void setExpected_date(DATE expected_date) {
		this.expected_date = expected_date;
	}
	public String getChecked() {
		return checked;
	}
	public void setChecked(String checked) {
		this.checked = checked;
	}
	public int getVacc_cnt() {
		return vacc_cnt;
	}
	public void setVacc_cnt(int vacc_cnt) {
		this.vacc_cnt = vacc_cnt;
	}
	public int getVacc_idx() {
		return vacc_idx;
	}
	public void setVacc_idx(int vacc_idx) {
		this.vacc_idx = vacc_idx;
	}
	public int getPet_idx() {
		return pet_idx;
	}
	public void setPet_idx(int pet_idx) {
		this.pet_idx = pet_idx;
	}
	public String getAdded() {
		return added;
	}
	public void setAdded(String added) {
		this.added = added;
	}
}
