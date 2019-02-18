package com.kh.spring.thing.model.vo;

import java.sql.Date;

public class Regist {
	private String name;
	private int price;
	private boolean auction;
	private String image;
	private String realImage;
	private int amount;
	private String description;
	private Date date;
	public Regist() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Regist(String name, int price, boolean auction, String image, String realImage, int amount,
			String description, Date date) {
		super();
		this.name = name;
		this.price = price;
		this.auction = auction;
		this.image = image;
		this.realImage = realImage;
		this.amount = amount;
		this.description = description;
		this.date = date;
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
	public String getImage() {
		return image;
	}
	public void setImage(String image) {
		this.image = image;
	}
	public String getRealImage() {
		return realImage;
	}
	public void setRealImage(String realImage) {
		this.realImage = realImage;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Date getDate() {
		return date;
	}
	public void setDate(Date date) {
		this.date = date;
	}
	@Override
	public String toString() {
		return "[name=" + name + ", price=" + price + ", auction=" + auction + ", image=" + image
				+ ", realImage=" + realImage + ", amount=" + amount + ", description=" + description + ", date=" + date
				+ "]";
	}
	
	
	
}
