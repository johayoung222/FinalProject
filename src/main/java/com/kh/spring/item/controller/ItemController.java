package com.kh.spring.item.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.customercenter.model.service.CustomerService;
import com.kh.spring.item.model.service.BasketService;
import com.kh.spring.item.model.vo.Basket;

@Controller
public class ItemController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BasketService basketService;
	
	@RequestMapping("/item/item.do")
	public String item() {
		
		return "item/item";
	}
	@RequestMapping("/item/basket.do")
	public String basket(@ModelAttribute Basket vo, HttpSession session) {
		String userId = (String)session.getAttribute("userId");
		vo.setUserId(userId);
		
//		int count = basketService.countBasket(vo.getProductId(),userId);
		//count == 0 ? basketService.updateBasket(vo): basketService.insert(vo);
//		if(count == 0) {
//			basketService.insert(vo);
//		}else {
//			basketService.updateBasket(vo);
//			
//		}
		
		return "redirect:/item/basket";
	}
	@RequestMapping("/item/iteminformation.do")
	public String iteminformation() {
		
		return "item/iteminformation";
	}
	
}
