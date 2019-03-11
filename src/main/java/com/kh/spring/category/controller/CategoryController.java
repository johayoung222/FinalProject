package com.kh.spring.category.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.category.model.service.CategoryService;
import com.kh.spring.item.model.service.ItemService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

@Controller
public class CategoryController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CategoryService categoryService;
	
	@Autowired
	AuctionService auctionService;
	
	@Autowired
	ItemService itemService;
	
	@RequestMapping("/")
	public ModelAndView	categoryInHeader(ModelAndView mav , HttpSession session) {
//		첫 로딩시 category data를 header에 전달. interceptor / aop 가능성.
		List<Map<String,String>> list = categoryService.selectMacro();
		logger.debug(list);
		List<Product> newList = itemService.selectNew();
		Member m = (Member) session.getAttribute("memberLoggedIn");
		
		List<Map<String,String>> auctionList = auctionService.selectAuctionList();
		System.out.println("경매물품리스트"+auctionList);
		
		String auctionNo = "";
		Map<String , Object> temp = new HashMap<>();
		Map<String , String > result = new HashMap<>();
		Map<String , String > resultTemp = new HashMap<>();
		Map<String , String > resultPrice = new HashMap<>();
		
		
		if(m != null) {
			String memberId = m.getMemberId();
			// index에 내가 그 경매 상품에 입찰을 진행중인지 뛰우기 위한 소스코드 작성
			// 글번호와 현재 session아이디를 가져가서 조회해서 그 값이 있으면 입찰중이다.
			// 그리고 최근 것이 1번으로 되는거임 for문안에서
			for(int i = 1;i <= 4;i++) {
				auctionNo = String.valueOf(auctionList.get(i-1).get("AUCTION_NO"));
				temp.put("memberId" , memberId);
				temp.put("auctionNo" , auctionNo);
				List<Map<String,String>> checkList = auctionService.checkHistory(temp);

				
				
				
				if(checkList.size() == 0) {
					result.put(String.valueOf("check"+i), "N");
				} else {
					result.put(String.valueOf("check"+i), "Y");
				}
				
			}	
		} else {
			for(int i = 1;i <= 4;i++) {
				result.put(String.valueOf("check"+i), "F");
			}
		}
		
		for(int i = 1;i <= 4;i++) {
			resultPrice.put("bidCheck"+i, "Y");
			auctionNo = String.valueOf(auctionList.get(i-1).get("AUCTION_NO"));
			temp.put("auctionNo" , auctionNo);
			resultTemp = auctionService.selectAuctionBid(temp);
			String price = "";
			if(resultTemp == null) {
				price = String.valueOf(auctionList.get(i-1).get("AUCTION_PRICE"));
				resultPrice.put("bidCheck"+i, "N");
			} else {
				price = String.valueOf(resultTemp.get("PRICE"));
			}
			
			System.out.println("priceeeeeeeeeee"+price);
			resultPrice.put(String.valueOf("Price"+i), price);
		}
		
		


		mav.addObject("resultPrice" , resultPrice);
		mav.addObject("result" , result);
		mav.addObject("cpList", newList);
		mav.addObject("auctionList" , auctionList);
		mav.addObject("categoryList",list);
		mav.setViewName("index");

		
		return mav;
	}

	@RequestMapping("/category")
	public ModelAndView categoryReturn(ModelAndView mav,@RequestParam("caKey") String caKey,
										@RequestParam("ciKey") String ciKey) {
		
		Map<String,String> map = new HashMap<>();
		map.put("caKey",caKey);
		map.put("ciKey",ciKey);
		
		List<Product> list = categoryService.selectByCategory(map);
		logger.debug(list);
		
		mav.addObject("aiKey", map);
		mav.addObject("cpList", list);
		mav.setViewName("item/item");
		
		return mav;
	}
	
	
	
}
