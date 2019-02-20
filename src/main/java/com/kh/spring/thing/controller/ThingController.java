package com.kh.spring.thing.controller;

import java.io.File;

import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.common.util.Utils;
import com.kh.spring.thing.model.service.ThingService;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.Order;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

@Controller
public class ThingController {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ThingService thingService;
	
	
	@RequestMapping("/thing/thing.do")
	public ModelAndView thingView(ModelAndView mav) {
		List<Category> categoryList = new ArrayList<>();
		
		categoryList = thingService.selectCategorys();
		
		System.out.println("ThingController@categoryList="+categoryList);
		
		
		
		
		
		
		
		mav.addObject("categoryList", categoryList);
		mav.setViewName("thing/thingView");
		
		return mav;
	}
	
	@RequestMapping("/thing/sell.do")
	public ModelAndView sell(ModelAndView mav, Regist regist, @RequestParam(name="upFile",required=false) MultipartFile [] upFiles, HttpServletRequest req) {
		for(int i = 0 ; i<upFiles.length ; i++) {			
			logger.debug("fileName="+upFiles[i].getOriginalFilename());
			logger.debug("size="+upFiles[i].getSize());
		}
		
		
		
		try{
			//1. 파일업로드
			String saveDirectory = req.getSession().getServletContext().getRealPath("/resources/upload/thing");
			logger.debug("saveDirectory = "+saveDirectory);
			
			List<Attachment> attachList = new ArrayList<>();
			
			//MultipartFile 처리
			
			for(MultipartFile f : upFiles) {
				if(!f.isEmpty()) {
					//파일명(업로드)
					String originalFileName = f.getOriginalFilename();
					regist.setImage(originalFileName);
					
					//파일명(서버저장용)
					String renamedFileName = Utils.getRenamedFileName(originalFileName);
					regist.setRealImage(renamedFileName);
					logger.debug("renamedFileName ="+renamedFileName);
					//실제 서버에 파일저장
					try {
						f.transferTo(new File(saveDirectory+"/"+renamedFileName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//첨부파일 객체 생성. 리스트에 추가
					Attachment attach = new Attachment();
					attach.setOriginalFileName(originalFileName);
					attach.setRenamedFileName(renamedFileName);
					attachList.add(attach);
				}
			}
			//2. 업무로직
			System.out.println("regist@Controller="+regist);
			int result=thingService.sell(regist);
			
			//3. 뷰단처리
			String loc = "/";
			String msg = "";
			
			if(result>0) {
				msg = "게시물 등록 성공";
			}else {
				msg= "게시물 등록 실패";
			}
			
			
			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");
		} catch(Exception e) {
			logger.error("게시물 등록 에러",e);
			throw new BoardException("게시물 등록 에러",e);
		}
		
		
	
	return mav;
		
	}
	

	@RequestMapping(value="/item/perchase/{productNo}", method=RequestMethod.GET)
	public ModelAndView movePerchase(@PathVariable("productNo") int productNo,
							ModelAndView mav) {
		
		Product p = thingService.selectOne(productNo);
		
		mav.addObject("product",p);
		mav.setViewName("item/perchase");
		
		return mav;
	}
	
	@RequestMapping(value="/item/perchase/complete", method=RequestMethod.POST)
	public ModelAndView paymentComplete(ModelAndView mav, @RequestBody Order order) {
		
		logger.debug(order);
		
		mav.setViewName("/mypage/order");
		
		return mav;
	}
	
	
	
	
	
}
