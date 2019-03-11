package com.kh.spring.mypage.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.service.MyPageService;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;


@Controller
public class MyPageController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	MyPageService myPageService;
	@Autowired
    private JavaMailSender mailSender;

	@RequestMapping(value= {"/mypage/order.do" , "/mypage/order"})
	public String order(HttpSession session,Model model,
						@RequestParam(name="filter" , required=false) String filter,
						@RequestParam(value = "cPage", defaultValue = "1") int cPage) {
		// 넘겨줄 값이 판매내역리스트 , 값이 없을 경우에 3가지로 분기해서 메시지를 넘겨준다.
		// 3가지로 분기가 되는데 -> 기본 normal c2c temporarily_saved 이다.
		Member m = (Member)session.getAttribute("memberLoggedIn");
		int seqMemberNo = m.getSeqMemberNo();
		
		int numPerPage = 4;
		String loce = "";
		List<Map<String, Object>> list = null;
		int totalContents = 0;
		
		if(!("normal".equals(filter) || "c2c".equals(filter) || "auction".equals(filter))) {
			filter = "normal";			
		}
		
		String view = "";
		String menuSel = "";
		
		if("normal".equals(filter)) {
			list = myPageService.sellList(cPage,numPerPage,seqMemberNo);
			totalContents = myPageService.countproduct(seqMemberNo);
			loce = "/spring/mypage/order";
			view = "mypage/order";
			menuSel = "normal";
		} else if("c2c".equals(filter)) {
			list = myPageService.sellList2(cPage,numPerPage,seqMemberNo);
			totalContents = myPageService.countproduct2(seqMemberNo);
			loce = "/spring/mypage/order?filter=c2c";
			view = "mypage/order";						
			menuSel = "c2c";
		} else if("auction".equals(filter)) {
			list = myPageService.sellList3(cPage,numPerPage,seqMemberNo);
			totalContents = myPageService.countproduct3(seqMemberNo);
			loce = "/spring/mypage/order?filter=auction";
			view = "mypage/order";						
			menuSel = "auction";
		}
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "아직 거래내역이 없습니다.");			
		}
		
		model.addAttribute("cPage",cPage);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("menuSel" , menuSel);
		model.addAttribute("list" , list);
		model.addAttribute("loce" , loce);
		
		return view;
	}
	
	@RequestMapping("/mypage/purchases.do")
	public String purchases(HttpSession session,Model model,@RequestParam(value = "cPage",defaultValue = "1")int cPage) {
		Member m = (Member)session.getAttribute("memberLoggedIn");
		int seqMemberNo = m.getSeqMemberNo();
		int	numPerPage = 4;
		List<Map<String, Object>> list = myPageService.buyList(cPage,numPerPage,seqMemberNo);
		int totalContents = myPageService.countbuy(seqMemberNo);
		
		if(list.isEmpty()) {
			model.addAttribute("msg" , "아직 구매내역이 없습니다. 셀잇에서 스마트하게 쇼핑해보세요.");			
		}
		String view = "mypage/purchases";	
		model.addAttribute("cPage",cPage);
		model.addAttribute("numPerPage",numPerPage);
		model.addAttribute("totalContents",totalContents);
		model.addAttribute("list" , list);
		
		return view;
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
	public ModelAndView sendSms(ModelAndView mav,@RequestParam(name="memberId") String memberId) {
		Member m = new Member();
		m.setMemberId(memberId);
		
		
		mav.addObject("m",m);
		mav.setViewName("mypage/sendSms");
		return mav; // /WEB-INF/views/demo/demo.jsp
	}
	@RequestMapping("/mypage/emailcheck.do")
	public ModelAndView sendEmail(ModelAndView mav,@RequestParam(name="memberId") String memberId) {
		Member m = new Member();
		m.setMemberId(memberId);
		
		
		mav.addObject("m",m);
		mav.setViewName("mypage/sendEmail");
		return mav;
	}
	@RequestMapping("/mypage/sendEmail.do")
	public String mailSending(HttpServletRequest request,Model model) {
		 String memberEmail = request.getParameter("memberEmail");
		 String memberId = request.getParameter("memberId");
		 logger.debug("memberPhone=="+memberEmail);
		 logger.debug("memberId=="+memberId);
		int certified = ((int) (Math.random() * 899999)+100000);
		
	    String setfrom = "7sscheduler@gmail.com";         
	    String tomail  = memberEmail;     // 받는 사람 이메일
	    String title   = "Get!t 인증번호 입니다!";      // 제목
	    String content = "인증번호는 ["+certified+"] 입니다 :)";    // 내용
	   
	    try {
	      MimeMessage message = mailSender.createMimeMessage();
	      MimeMessageHelper messageHelper 
	                        = new MimeMessageHelper(message, true, "UTF-8");
	 
	      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
	      messageHelper.setTo(tomail);     // 받는사람 이메일
	      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
	      messageHelper.setText(content);  // 메일 내용
	     
	      mailSender.send(message);
	    } catch(Exception e){
	      System.out.println(e);
	    }
	    model.addAttribute("certified",certified);
	    model.addAttribute("memberEmail",memberEmail);
	    model.addAttribute("memberId",memberId);
	   
	    return "mypage/sendEmail";
	  }
	
	@RequestMapping("/mypage/updateemail.do")
	public ModelAndView updateemail(HttpServletRequest request,HttpSession session,ModelAndView mav) {
		 String memberEmail = request.getParameter("memberEmail");
		 String memberId = request.getParameter("memberId");
		 logger.debug("memberPhone=="+memberEmail);
		 logger.debug("memberId=="+memberId);
		 
		Member m = (Member)session.getAttribute("memberLoggedIn");
		//Member m = new Member();
	    m.setMemberId(memberId);
	    m.setMemberEmail(memberEmail);
	    
	    
	    logger.debug("member=="+m);
	    int result = myPageService.updateemail(m);
	    String loc = "/mypage/profile/edit.do";
		
		mav.addObject("loc", loc);
		mav.setViewName("common/msg");
	    
		return mav;
	}
	
	@RequestMapping("/mypage/sendSms.do")
	  public String sendSms(HttpServletRequest request,Model model) throws Exception {

		 String memberPhone = request.getParameter("memberPhone");
		 String memberId = request.getParameter("memberId");
		 logger.debug("memberPhone=="+memberPhone);
		 logger.debug("memberId=="+memberId);

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
	    model.addAttribute("memberId",memberId);
	    
	    
	    return "mypage/sendSms";
	  }
	 
	 @RequestMapping("/mypage/updatephone.do")
		public ModelAndView updatephone(HttpServletRequest request,HttpSession session,ModelAndView mav) {
			 String memberPhone = request.getParameter("memberPhone");
			 String memberId = request.getParameter("memberId");
			 logger.debug("memberPhone=="+memberPhone);
			 logger.debug("memberId=="+memberId);
			 
			Member m = (Member)session.getAttribute("memberLoggedIn");
			//Member m = new Member();
		    m.setMemberId(memberId);
		    m.setMemberPhone(memberPhone);
		    
		    logger.debug("member=="+m);
		    int result = myPageService.updatephone(m);
		    String loc = "/mypage/profile/edit.do";
			//String msg = "";

		/*
		 * if (result > 0) { msg = "인증 성공"; } else { msg = "인증 실패"; }
		 * 
		 * mav.addObject("msg", msg);
		 */
			mav.addObject("loc", loc);
			//mav.addObject("msg", msg);
			mav.setViewName("common/msg");
		    
			return mav;
		}
	 @RequestMapping("/mypage/addressupdate.do")
	 public ModelAndView updateaddress(ModelAndView mav,HttpServletRequest request,HttpSession session) {
		 String address = request.getParameter("addressMail");
		 String address2 = request.getParameter("addressMail2");
		 String address3 = request.getParameter("addressMail3");
		 String memberId = request.getParameter("memberId");
		 String memberAddress = address+" "+address2+" "+address3;
		 logger.debug("address~"+address+"||"+address2+"||"+address3);
		 
		 Member m = (Member)session.getAttribute("memberLoggedIn");
		 m.setMemberId(memberId);
		 m.setMemberAddress(memberAddress);
		 logger.debug("member=="+m);
		 
		 String loc = "/mypage/profile/edit.do";
		 
		 int result = myPageService.updateaddress(m);
		 
		 mav.addObject("loc", loc);
		 mav.addObject("address",address);
		 mav.addObject("address2",address2);
		 mav.addObject("address3",address3);
		 mav.setViewName("mypage/profileEdit");
		 
		 return mav;
	 }

}
