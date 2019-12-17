package com.kh.spring.auction.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;
import lombok.ToString;
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
@ToString
public class Auction implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int seqMemberNo;	// 로그인한 회원 번호 시퀀스
	private String dateRange;
	/* view에서 등록기간을 범위로 입력받아 sdate, edate에 저장함 */
	private String sdate;			// 등록 시작 날짜
	private String edate;			// 등록 끝 날짜
	private String auctionTitle;// 상품명
	private String auctionImageMain;	// 메인 이미지
	private String auctionImageSub1;	// 서브 이미지1
	private String auctionImageSub2;	// 서브 이미지2
	private String auctionImageSub3;	// 서브 이미지3
	private int auctionPrice;	// 상품 가격
	private int auctionStatus;	// 배송 방법
	private String auctionMember;		// 판매자id
	private String auctionPhone;		// 판매자 연락처
	private String auctiondetail;		// 상세정보
	private String auctionCheck;
	private String categoryMacro;
	private String categoryMicro;
	
	public Auction() {}
	
	public String getCategoryMacro() {
		return categoryMacro;
	}

	public void setCategoryMacro(String categoryMacro) {
		this.categoryMacro = categoryMacro;
	}

	public String getCategoryMicro() {
		return categoryMicro;
	}

	public void setCategoryMicro(String categoryMicro) {
		this.categoryMicro = categoryMicro;
	}

	public Auction(int seqMemberNo, String dateRange, String sdate, String edate, String auctionTitle,
			String auctionImageMain, String auctionImageSub1, String auctionImageSub2, String auctionImageSub3,
			int auctionPrice, int auctionStatus, String auctionMember, String auctionPhone, String auctiondetail,
			String auctionCheck,String categoryMacro,String categoryMicro) {
		super();
		this.seqMemberNo = seqMemberNo;
		this.dateRange = dateRange;
		this.sdate = sdate;
		this.edate = edate;
		this.auctionTitle = auctionTitle;
		this.auctionImageMain = auctionImageMain;
		this.auctionImageSub1 = auctionImageSub1;
		this.auctionImageSub2 = auctionImageSub2;
		this.auctionImageSub3 = auctionImageSub3;
		this.auctionPrice = auctionPrice;
		this.auctionStatus = auctionStatus;
		this.auctionMember = auctionMember;
		this.auctionPhone = auctionPhone;
		this.auctiondetail = auctiondetail;
		this.auctionCheck = auctionCheck;
		this.categoryMacro=categoryMacro;
		this.categoryMicro=categoryMicro;
	}

	public int getSeqMemberNo() {
		return seqMemberNo;
	}

	public void setSeqMemberNo(int seqMemberNo) {
		this.seqMemberNo = seqMemberNo;
	}

	public String getDateRange() {
		return dateRange;
	}

	public void setDateRange(String dateRange) {
		this.dateRange = dateRange;
	}

	public String getSdate() {
		return sdate;
	}

	public void setSdate(String sdate) {
		this.sdate = sdate;
	}

	public String getEdate() {
		return edate;
	}

	public void setEdate(String edate) {
		this.edate = edate;
	}

	public String getAuctionTitle() {
		return auctionTitle;
	}

	public void setAuctionTitle(String auctionTitle) {
		this.auctionTitle = auctionTitle;
	}

	public String getAuctionImageMain() {
		return auctionImageMain;
	}

	public void setAuctionImageMain(String auctionImageMain) {
		this.auctionImageMain = auctionImageMain;
	}

	public String getAuctionImageSub1() {
		return auctionImageSub1;
	}

	public void setAuctionImageSub1(String auctionImageSub1) {
		this.auctionImageSub1 = auctionImageSub1;
	}

	public String getAuctionImageSub2() {
		return auctionImageSub2;
	}

	public void setAuctionImageSub2(String auctionImageSub2) {
		this.auctionImageSub2 = auctionImageSub2;
	}

	public String getAuctionImageSub3() {
		return auctionImageSub3;
	}

	public void setAuctionImageSub3(String auctionImageSub3) {
		this.auctionImageSub3 = auctionImageSub3;
	}

	public int getAuctionPrice() {
		return auctionPrice;
	}

	public void setAuctionPrice(int auctionPrice) {
		this.auctionPrice = auctionPrice;
	}

	public int getAuctionStatus() {
		return auctionStatus;
	}

	public void setAuctionStatus(int auctionStatus) {
		this.auctionStatus = auctionStatus;
	}

	public String getAuctionMember() {
		return auctionMember;
	}

	public void setAuctionMember(String auctionMember) {
		this.auctionMember = auctionMember;
	}

	public String getAuctionPhone() {
		return auctionPhone;
	}

	public void setAuctionPhone(String auctionPhone) {
		this.auctionPhone = auctionPhone;
	}

	public String getAuctiondetail() {
		return auctiondetail;
	}

	public void setAuctiondetail(String auctiondetail) {
		this.auctiondetail = auctiondetail;
	}

	public String getAuctionCheck() {
		return auctionCheck;
	}

	public void setAuctionCheck(String auctionCheck) {
		this.auctionCheck = auctionCheck;
	}
	
	
	
}
