package com.kh.spring.thing.model.vo;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@NoArgsConstructor
@AllArgsConstructor
@ToString
public class ProductAsk {

	private int seqAskNo;
	private String askContent;
	private String askAnswer;
	private Date askDate;
	private int askUser;
	private int seqProductNo;
	
	public ProductAsk() {}

	public ProductAsk(int seqAskNo, String askContent, String askAnswer, Date askDate, int askUser, int seqProductNo) {
		super();
		this.seqAskNo = seqAskNo;
		this.askContent = askContent;
		this.askAnswer = askAnswer;
		this.askDate = askDate;
		this.askUser = askUser;
		this.seqProductNo = seqProductNo;
	}

	public int getSeqAskNo() {
		return seqAskNo;
	}

	public void setSeqAskNo(int seqAskNo) {
		this.seqAskNo = seqAskNo;
	}

	public String getAskContent() {
		return askContent;
	}

	public void setAskContent(String askContent) {
		this.askContent = askContent;
	}

	public String getAskAnswer() {
		return askAnswer;
	}

	public void setAskAnswer(String askAnswer) {
		this.askAnswer = askAnswer;
	}

	public Date getAskDate() {
		return askDate;
	}

	public void setAskDate(Date askDate) {
		this.askDate = askDate;
	}

	public int getAskUser() {
		return askUser;
	}

	public void setAskUser(int askUser) {
		this.askUser = askUser;
	}

	public int getSeqProductNo() {
		return seqProductNo;
	}

	public void setSeqProductNo(int seqProductNo) {
		this.seqProductNo = seqProductNo;
	}
	
	
}
