package com.kh.spring.customercenter.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class CustomercenterController {
	
	@RequestMapping("/customercenter/ccintro.do")
	public String customercenterintro() {
		System.out.println("ccintro메소드가 요청되었습니다.");
		return "customercenter/customercenterintro";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	@RequestMapping("/customercenter/ccnews.do")
	public String customercenternews() {
		System.out.println("ccnews메소드가 요청되었습니다.");
		return "customercenter/customercenternews";	//	/WEB-INF/views/demo/demo.jsp
	}
}
