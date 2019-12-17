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
	
	public Product() {}

	public Product(int seqProductNo, String productName, int productPrice, String productAuction, String productOnsale,
			String productManufacturer, int productStock, String productImage, String productRealImage,
			int productMilege, String productDescription, String productEvent, Date productEnrollDate,
			String productRecommend, String productKinds, String categoryMicro, String categoryMacro, int sellerNo,
			int seqAuctionNo, int seqAskNo, String productAdminDescription, int buyerNo) {
		super();
		this.seqProductNo = seqProductNo;
		this.productName = productName;
		this.productPrice = productPrice;
		this.productAuction = productAuction;
		this.productOnsale = productOnsale;
		this.productManufacturer = productManufacturer;
		this.productStock = productStock;
		this.productImage = productImage;
		this.productRealImage = productRealImage;
		this.productMilege = productMilege;
		this.productDescription = productDescription;
		this.productEvent = productEvent;
		this.productEnrollDate = productEnrollDate;
		this.productRecommend = productRecommend;
		this.productKinds = productKinds;
		this.categoryMicro = categoryMicro;
		this.categoryMacro = categoryMacro;
		this.sellerNo = sellerNo;
		this.seqAuctionNo = seqAuctionNo;
		this.seqAskNo = seqAskNo;
		this.productAdminDescription = productAdminDescription;
		this.buyerNo = buyerNo;
	}

	public int getSeqProductNo() {
		return seqProductNo;
	}

	public void setSeqProductNo(int seqProductNo) {
		this.seqProductNo = seqProductNo;
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

	public String getProductAuction() {
		return productAuction;
	}

	public void setProductAuction(String productAuction) {
		this.productAuction = productAuction;
	}

	public String getProductOnsale() {
		return productOnsale;
	}

	public void setProductOnsale(String productOnsale) {
		this.productOnsale = productOnsale;
	}

	public String getProductManufacturer() {
		return productManufacturer;
	}

	public void setProductManufacturer(String productManufacturer) {
		this.productManufacturer = productManufacturer;
	}

	public int getProductStock() {
		return productStock;
	}

	public void setProductStock(int productStock) {
		this.productStock = productStock;
	}

	public String getProductImage() {
		return productImage;
	}

	public void setProductImage(String productImage) {
		this.productImage = productImage;
	}

	public String getProductRealImage() {
		return productRealImage;
	}

	public void setProductRealImage(String productRealImage) {
		this.productRealImage = productRealImage;
	}

	public int getProductMilege() {
		return productMilege;
	}

	public void setProductMilege(int productMilege) {
		this.productMilege = productMilege;
	}

	public String getProductDescription() {
		return productDescription;
	}

	public void setProductDescription(String productDescription) {
		this.productDescription = productDescription;
	}

	public String getProductEvent() {
		return productEvent;
	}

	public void setProductEvent(String productEvent) {
		this.productEvent = productEvent;
	}

	public Date getProductEnrollDate() {
		return productEnrollDate;
	}

	public void setProductEnrollDate(Date productEnrollDate) {
		this.productEnrollDate = productEnrollDate;
	}

	public String getProductRecommend() {
		return productRecommend;
	}

	public void setProductRecommend(String productRecommend) {
		this.productRecommend = productRecommend;
	}

	public String getProductKinds() {
		return productKinds;
	}

	public void setProductKinds(String productKinds) {
		this.productKinds = productKinds;
	}

	public String getCategoryMicro() {
		return categoryMicro;
	}

	public void setCategoryMicro(String categoryMicro) {
		this.categoryMicro = categoryMicro;
	}

	public String getCategoryMacro() {
		return categoryMacro;
	}

	public void setCategoryMacro(String categoryMacro) {
		this.categoryMacro = categoryMacro;
	}

	public int getSellerNo() {
		return sellerNo;
	}

	public void setSellerNo(int sellerNo) {
		this.sellerNo = sellerNo;
	}

	public int getSeqAuctionNo() {
		return seqAuctionNo;
	}

	public void setSeqAuctionNo(int seqAuctionNo) {
		this.seqAuctionNo = seqAuctionNo;
	}

	public int getSeqAskNo() {
		return seqAskNo;
	}

	public void setSeqAskNo(int seqAskNo) {
		this.seqAskNo = seqAskNo;
	}

	public String getProductAdminDescription() {
		return productAdminDescription;
	}

	public void setProductAdminDescription(String productAdminDescription) {
		this.productAdminDescription = productAdminDescription;
	}

	public int getBuyerNo() {
		return buyerNo;
	}

	public void setBuyerNo(int buyerNo) {
		this.buyerNo = buyerNo;
	}
	
	
	
}
