package com.kh.spring.basket.model.vo;

import java.io.Serializable;
import java.util.List;



public class Basket implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	private int seqBasketNo;
	private int seqProductNo;
	private int seqMemberNo;
	
	

	public Basket() {}



	public Basket(int seqBasketNo, int seqProductNo, int seqMemberNo) {
		super();
		this.seqBasketNo = seqBasketNo;
		this.seqProductNo = seqProductNo;
		this.seqMemberNo = seqMemberNo;
	}



	public int getSeqBasketNo() {
		return seqBasketNo;
	}



	public void setSeqBasketNo(int seqBasketNo) {
		this.seqBasketNo = seqBasketNo;
	}



	public int getSeqProductNo() {
		return seqProductNo;
	}



	public void setSeqProductNo(int seqProductNo) {
		this.seqProductNo = seqProductNo;
	}



	public int getSeqMemberNo() {
		return seqMemberNo;
	}



	public void setSeqMemberNo(int seqMemberNo) {
		this.seqMemberNo = seqMemberNo;
	}



	@Override
	public String toString() {
		return "Basket [seqBasketNo=" + seqBasketNo + ", seqProductNo=" + seqProductNo + ", seqMemberNo=" + seqMemberNo
				+ "]";
	}

   
	
	
	
}
