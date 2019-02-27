package com.kh.spring.basket.controller;


import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.basket.model.service.BasketService;
import com.kh.spring.member.model.vo.Member;

@Controller
public class BasketContoller {

	@Autowired
	BasketService basketService;


	 
	  @RequestMapping("/item/basket.do")
       public String gotoBasket(HttpSession session, Object Session, Member m) {
	 
		
	
	
	  
	     return "item/basket";
	  }
	 
	
    @RequestMapping("/basket/basketList.do")
    public ModelAndView basketList(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("basketList메소드 실행!!");
		int numPerPage =7;
		List<Map<String, String>> list = basketService.basketList(cPage, numPerPage);
		int totalContents = basketService.countbasketList();
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/productList");
		return mav;
	}
	  
	
	 

}
