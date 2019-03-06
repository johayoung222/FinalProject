package com.kh.spring.category.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.category.model.service.CategoryService;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

@Controller
public class CategoryController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	AuctionService auctionService;
	
	
	
	
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
		
		return list;
		
	}
	
	@RequestMapping("/")
	public ModelAndView	categoryInHeader(ModelAndView mav) {
//		첫 로딩시 category data를 header에 전달. interceptor / aop 가능성.
		List<Map<String,String>> list = categoryService.selectMacro();
		logger.debug(list);
		
		List<Map<String,String>> auctionList = auctionService.selectAuctionList();
		System.out.println("경매물품리스트"+auctionList);

		mav.addObject("auctionList" , auctionList);
		mav.addObject("categoryList",list);
		mav.setViewName("index");

		
		return mav;
	}

	@RequestMapping("/category")
	public ModelAndView categoryReturn(ModelAndView mav,@RequestParam("caKey") String caKey,
										@RequestParam("ciKey") String ciKey) {
		
		Map<String,String> map = new HashMap<>();
		map.put("caKey",caKey);
		map.put("ciKey",ciKey);
		
		List<Product> list = categoryService.selectByCategory(map);
		logger.debug(list);
		
		mav.addObject("aiKey", map);
		mav.addObject("cpList", list);
		mav.setViewName("item/item");
		
		return mav;
	}
	
	
	
}
