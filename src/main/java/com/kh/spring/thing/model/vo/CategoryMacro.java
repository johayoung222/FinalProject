package com.kh.spring.thing.model.vo;

import java.io.Serializable;

public class CategoryMacro implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	private String categoryMacro;
	private String categoryName;
	public CategoryMacro() {
		super();
		// TODO Auto-generated constructor stub
	}
	public CategoryMacro(String categoryMacro, String categoryName) {
		super();
		this.categoryMacro = categoryMacro;
		this.categoryName = categoryName;
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
	public static long getSerialversionuid() {
		return serialVersionUID;
	}
	@Override
	public String toString() {
		return "CategoryMacro [categoryMacro=" + categoryMacro + ", categoryName=" + categoryName + "]";
	}
	
	
}
