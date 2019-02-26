package com.kh.spring.basket.controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.kh.spring.basket.model.service.BasketService;
import com.kh.spring.member.model.vo.Member;

@Controller
public class BasketContoller {

	@Autowired
	BasketService basketservice;


	 
	  @RequestMapping("/item/basket.do")
       public String gotoBasket(HttpSession session, Object Session, Member m) {
	 
		 String memberId =m.getMemberId();
		 System.out.println(memberId);
		 
		 
		 Session = session.getAttribute("memberLoggedIn");
		 System.out.println("Session:"+Session);
	
	  
	     return "item/basket";
	  }
	 

}
