package com.kh.spring.category.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.category.model.service.CategoryService;

@Controller
public class CategoryController {

Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CategoryService categoryService;
	
	
	
	
	@RequestMapping("/category/laptopPc")
	public String laptopPc() {
		
		
		
		
		
		return "category/laptopPc";
	}
	@RequestMapping("/category/Phone")
	public String Phone() {
		
		
		
		
		
		return "category/Phone";
	}
	@RequestMapping("/category/appliance")
	public String appliance() {
		
		
		
		
		
		return "category/appliance";
	}
	@RequestMapping("/category/lifeFood")
	public String lifeFood() {
		
		
		
		
		
		return "category/lifeFood";
	}
	@RequestMapping("/category/lifeHousehold")
	public String lifeHousehold() {
		
		
		
		
		
		return "category/lifeHousehold";
	}
	
	
	
	
}
