package com.kh.spring.auction.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.thing.model.vo.CategoryMacro;

@Controller
public class AuctionController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/auctionWriter.do")
	public String auctionWriter(Model model) {
		
		List<String> ctgList = auctionService.selectctgList();
		model.addAttribute("ctgList" , ctgList);
		return "auction/auctionWriter";
	}
	
	@RequestMapping("/selectMlist")
	@ResponseBody
	public Map<String , Object> selectMlist(@RequestParam(value="ctgcode") String ctgcode ){
		List<CategoryMacro> ctgMlist = auctionService.selectctgmlist(ctgcode);
		
		Map<String, Object> map = new HashMap<>();
		map.put("resultMList", ctgMlist);
		return map; 
	}
}
