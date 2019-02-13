package com.kh.spring.thing.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.thing.model.service.ThingService;

@Controller
public class ThingController {
	
	@Autowired
	ThingService thingService;
	
	
	@RequestMapping("/thing/thing.do")
	public String thingView() {
		
		
		
		return "thing/thingView";
	}
	
	
	
	
	
	
}
