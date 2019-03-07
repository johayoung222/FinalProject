package com.kh.spring.thing.model.vo;

import java.sql.Date;

public class Regist {
	private int seqMemberNo;
	private int seqRegistNo;
	private String registName;
	private int registPrice;
	private String registAuction;
	private String registImage="";
	private String registRealImage="";
	private int registAmount;
	private String registDescription;
	private String registKinds;
	private Date registDate;
	private String registStatus;
	
	public String getRegistStatus() {
		return registStatus;
	}
	public void setRegistStatus(String registStatus) {
		this.registStatus = registStatus;
	}
	public Regist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Regist(int seqMemberNo, int seqRegistNo, String registName, int registPrice, String registAuction,
			String registImage, String registRealImage, int registAmount, String registDescription, String registKinds,
			Date registDate, String registStatus) {
		super();
		this.seqMemberNo = seqMemberNo;
		this.seqRegistNo = seqRegistNo;
		this.registName = registName;
		this.registPrice = registPrice;
		this.registAuction = registAuction;
		this.registImage = registImage;
		this.registRealImage = registRealImage;
		this.registAmount = registAmount;
		this.registDescription = registDescription;
		this.registKinds = registKinds;
		this.registDate = registDate;
		this.registStatus =registStatus;
	}
	public int getSeqMemberNo() {
		return seqMemberNo;
	}
	public void setSeqMemberNo(int seqMemberNo) {
		this.seqMemberNo = seqMemberNo;
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
	public String getRegistAuction() {
		return registAuction;
	}
	public void setRegistAuction(String registAuction) {
		this.registAuction = registAuction;
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
	public String getRegistKinds() {
		return registKinds;
	}
	public void setRegistKinds(String registKinds) {
		this.registKinds = registKinds;
	}
	public Date getRegistDate() {
		return registDate;
	}
	public void setRegistDate(Date registDate) {
		this.registDate = registDate;
	}
	@Override
	public String toString() {
		return "[seqMemberNo=" + seqMemberNo + ", seqRegistNo=" + seqRegistNo + ", registName=" + registName
				+ ", registPrice=" + registPrice + ", registAuction=" + registAuction + ", registImage=" + registImage
				+ ", registRealImage=" + registRealImage + ", registAmount=" + registAmount + ", registDescription="
				+ registDescription + ", registKinds=" + registKinds + ", registDate=" + registDate +", registStatus"+registStatus+ "]";
	}
	
	
	
	
	
	
	
	
}
