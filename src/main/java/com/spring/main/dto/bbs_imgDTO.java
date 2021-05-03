package com.spring.main.dto;

import org.apache.ibatis.type.Alias;

@Alias("board_img")
public class bbs_imgDTO {
	private int bbs_idx;
	private String orifilename;
	private String newfilename;
	public int getBbs_idx() {
		return bbs_idx;
	}
	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}
	public String getOrifilename() {
		return orifilename;
	}
	public void setOrifilename(String orifilename) {
		this.orifilename = orifilename;
	}
	public String getNewfilename() {
		return newfilename;
	}
	public void setNewfilename(String newfilename) {
		this.newfilename = newfilename;
	}
	
}
