package com.spring.main.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
@Alias("noti")
public class MyNotiDTO {
	private List<NoteDTO> notiList;
	
	public MyNotiDTO(List<NoteDTO> notiList) {
		this.notiList = notiList;
	}

	public List<NoteDTO> getNotiList() {
		return notiList;
	}

	public void setNotiList(List<NoteDTO> notiList) {
		this.notiList = notiList;
	}

	public int getTotNotisize() {
		return notiList.size();
	}

	public boolean hasNotiList() {
		return notiList.size() > 0;
	}
}
