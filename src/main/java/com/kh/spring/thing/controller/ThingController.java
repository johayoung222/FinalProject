package com.kh.spring.thing.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.thing.model.service.ThingService;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.Order;
import com.kh.spring.thing.model.vo.Product;

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
	
	@RequestMapping(value="/item/perchase/{productNo}", method=RequestMethod.GET)
	public ModelAndView movePerchase(@PathVariable("productNo") int productNo,
							ModelAndView mav) {
		
		Product p = thingService.selectOne(productNo);
		
		mav.addObject("product",p);
		mav.setViewName("item/perchase");
		
		return mav;
	}
	
	@RequestMapping(value="/item/perchase/complete", method=RequestMethod.POST)
	public ModelAndView paymentComplete(ModelAndView mav, @RequestBody Order order) {
		
		logger.debug(order);
		
		mav.setViewName("/mypage/order");
		
		return mav;
	}
	
	
	
	
	
}
