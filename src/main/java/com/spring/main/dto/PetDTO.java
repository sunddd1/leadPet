package com.spring.main.dto;

import java.util.List;

import org.apache.ibatis.type.Alias;
import org.springframework.web.multipart.MultipartFile;

@Alias("pet")
public class PetDTO {

	private int pet_idx;
	private String dog_cat;
	private String kind;
	private String bday;
	private String kg;
	private String id;
	private String delegate;
	private String pet_name;
	private String nickname;
	private MultipartFile image;
	private List<VaccinDTO> vaccList;
	private String vaccListJson;

	
	private String newFileName;


	public int getPet_idx() {
		return pet_idx;
	}


	public void setPet_idx(int pet_idx) {
		this.pet_idx = pet_idx;
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


	public String getBday() {
		return bday;
	}


	public void setBday(String bday) {
		this.bday = bday;
	}


	public String getKg() {
		return kg;
	}


	public void setKg(String kg) {
		this.kg = kg;
	}


	public String getId() {
		return id;
	}


	public void setId(String id) {
		this.id = id;
	}


	public String getDelegate() {
		return delegate;
	}


	public void setDelegate(String delegate) {
		this.delegate = delegate;
	}


	public String getPet_name() {
		return pet_name;
	}


	public void setPet_name(String pet_name) {
		this.pet_name = pet_name;
	}


	public String getNickname() {
		return nickname;
	}


	public void setNickname(String nickname) {
		this.nickname = nickname;
	}


	public MultipartFile getImage() {
		return image;
	}


	public void setImage(MultipartFile image) {
		this.image = image;
	}


	public List<VaccinDTO> getVaccList() {
		return vaccList;
	}


	public void setVaccList(List<VaccinDTO> vaccList) {
		this.vaccList = vaccList;
	}


	public String getVaccListJson() {
		return vaccListJson;
	}


	public void setVaccListJson(String vaccListJson) {
		this.vaccListJson = vaccListJson;
	}


	public String getNewFileName() {
		return newFileName;
	}


	public void setNewFileName(String newFileName) {
		this.newFileName = newFileName;
	}
	
}
