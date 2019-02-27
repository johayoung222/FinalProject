package com.kh.spring.basket.model.vo;

import java.io.Serializable;
import java.util.List;



public class Basket implements Serializable {

	private int seqBasketNo;
	private int seqProductNo;
	private int seqMemberNo;
	private String productName;
	private int productPrice;
	private int productAmount;
	

	public Basket() {}


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


	public String getProductName() {
		return productName;
	}


	public void setProductName(String productName) {
		this.productName = productName;
	}


	public int getProductPrice() {
		return productPrice;
	}


	public void setProductPrice(int productPrice) {
		this.productPrice = productPrice;
	}


	public int getProductAmount() {
		return productAmount;
	}


	public void setProductAmount(int productAmount) {
		this.productAmount = productAmount;
	}


	@Override
	public String toString() {
		return "Basket [seqBasketNo=" + seqBasketNo + ", seqProductNo=" + seqProductNo + ", seqMemberNo=" + seqMemberNo
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", productAmount=" + productAmount
				+ "]";
	}
	
	
	
}
