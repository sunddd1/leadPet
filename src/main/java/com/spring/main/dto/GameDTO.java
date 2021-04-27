package com.spring.main.dto;

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
}
