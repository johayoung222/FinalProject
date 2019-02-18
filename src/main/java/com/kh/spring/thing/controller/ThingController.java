package com.kh.spring.thing.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.thing.model.service.ThingService;

@Controller
public class ThingController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ThingService thingService;
	
	
	@RequestMapping("/thing/thing.do")
	public String thingView() {
		
		
		
		return "thing/thingView";
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
