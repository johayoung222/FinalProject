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
import com.kh.spring.customercenter.model.vo.Board;
import com.kh.spring.memo.model.vo.Memo;


@Controller
public class CustomercenterController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CustomerService customerService;
	
	@RequestMapping("/customercenter/ccintro.do")
	public String customercenterintro() {
		//System.out.println("ccintro메소드가 요청되었습니다.");
		return "customercenter/customercenterintro";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	//@RequestMapping("/customercenter/ccnews.do")
	//public String customercenternews() {
	//	System.out.println("ccnews메소드가 요청되었습니다.");
	//	return "customercenter/customercenternews";	//	/WEB-INF/views/demo/demo.jsp
	//}
	
	@RequestMapping("/customercenter/ccinquiry.do")
	public String customercenterinquiry() {
		//System.out.println("ccinquiry메소드가 요청되었습니다.");
		return "customercenter/customercenterinquiry";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	@RequestMapping("/customercenter/ccqna.do")
	public String customercenternewsqna() {
		//System.out.println("ccqna메소드가 요청되었습니다.");
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
		int totalContents = customerService.countNewsList();
		logger.debug("totalC=="+totalContents);
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("customercenter/customercenternews");
		
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		
		
		return mav;
	}
	
	
	//관리자일시 공지사항등록
	@RequestMapping("/customercenter/insertNews.do")
	public ModelAndView insertNews(Board board,ModelAndView mav) {
		
			logger.debug("board="+board);
		
		
			//2. 업무로직
			int result = customerService.insertNews(board);
			logger.debug("cont result"+result);	
			
			//3. 뷰단처리
			String loc = "/customercenter/ccnews.do";
			String msg = "";
			
			if(result>0) {
				msg = "게시물 등록 성공";
			}else {
				msg= "게시물 등록 실패";
			}
			
			
			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");
		
		return mav;
	}
	
	@RequestMapping("/customercenter/updateNews.do")
	public ModelAndView updateNews(Board board, ModelAndView mav) {
		//logger.debug("board="+board);
		
		int result = customerService.updateNews(board);
		logger.debug("cont result"+result);	
		
		//3. 뷰단처리
		String loc = "/customercenter/ccnews.do";
		String msg = "";
		
		if(result>0) {
			msg = "게시물 수정 성공";
		}else {
			msg= "게시물 수정 실패";
		}
		
		
		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");
	
	return mav;
	}
	
	@RequestMapping("/customercenter/deleteNews.do")
	public ModelAndView deleteNews(Board board, ModelAndView mav) {
		logger.debug("board="+board);
		
		int result = customerService.deleteNews(board);
		
		String loc = "/customercenter/ccnews.do";
		String msg = "";
		
		if(result>0) {
			msg = "게시물 삭제 성공";
		}else {
			msg= "게시물 삭제 실패";
		}
		
		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");

		return mav;
	}
}
