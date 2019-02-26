package com.kh.spring.basket.model.vo;

import java.io.Serializable;
import java.util.List;



public class Basket implements Serializable {

	private int basketNo;
	private int productNo;
	private int memberNo;
	private String productName;
	private int productPrice;
	private int amount;
	
	
	
	
	public Basket(int basketNo, int productNo, int memberNo, String productName, int productPrice, int amount) {
		super();
		this.basketNo = basketNo;
		this.productNo = productNo;
		this.memberNo = memberNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.amount = amount;
	}




	public Basket() {}




	public int getBasketNo() {
		return basketNo;
	}




	public void setBasketNo(int basketNo) {
		this.basketNo = basketNo;
	}




	public int getProductNo() {
		return productNo;
	}




	public void setProductNo(int productNo) {
		this.productNo = productNo;
	}




	public int getMemberNo() {
		return memberNo;
	}




	public void setMemberNo(int memberNo) {
		this.memberNo = memberNo;
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




	public int getAmount() {
		return amount;
	}




	public void setAmount(int amount) {
		this.amount = amount;
	}




	@Override
	public String toString() {
		return "Basket [basketNo=" + basketNo + ", productNo=" + productNo + ", memberNo=" + memberNo + ", productName="
				+ productName + ", productPrice=" + productPrice + ", amount=" + amount + "]";
	}
	
	
}
