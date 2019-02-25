package com.kh.spring.category.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.google.gson.Gson;
import com.kh.spring.category.model.service.CategoryService;
import com.kh.spring.thing.model.vo.Regist;

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
	
	@ResponseBody
	@RequestMapping("/category/laptopPcEnd.do")
	public List<Regist> laptopPcEnd() {
		List<Regist> list = categoryService.laptopPcEnd();
		
		System.out.println("Controller@laptopPcEndList="+list);
		
		
		return list;
		
	}
	


	
	
	
	
}
