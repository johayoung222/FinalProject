package com.kh.spring.basket.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.basket.model.service.BasketService;

@Controller
public class BasketContoller {

	
	@Autowired BasketService basketservice;
	
	
	@RequestMapping("/item/basket.do")
	public String gotoBasket() {
		
		
		return "item/basket";	
		
	}
	
	
	
	
}
