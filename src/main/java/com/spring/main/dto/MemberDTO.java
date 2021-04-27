package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("member")
public class MemberDTO {
//	`id`	NVARCHAR2(50)	NOT NULL,
//	`password`	NVARCHAR2(60)	NULL,
//	`name`	NVARCHAR2(50)	NULL,
//	`age`	NUMBER(3,0)	NULL,
//	`gender`	NVARCHAR2(10)	NULL,
//	`email`	NVARCHAR2(100)	NULL,
//	`reg_date`	DATE	NULL	DEFAULT SYSDATE,
//	`withdraw`	NVARCHAR2(10)	NULL	DEFAULT N,
//	`black`	NVARCHAR2(10)	NULL	DEFAULT N,
//	`change_date`	DATE	NULL	DEFAULT SYSDATE,
//	`point`	NUMBER(5,0)	NULL	DEFAULT 0,
//	`nickname`	NVARCHAR2(50)	NULL,
//	`grade`	NVARCHAR2(50)	NULL	DEFAULT 브론즈
	
	private String id;
	private String password;
	private String name;
	private int age;
	private String gender;
	private String email;
	private Date reg_date;
	private String withdraw;
	private String black;
	private Date change_date;
	private int point;
	private String nickname;
	private String grade;
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getAge() {
		return age;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public Date getReg_date() {
		return reg_date;
	}
	public void setReg_date(Date reg_date) {
		this.reg_date = reg_date;
	}
	public String getWithdraw() {
		return withdraw;
	}
	public void setWithdraw(String withdraw) {
		this.withdraw = withdraw;
	}
	public String getBlack() {
		return black;
	}
	public void setBlack(String black) {
		this.black = black;
	}
	public Date getChange_date() {
		return change_date;
	}
	public void setChange_date(Date change_date) {
		this.change_date = change_date;
	}
	public int getPoint() {
		return point;
	}
	public void setPoint(int point) {
		this.point = point;
	}
	public String getNickname() {
		return nickname;
	}
	public void setNickname(String nickname) {
		this.nickname = nickname;
	}
	public String getGrade() {
		return grade;
	}
	public void setGrade(String grade) {
		this.grade = grade;
	}
}
