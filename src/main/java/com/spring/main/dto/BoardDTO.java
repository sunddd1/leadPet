package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;
@Alias("board")
public class BoardDTO {
	private int bbs_idx;
	private String bbs_subject;
	private String bbs_content;
	private Date reg_date;
	private String mod_del;
	private String bbs_blind;
	private String type;
	private int reco_count;
	private int views;
	private String type_name;
	private String nickname;
	private int pet_idx;
	private String category_name;
	private String oriFileName;
	private String newFileName;
	private String dog_cat;
	private String kind;
	private Date bday;
	private String name;
	private String pet_name;
	private int kg;
	private String pet_newfilename;
	
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getBbs_subject() {
		return bbs_subject;
	}
	public void setBbs_subject(String bbs_subject) {
		this.bbs_subject = bbs_subject;
	}
	public String getBbs_content() {
		return bbs_content;
	}
	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getMod_del() {
		return mod_del;
	}
	public void setMod_del(String mod_del) {
		this.mod_del = mod_del;
	}
	public String getBbs_blind() {
		return bbs_blind;
	}
	public void setBbs_blind(String bbs_blind) {
		this.bbs_blind = bbs_blind;
	}
	public int getReco_count() {
		return reco_count;
	}
	public void setReco_count(int reco_count) {
		this.reco_count = reco_count;
	}
	public int getViews() {
		return views;
	}
	public void setViews(int views) {
		this.views = views;
	}
	public String getType_name() {
		return type_name;
	}
	public void setType_name(String type_name) {
		this.type_name = type_name;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public int getPet_idx() {
		return pet_idx;
	}
	public void setPet_idx(int pet_idx) {
		this.pet_idx = pet_idx;
	}
	public String getCategory_name() {
		return category_name;
	}
	public void setCategory_name(String category_name) {
		this.category_name = category_name;
	}
	public String getOriFileName() {
		return oriFileName;
	}
	public void setOriFileName(String oriFileName) {
		this.oriFileName = oriFileName;
	}
	public String getNewFileName() {
		return newFileName;
	}
	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	public String getDog_cat() {
		return dog_cat;
	}
	public void setDog_cat(String dog_cat) {
		this.dog_cat = dog_cat;
	}
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}
	public Date getBday() {
		return bday;
	}
	public void setBday(Date bday) {
		this.bday = bday;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getKg() {
		return kg;
	}
	public void setKg(int kg) {
		this.kg = kg;
	}
	public String getPet_name() {
		return pet_name;
	}
	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}
	public String getPet_newfilename() {
		return pet_newfilename;
	}
	public void setPet_newfilename(String pet_newfilename) {
		this.pet_newfilename = pet_newfilename;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}
	
}
