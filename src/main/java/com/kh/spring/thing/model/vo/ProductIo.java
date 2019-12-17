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
public class ProductIo {
	private int seqProductNo;
	private String productName;
	private int productIoPrice;
	private String productIoAuction;
	private String productIoManuFacturer;
	private int productIoAmount;
	private String productIoImage;
	private String productIoRealImage;
	private int productIoMilege;
	private String productIoDescription;
	private Date productIoDate;
	private String productKinds;
	private String categoryMicro;
	private String categoryMacro;
	private String productAdminDescription;
	
	public ProductIo() {}

	public ProductIo(int seqProductNo, String productName, int productIoPrice, String productIoAuction,
			String productIoManuFacturer, int productIoAmount, String productIoImage, String productIoRealImage,
			int productIoMilege, String productIoDescription, Date productIoDate, String productKinds,
			String categoryMicro, String categoryMacro, String productAdminDescription) {
		super();
		this.seqProductNo = seqProductNo;
		this.productName = productName;
		this.productIoPrice = productIoPrice;
		this.productIoAuction = productIoAuction;
		this.productIoManuFacturer = productIoManuFacturer;
		this.productIoAmount = productIoAmount;
		this.productIoImage = productIoImage;
		this.productIoRealImage = productIoRealImage;
		this.productIoMilege = productIoMilege;
		this.productIoDescription = productIoDescription;
		this.productIoDate = productIoDate;
		this.productKinds = productKinds;
		this.categoryMicro = categoryMicro;
		this.categoryMacro = categoryMacro;
		this.productAdminDescription = productAdminDescription;
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

	public int getProductIoPrice() {
		return productIoPrice;
	}

	public void setProductIoPrice(int productIoPrice) {
		this.productIoPrice = productIoPrice;
	}

	public String getProductIoAuction() {
		return productIoAuction;
	}

	public void setProductIoAuction(String productIoAuction) {
		this.productIoAuction = productIoAuction;
	}

	public String getProductIoManuFacturer() {
		return productIoManuFacturer;
	}

	public void setProductIoManuFacturer(String productIoManuFacturer) {
		this.productIoManuFacturer = productIoManuFacturer;
	}

	public int getProductIoAmount() {
		return productIoAmount;
	}

	public void setProductIoAmount(int productIoAmount) {
		this.productIoAmount = productIoAmount;
	}

	public String getProductIoImage() {
		return productIoImage;
	}

	public void setProductIoImage(String productIoImage) {
		this.productIoImage = productIoImage;
	}

	public String getProductIoRealImage() {
		return productIoRealImage;
	}

	public void setProductIoRealImage(String productIoRealImage) {
		this.productIoRealImage = productIoRealImage;
	}

	public int getProductIoMilege() {
		return productIoMilege;
	}

	public void setProductIoMilege(int productIoMilege) {
		this.productIoMilege = productIoMilege;
	}

	public String getProductIoDescription() {
		return productIoDescription;
	}

	public void setProductIoDescription(String productIoDescription) {
		this.productIoDescription = productIoDescription;
	}

	public Date getProductIoDate() {
		return productIoDate;
	}

	public void setProductIoDate(Date productIoDate) {
		this.productIoDate = productIoDate;
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

	public String getProductAdminDescription() {
		return productAdminDescription;
	}

	public void setProductAdminDescription(String productAdminDescription) {
		this.productAdminDescription = productAdminDescription;
	}
	
	
	
}
