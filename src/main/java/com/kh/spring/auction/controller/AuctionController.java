package com.kh.spring.auction.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.auction.model.service.AuctionService;

@Controller
public class AuctionController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/auctionWriter.do")
	public String auctionWriter() {
		
		List<String> ctgList = auctionService.selectctgList();
		
		return "auction/auctionWriter";
	}
}
