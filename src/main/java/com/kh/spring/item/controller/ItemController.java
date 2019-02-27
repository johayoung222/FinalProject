package com.kh.spring.item.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.spring.item.model.service.ItemService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

@Controller
public class ItemController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ItemService basketService;
	
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
	
	@RequestMapping("/item/ask")
	public void productAsk(@RequestParam(value="askContent") String askContent, HttpServletResponse response) throws JsonIOException, IOException {
		
		new Gson().toJson(askContent, response.getWriter());
	}
	
}
