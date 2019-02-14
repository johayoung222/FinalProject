package com.kh.spring.thing.model.vo;

import java.sql.Date;

public class Product {
	private String name;
	private int price;
	private boolean auction;
	private boolean onsale;
	private String manufacturer;
	private int stock;
	private String image;
	private String real_image;
	private int milege;
	private String description;
	private boolean event;
	private Date enrollDate;
	private boolean recommend;
	private boolean kinds;
	private String categoryMicro;
	private String categoryMacro;
	private int sellerNo;
	private int auctionNo;
	public Product() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Product(String name, int price, boolean auction, boolean onsale, String manufacturer, int stock,
			String image, String real_image, int milege, String description, boolean event, Date enrollDate,
			boolean recommend, boolean kinds, String categoryMicro, String categoryMacro, int sellerNo, int auctionNo) {
		super();
		this.name = name;
		this.price = price;
		this.auction = auction;
		this.onsale = onsale;
		this.manufacturer = manufacturer;
		this.stock = stock;
		this.image = image;
		this.real_image = real_image;
		this.milege = milege;
		this.description = description;
		this.event = event;
		this.enrollDate = enrollDate;
		this.recommend = recommend;
		this.kinds = kinds;
		this.categoryMicro = categoryMicro;
		this.categoryMacro = categoryMacro;
		this.sellerNo = sellerNo;
		this.auctionNo = auctionNo;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public boolean isAuction() {
		return auction;
	}
	public void setAuction(boolean auction) {
		this.auction = auction;
	}
	public boolean isOnsale() {
		return onsale;
	}
	public void setOnsale(boolean onsale) {
		this.onsale = onsale;
	}
	public String getManufacturer() {
		return manufacturer;
	}
	public void setManufacturer(String manufacturer) {
		this.manufacturer = manufacturer;
	}
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getReal_image() {
		return real_image;
	}
	public void setReal_image(String real_image) {
		this.real_image = real_image;
	}
	public int getMilege() {
		return milege;
	}
	public void setMilege(int milege) {
		this.milege = milege;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public boolean isEvent() {
		return event;
	}
	public void setEvent(boolean event) {
		this.event = event;
	}
	public Date getEnrollDate() {
		return enrollDate;
	}
	public void setEnrollDate(Date enrollDate) {
		this.enrollDate = enrollDate;
	}
	public boolean isRecommend() {
		return recommend;
	}
	public void setRecommend(boolean recommend) {
		this.recommend = recommend;
	}
	public boolean isKinds() {
		return kinds;
	}
	public void setKinds(boolean kinds) {
		this.kinds = kinds;
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
	public int getAuctionNo() {
		return auctionNo;
	}
	public void setAuctionNo(int auctionNo) {
		this.auctionNo = auctionNo;
	}
	@Override
	public String toString() {
		return "[name=" + name + ", price=" + price + ", auction=" + auction + ", onsale=" + onsale
				+ ", manufacturer=" + manufacturer + ", stock=" + stock + ", image=" + image + ", real_image="
				+ real_image + ", milege=" + milege + ", description=" + description + ", event=" + event
				+ ", enrollDate=" + enrollDate + ", recommend=" + recommend + ", kinds=" + kinds + ", categoryMicro="
				+ categoryMicro + ", categoryMacro=" + categoryMacro + ", sellerNo=" + sellerNo + ", auctionNo="
				+ auctionNo + "]";
	}
	
	
	
	
	
	
}
