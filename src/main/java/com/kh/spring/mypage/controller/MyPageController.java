package com.kh.spring.mypage.controller;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.mypage.model.service.MyPageService;

@Controller
public class MyPageController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	MyPageService myPageService;

	@RequestMapping(value= {"/mypage/order.do" , "/mypage/order"})
	public String order(Model model , @RequestParam(name="filter" , required=false) String filter) {
		// 넘겨줄 값이 판매내역리스트 , 값이 없을 경우에 3가지로 분기해서 메시지를 넘겨준다.
		// 3가지로 분기가 되는데 -> 기본 normal c2c temporarily_saved 이다.
		List<String> list = new ArrayList<>();	// 예비 물건 판매내역 리스트
		
		if(!("normal".equals(filter) || "c2c".equals(filter) || "temporarily_saved".equals(filter))) {
			filter = "normal";			
		}
		
		String view = "";
		String menuSel = "";
		
		if("normal".equals(filter)) {
			view = "mypage/order";
			menuSel = "normal";
		} else if("c2c".equals(filter)) {
			view = "mypage/order";						
			menuSel = "c2c";
		} else if("temporarily_saved".equals(filter)) {
			view = "mypage/order";									
			menuSel = "temporarily_saved";
		}
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "아직 거래내역이 없습니다.");			
		}
		

		model.addAttribute("menuSel" , menuSel);
		model.addAttribute("list" , list);
		
		return view;
	}
	
	@RequestMapping("/mypage/purchases.do")
	public String purchases(Model model) {
		List<String> list = new ArrayList<>();
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "아직 구매내역이 없습니다. 셀잇에서 스마트하게 쇼핑해보세요.");			
		}
		
		model.addAttribute("list" , list);
		
		return "mypage/purchases";
	}
	
	
	@RequestMapping("/mypage/profile.do")
	public String profile() {
		return "mypage/profile";
	}
}
