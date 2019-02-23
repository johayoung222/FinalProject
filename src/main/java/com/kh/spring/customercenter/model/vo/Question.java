package com.kh.spring.customercenter.model.vo;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Question {
	private int seq_question_no;
	private String question_lkinds;
	private String question_skinds;
	private String question_content;
	private int seq_member_no;
	private String question_result;
	private String question_answer;
}
