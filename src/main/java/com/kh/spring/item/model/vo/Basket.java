package com.kh.spring.item.model.vo;

public class Basket {
	private int cartId;
	private String userId;
	private String userName;
	private int productId;
	private String productName;
	private int productPrice;
	private int amount;
	private int money;
	
	public Basket() {
		
	}

	public Basket(int cartId, String userId, String userName, int productId, String productName, int productPrice,
			int amount, int money) {
		super();
		this.cartId = cartId;
		this.userId = userId;
		this.userName = userName;
		this.productId = productId;
		this.productName = productName;
		this.productPrice = productPrice;
		this.amount = amount;
		this.money = money;
	}

	public int getCartId() {
		return cartId;
	}

	public void setCartId(int cartId) {
		this.cartId = cartId;
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public int getProductId() {
		return productId;
	}

	public void setProductId(int productId) {
		this.productId = productId;
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

	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	@Override
	public String toString() {
		return "basket [cartId=" + cartId + ", userId=" + userId + ", userName=" + userName + ", productId=" + productId
				+ ", productName=" + productName + ", productPrice=" + productPrice + ", amount=" + amount + ", money="
				+ money + "]";
	}
	
}
