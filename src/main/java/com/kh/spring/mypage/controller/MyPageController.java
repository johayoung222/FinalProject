package com.kh.spring.mypage.controller;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.mypage.model.service.MyPageService;

@Controller
public class MyPageController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	MyPageService myPageService;
	
	@RequestMapping("/mypage/order.do")
	public String order() {
		
		return "mypage/order";
	}
	
	@RequestMapping("/mypage/profile.do")
	public String profile() {
		return "mypage/profile";
	}
}
