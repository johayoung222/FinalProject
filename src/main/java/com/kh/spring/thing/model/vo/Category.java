package com.kh.spring.thing.model.vo;

public class Category {
	private String categoryMicro;
	private String categoryMacro;
	private String categoryName;
	public Category() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Category(String categoryMicro, String categoryMacro, String categoryName) {
		super();
		this.categoryMicro = categoryMicro;
		this.categoryMacro = categoryMacro;
		this.categoryName = categoryName;
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
	public String getCategoryName() {
		return categoryName;
	}
	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}
	@Override
	public String toString() {
		return "Category [categoryMicro=" + categoryMicro + ", categoryMacro=" + categoryMacro + ", categoryName="
				+ categoryName + "]";
	}
	
	
	
	
}
