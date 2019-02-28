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
	private String lctg;		// 대분류
	private String mctg;		// 소분류
	private Date sdate;			// 등록 시작 날짜
	private Date edate;			// 등록 끝 날짜
	private String auctionTitle;// 상품명
	private String auctionImageMain;	// 메인 이미지
	private String auctionImageSub1;	// 서브 이미지1
	private String auctionImageSub2;	// 서브 이미지2
	private String auctionImageSub3;	// 서브 이미지3
	private int auctionPrice;	// 상품 가격
	private int auctionStatus;	// 배송 방법
	private String auctionMember;		// 판매자
	private String auctionPhone;		// 판매자 연락처
	private String auctiondetail;		// 상세정보
	

}
