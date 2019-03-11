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
public class Product {
	
	private int seqProductNo;
	private String productName;
	private int productPrice;
	private String productAuction;
	private String productOnsale;
	private String productManufacturer;
	private int productStock;
	private String productImage;
	private String productRealImage;
	private int productMilege;
	private String productDescription;
	private String productEvent;
	private Date productEnrollDate;
	private String productRecommend;
	private String productKinds;
	private String categoryMicro;
	private String categoryMacro;
	private int sellerNo;
	private int seqAuctionNo;
	private int seqAskNo;
	private String productAdminDescription;
	private int buyerNo;
	
}
