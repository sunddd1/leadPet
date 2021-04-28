package com.spring.main.dto;

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
	
	///
	private int vac_idx;
	private int pet_idx;
	private String name;
	
	
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
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
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
	private String dog_cat;
}