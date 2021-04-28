package com.spring.main.dto;

import java.sql.Date;

import org.apache.ibatis.type.Alias;

@Alias("game")
public class GameDTO {
		//quiz Table
		private int quiz_idx;
		private String quiz_question;
		private String ex1;
		private String ex2;
		private String ex3;
		private String ex4;
		private String quiz_answer;
		
		//nemo Table
		private int nemo_idx;
		private String nemo_subject;
		private String nemo_question;
		private String nemo_hint;
		private String nemo_answer;
		
		//weekly Quiz Table
		private int week_quiz_idx;
		private String quiz_first;
		private String quiz_second;
		private String quiz_third;
		private String fourth;
		private String fifth;
		private String sixth;
		private String seventh;
		private String eighth;
		private String ninth;
		private String tenth;
		private Date quiz_update_date;
		
		//weekly Nemo Table
		private int week_nemo_idx;
		/*private int nemo_idx; //위에서 선언*/
		private Date nemo_update_date;
		
		public int getQuiz_idx() {
			return quiz_idx;
		}
		public void setQuiz_idx(int quiz_idx) {
			this.quiz_idx = quiz_idx;
		}
		public String getQuiz_question() {
			return quiz_question;
		}
		public void setQuiz_question(String quiz_question) {
			this.quiz_question = quiz_question;
		}
		public String getEx1() {
			return ex1;
		}
		public void setEx1(String ex1) {
			this.ex1 = ex1;
		}
		public String getEx2() {
			return ex2;
		}
		public void setEx2(String ex2) {
			this.ex2 = ex2;
		}
		public String getEx3() {
			return ex3;
		}
		public void setEx3(String ex3) {
			this.ex3 = ex3;
		}
		public String getEx4() {
			return ex4;
		}
		public void setEx4(String ex4) {
			this.ex4 = ex4;
		}
		public String getQuiz_answer() {
			return quiz_answer;
		}
		public void setQuiz_answer(String quiz_answer) {
			this.quiz_answer = quiz_answer;
		}
		public int getNemo_idx() {
			return nemo_idx;
		}
		public void setNemo_idx(int nemo_idx) {
			this.nemo_idx = nemo_idx;
		}
		public String getNemo_subject() {
			return nemo_subject;
		}
		public void setNemo_subject(String nemo_subject) {
			this.nemo_subject = nemo_subject;
		}
		public String getNemo_question() {
			return nemo_question;
		}
		public void setNemo_question(String nemo_question) {
			this.nemo_question = nemo_question;
		}
		public String getNemo_hint() {
			return nemo_hint;
		}
		public void setNemo_hint(String nemo_hint) {
			this.nemo_hint = nemo_hint;
		}
		public String getNemo_answer() {
			return nemo_answer;
		}
		public void setNemo_answer(String nemo_answer) {
			this.nemo_answer = nemo_answer;
		}
		public int getWeek_quiz_idx() {
			return week_quiz_idx;
		}
		public void setWeek_quiz_idx(int week_quiz_idx) {
			this.week_quiz_idx = week_quiz_idx;
		}
		public String getQuiz_first() {
			return quiz_first;
		}
		public void setQuiz_first(String quiz_first) {
			this.quiz_first = quiz_first;
		}
		public String getQuiz_second() {
			return quiz_second;
		}
		public void setQuiz_second(String quiz_second) {
			this.quiz_second = quiz_second;
		}
		public String getQuiz_third() {
			return quiz_third;
		}
		public void setQuiz_third(String quiz_third) {
			this.quiz_third = quiz_third;
		}
		public String getFourth() {
			return fourth;
		}
		public void setFourth(String fourth) {
			this.fourth = fourth;
		}
		public String getFifth() {
			return fifth;
		}
		public void setFifth(String fifth) {
			this.fifth = fifth;
		}
		public String getSixth() {
			return sixth;
		}
		public void setSixth(String sixth) {
			this.sixth = sixth;
		}
		public String getSeventh() {
			return seventh;
		}
		public void setSeventh(String seventh) {
			this.seventh = seventh;
		}
		public String getEighth() {
			return eighth;
		}
		public void setEighth(String eighth) {
			this.eighth = eighth;
		}
		public String getNinth() {
			return ninth;
		}
		public void setNinth(String ninth) {
			this.ninth = ninth;
		}
		public String getTenth() {
			return tenth;
		}
		public void setTenth(String tenth) {
			this.tenth = tenth;
		}
		public Date getQuiz_update_date() {
			return quiz_update_date;
		}
		public void setUpdate_date(Date update_date) {
			this.quiz_update_date = update_date;
		}
		public int getWeek_nemo_idx() {
			return week_nemo_idx;
		}
		public void setWeek_nemo_idx(int week_nemo_idx) {
			this.week_nemo_idx = week_nemo_idx;
		}
		public Date getNemo_update_date() {
			return nemo_update_date;
		}
		public void setNemo_update_date(Date nemo_update_date) {
			this.nemo_update_date = nemo_update_date;
		}
		
}
