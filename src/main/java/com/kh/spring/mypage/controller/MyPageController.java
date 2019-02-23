package com.kh.spring.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.mypage.model.service.MyPageService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


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
	
	@RequestMapping("/mypage/bookmarks.do")
	public String bookmarks(Model model) {
		List<String> list = new ArrayList<>();
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "등록한 찜 상품이 없습니다. 제품 상세 페이지에서 찜하기 버튼을 이용하여 상품을 등록해 보세요.");			
		}
		
		model.addAttribute("list" , list);
		
		return "mypage/bookmarks";
	}
	
	
	@RequestMapping("/mypage/profile/edit.do")
	public String profileEdit() {
		return "mypage/profileEdit";
	}
	
	@RequestMapping("/mypage/coupons.do")
	public String coupons(Model model) {
		List<String> list = new ArrayList<>();
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "지급된 쿠폰이 없습니다.");			
		}
		
		model.addAttribute("list" , list);
		return "mypage/coupons";
	}
	
	@RequestMapping("/mypage/profile/credit.do")
	public String profileCredit() {
		return "mypage/profileCredit";
	}
	
	@RequestMapping("/mypage/wishlist.do")
	public String wishlist(Model model) {
		List<String> list = new ArrayList<>();
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "등록한 알림이 없습니다.");			
		}
		
		model.addAttribute("list" , list);
		
		return "mypage/wishlist";
	}
	
	 @RequestMapping("/mypage/smscheck.do")
	  public String sendSms(HttpServletRequest request,Model model) throws Exception {

		 String memberPhone = request.getParameter("memberPhone");
		 //String memberId = request.getParameter("memberId");
		 logger.debug("memberPhone=="+memberPhone);
		 //logger.debug("memberId=="+memberId);

	    String api_key = "NCSFQJJ9HCHO2HEE";
	    String api_secret = "TMVG7ETX4WMP6I1OI4XPMFSCZJBOO0FK";
	    Message coolsms = new Message(api_key, api_secret);
	    
	    int certified = ((int) (Math.random() * 899999)+100000);

	    HashMap<String, String> set = new HashMap<String, String>();
		
		/*
		 * set.put("to", memberPhone); // 수신번호 set.put("from", "01090294425"); // 발신번호
		 * set.put("text", "인증번호 ["+certified+"]입니다 :) "); // 문자내용
		 * set.put("type","sms"); // 문자 타입 set.put("app_version", "test app 1.2"); //
		 * application nameand version
		 */		 
	    System.out.println(set);

	    try {
	    	JSONObject result = (JSONObject) coolsms.send(set);
	        System.out.println(result.toString());
	      } catch (CoolsmsException e) {
	        System.out.println(e.getMessage());
	        System.out.println(e.getCode());
	      }
	    model.addAttribute("certified",certified);
	    model.addAttribute("memberPhone",memberPhone);
	    //model.addAttribute("memberId",memberId);
	   

	    return "mypage/sendSms";
	  }
}
