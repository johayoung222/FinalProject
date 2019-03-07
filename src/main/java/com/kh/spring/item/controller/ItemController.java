package com.kh.spring.item.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.spring.item.model.service.ItemService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.ProductAsk;

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
	public void productAsk(@RequestParam(value="askContent") String askContent, HttpServletResponse response,
						@RequestParam(value="asker") int asker,
						@RequestParam(value="productNo") int productNo) throws JsonIOException, IOException {
		logger.debug(askContent+"/"+asker);

		ProductAsk pAsk = new ProductAsk();
		pAsk.setAskUser(asker);
		pAsk.setAskContent(askContent);
		
		int result = basketService.insertAsk(pAsk);
		int askNo = pAsk.getSeqAskNo();
		
		Map<String,String> map = new HashMap<>();
		map.put("askNo", String.valueOf(askNo));
		map.put("productNo",String.valueOf(productNo));
		
		basketService.updateProduct(map);
		Member m = basketService.selectJoinMember(asker);
		
		map.put("asker",m.getMemberId());
		map.put("askContent",askContent);
		
		response.setContentType("application/json;charset=UTF-8"); 
		new Gson().toJson(map, response.getWriter());
	}
	
	@RequestMapping("/item/search")
	public ModelAndView searchItem(ModelAndView mav, @RequestParam(value="searchKeyword", required=false) String searchKeyword) {
		
		logger.debug(searchKeyword);
		
		List<Map<String,String>> list = basketService.searchItem(searchKeyword);
		logger.debug(list);
		
		mav.addObject("searchItems", list);
		mav.setViewName("index");
		
		return mav;
	}
	
	@RequestMapping(value="/item/searchPad",method=RequestMethod.GET)
	public void searchPad(@RequestParam("myData") String myData, HttpServletResponse response) throws JsonIOException, IOException {
		
		logger.debug(myData);
		
		List<Map<String,String>> list = basketService.searchItemAjax(myData);
		
		logger.debug(list);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
}
