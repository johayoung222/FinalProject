package com.kh.spring.customercenter.controller;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.customercenter.model.service.CustomerService;

@Controller
public class CustomercenterController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/customercenter/ccintro.do")
	public String customercenterintro() {
		System.out.println("ccintro메소드가 요청되었습니다.");
		return "customercenter/customercenterintro";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	//@RequestMapping("/customercenter/ccnews.do")
	public String customercenternews() {
		System.out.println("ccnews메소드가 요청되었습니다.");
		return "customercenter/customercenternews";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	@RequestMapping("/customercenter/ccinquiry.do")
	public String customercenterinquiry() {
		System.out.println("ccinquiry메소드가 요청되었습니다.");
		return "customercenter/customercenterinquiry";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	@RequestMapping("/customercenter/ccqna.do")
	public String customercenternewsqna() {
		System.out.println("ccqna메소드가 요청되었습니다.");
		return "customercenter/customercenternewsqna";	//	/WEB-INF/views/demo/demo.jsp
	}
	//////////////////////////////////////////////////////////////////////////////////////
	
	
	@RequestMapping("/customercenter/ccnews.do")
	public ModelAndView selectBoardList(@RequestParam(value="cPage",defaultValue="1") int cPage,
										ModelAndView mav) {
	
		int numPerPage = 5;
		//업무로직 
		//1.게시글 리스트(페이징적용)
		List<Map<String,String>>list = customerService.selectNewsList(cPage,numPerPage);
		logger.debug("list=="+list);
		
		//2.전체컨텐츠수
		//int totalContents = boardService.selectCountBoard();
		//logger.debug("totalC=="+totalContents);
		
		mav.addObject("list", list);
		//mav.addObject("totalContents",totalContents);
		mav.setViewName("customercenter/customercenternews");
		
		
		return mav;
	}

}
