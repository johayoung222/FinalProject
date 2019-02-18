package com.kh.spring.thing.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.thing.model.service.ThingService;
import com.kh.spring.thing.model.vo.Category;

@Controller
public class ThingController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ThingService thingService;
	
	
	@RequestMapping("/thing/thing.do")
	public ModelAndView thingView(ModelAndView mav) {
		List<Category> categoryList = new ArrayList<>();
		
		categoryList = thingService.selectCategorys();
		
		System.out.println("ThingController@categoryList="+categoryList);
		
		
		
		
		
		
		
		mav.addObject("categoryList", categoryList);
		mav.setViewName("thing/thingView");
		
		return mav;
	}
	
	@RequestMapping("/thing/sell.do")
	public String sell() {
		
		
		
		return "";
	}
	
	@RequestMapping("/item/perchase")
	public String movePerchase() {
		
		return "item/perchase";
	}
	
	
	
	
	
}
