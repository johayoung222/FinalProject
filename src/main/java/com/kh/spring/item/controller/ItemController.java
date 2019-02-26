package com.kh.spring.item.controller;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.item.model.service.ItemService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

@Controller
public class ItemController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ItemService basketService;
	
	@RequestMapping("/item/item.do")
	public String item() {
		
		return "item/item";
	}
	
	
	/*
	 * @RequestMapping("/item/basket.do") public String basket(HttpSession session)
	 * { String userId = (String)session.getAttribute("userId"); //
	 * vo.setUserId(userId);
	 * 
	 * // int count = basketService.countBasket(vo.getProductId(),userId); //count
	 * == 0 ? basketService.updateBasket(vo): basketService.insert(vo); // if(count
	 * == 0) { // basketService.insert(vo); // }else { //
	 * basketService.updateBasket(vo); // // }
	 * 
	 * return "redirect:/item/basket"; }
	 */
	
	
	@RequestMapping("/item/iteminformation/{productNo}")
	public ModelAndView iteminformation(ModelAndView mav, @PathVariable("productNo") int num) {
		
		Product product = basketService.selectOneProduct(num);
		logger.debug(product);
		
		Member member = basketService.selectJoinMember(product.getSellerNo());
		
		String cMacro = product.getCategoryMacro();
		String cMicro = product.getCategoryMicro();
		logger.debug(cMacro+"/"+cMicro);

		mav.addObject("member", member);
		mav.addObject("product", product);
		mav.setViewName("item/iteminformation");
		
		return mav;
	}
	
}
