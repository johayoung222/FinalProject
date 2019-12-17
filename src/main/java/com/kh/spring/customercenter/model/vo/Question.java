package com.kh.spring.customercenter.model.vo;

import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Question {
	private int seq_question_no;
	private String question_lkinds;
	private String question_mkinds;
	private String question_content;
	private int seq_member_no;
	private String question_result;
	private String question_answer;
	private Date question_date;
	
	public Question() {}

	public Question(int seq_question_no, String question_lkinds, String question_mkinds, String question_content,
			int seq_member_no, String question_result, String question_answer, Date question_date) {
		super();
		this.seq_question_no = seq_question_no;
		this.question_lkinds = question_lkinds;
		this.question_mkinds = question_mkinds;
		this.question_content = question_content;
		this.seq_member_no = seq_member_no;
		this.question_result = question_result;
		this.question_answer = question_answer;
		this.question_date = question_date;
	}

	public int getSeq_question_no() {
		return seq_question_no;
	}

	public void setSeq_question_no(int seq_question_no) {
		this.seq_question_no = seq_question_no;
	}

	public String getQuestion_lkinds() {
		return question_lkinds;
	}

	public void setQuestion_lkinds(String question_lkinds) {
		this.question_lkinds = question_lkinds;
	}

	public String getQuestion_mkinds() {
		return question_mkinds;
	}

	public void setQuestion_mkinds(String question_mkinds) {
		this.question_mkinds = question_mkinds;
	}

	public String getQuestion_content() {
		return question_content;
	}

	public void setQuestion_content(String question_content) {
		this.question_content = question_content;
	}

	public int getSeq_member_no() {
		return seq_member_no;
	}

	public void setSeq_member_no(int seq_member_no) {
		this.seq_member_no = seq_member_no;
	}

	public String getQuestion_result() {
		return question_result;
	}

	public void setQuestion_result(String question_result) {
		this.question_result = question_result;
	}

	public String getQuestion_answer() {
		return question_answer;
	}

	public void setQuestion_answer(String question_answer) {
		this.question_answer = question_answer;
	}

	public Date getQuestion_date() {
		return question_date;
	}

	public void setQuestion_date(Date question_date) {
		this.question_date = question_date;
	}
	
	
	
}
