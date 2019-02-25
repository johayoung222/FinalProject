package com.kh.spring.thing.model.vo;

import java.sql.Date;

public class Regist {
	private int seqRegistNo;
	private String registName;
	private int registPrice;
	private boolean regitstAuction;
	private String registImage="";
	private String registRealImage="";
	private int registAmount;
	private String registDescription;
	private Date registDate;
	public Regist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Regist(int seqRegistNo, String registName, int registPrice, boolean regitstAuction, String registImage,
			String registRealImage, int registAmount, String registDescription, Date registDate) {
		super();
		this.seqRegistNo = seqRegistNo;
		this.registName = registName;
		this.registPrice = registPrice;
		this.regitstAuction = regitstAuction;
		this.registImage = registImage;
		this.registRealImage = registRealImage;
		this.registAmount = registAmount;
		this.registDescription = registDescription;
		this.registDate = registDate;
	}
	public int getSeqRegistNo() {
		return seqRegistNo;
	}
	public void setSeqRegistNo(int seqRegistNo) {
		this.seqRegistNo = seqRegistNo;
	}
	public String getRegistName() {
		return registName;
	}
	public void setRegistName(String registName) {
		this.registName = registName;
	}
	public int getRegistPrice() {
		return registPrice;
	}
	public void setRegistPrice(int registPrice) {
		this.registPrice = registPrice;
	}
	public boolean isRegitstAuction() {
		return regitstAuction;
	}
	public void setRegitstAuction(boolean regitstAuction) {
		this.regitstAuction = regitstAuction;
	}
	public String getRegistImage() {
		return registImage;
	}
	public void setRegistImage(String registImage) {
		this.registImage = registImage;
	}
	public String getRegistRealImage() {
		return registRealImage;
	}
	public void setRegistRealImage(String registRealImage) {
		this.registRealImage = registRealImage;
	}
	public int getRegistAmount() {
		return registAmount;
	}
	public void setRegistAmount(int registAmount) {
		this.registAmount = registAmount;
	}
	public String getRegistDescription() {
		return registDescription;
	}
	public void setRegistDescription(String registDescription) {
		this.registDescription = registDescription;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	@Override
	public String toString() {
		return "[seqRegistNo=" + seqRegistNo + ", registName=" + registName + ", registPrice=" + registPrice
				+ ", regitstAuction=" + regitstAuction + ", registImage=" + registImage + ", registRealImage="
				+ registRealImage + ", registAmount=" + registAmount + ", registDescription=" + registDescription
				+ ", registDate=" + registDate + "]";
	}
	
	
	
	
	
	
	
	
}
