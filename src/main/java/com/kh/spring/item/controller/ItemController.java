package com.kh.spring.item.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.spring.auction.model.service.AuctionService;
import com.kh.spring.common.naverapi.NaverApi;
import com.kh.spring.item.model.service.ItemService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.ProductAsk;
import com.kh.spring.thing.model.vo.Regist;

@Controller
public class ItemController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ItemService itemService;
	
	@Autowired
	AuctionService auctionService;
	
	@RequestMapping("/item/iteminformation/{productNo}")
	public ModelAndView iteminformation(ModelAndView mav, @PathVariable("productNo") int num) {
		
		Product product = itemService.selectOneProduct(num);
		logger.debug(product);
		
		Member member = itemService.selectJoinMember(product.getSellerNo());
		
		String cMacro = product.getCategoryMacro();
		String cMicro = product.getCategoryMicro();
		String cProNo = String.valueOf(num);
		Map<String,String> map = new HashMap<>();
		map.put("cMacro",cMacro);
		map.put("cMicro",cMicro);
		map.put("cProNo",cProNo);
		
		List<Product> list = itemService.selectNowProduct(map);

		mav.addObject("cpList", list);
		mav.addObject("member", member);
		mav.addObject("product", product);
		mav.setViewName("item/iteminformation");
		
		return mav;
	}
	
	@RequestMapping("/item/ask")
	public void productAsk(@RequestParam(value="askContent") String askContent, HttpServletResponse response,
						@RequestParam(value="asker") int asker,
						@RequestParam(value="productNo") int productNo) throws JsonIOException, IOException {
		logger.debug(askContent+"/"+asker);

		ProductAsk pAsk = new ProductAsk();
		pAsk.setAskUser(asker);
		pAsk.setAskContent(askContent);
		pAsk.setSeqProductNo(productNo);
		
		int result = itemService.insertAsk(pAsk);
		int askNo = pAsk.getSeqAskNo();
		
		Map<String,String> map = new HashMap<>();
		map.put("askNo", String.valueOf(askNo));
		map.put("productNo",String.valueOf(productNo));
		
		itemService.updateProduct(map);
		Member m = itemService.selectJoinMember(asker);
		//이 리스트를 넘겨야 한다아아아아아아아아아아..............03.07 -ing.
		List<ProductAsk> list = itemService.selectAskAll(productNo);
		
		map.put("asker",m.getMemberId());
		map.put("askContent",askContent);
		
		response.setContentType("application/json;charset=UTF-8"); 
		new Gson().toJson(map, response.getWriter());
	}
	
	@RequestMapping("/item/search")
	public ModelAndView searchItem(ModelAndView mav, @RequestParam(value="searchKeyword", required=false) String searchKeyword) {
		
		logger.debug(searchKeyword);
		
		List<Product> list = itemService.searchItem(searchKeyword);
		List<Map<String,String>> auctionList = auctionService.selectAuctionListBySearch(searchKeyword);
		
		logger.debug(list);
		
		mav.addObject("auctionList", auctionList);
		mav.addObject("cpList", list);
		mav.setViewName("item/item");
		
		return mav;
	}
	
	@RequestMapping(value="/item/searchPad",method=RequestMethod.GET)
	public void searchPad(@RequestParam("myData") String myData, HttpServletResponse response) throws JsonIOException, IOException {
		
		logger.debug(myData);
		
		List<Map<String,String>> list = itemService.searchItemAjax(myData);
		
		logger.debug(list);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(list, response.getWriter());
	}
	
	@RequestMapping("/item/regist")
	public ModelAndView registProduct(ModelAndView mav) {
		
		List<Regist> list = itemService.selectAllRegist();
		String isRegist = "Y";
		
		mav.addObject("isRegist", isRegist);
		mav.addObject("cpList", list);
		mav.setViewName("item/registItem");
		
		return mav;
	}
	
	@RequestMapping("/item/brandNew")
	public ModelAndView brandNew(ModelAndView mav) {
		
		List<Product> list = itemService.selectNew();
		String brandNew = "Y";
		
		mav.addObject("brandNew", brandNew);
		mav.addObject("cpList", list);
		mav.setViewName("item/item");
		
		return mav;
	}
	
	@RequestMapping("/item/recommend")
	public ModelAndView upItem(ModelAndView mav) {
		
		List<Product> list = itemService.selectUpItems();
		String isRecommend = "Y";
		
		mav.addObject("isRecommend", isRecommend);
		mav.addObject("cpList", list);
		mav.setViewName("item/item");
		
		return mav;
	}
	
	@RequestMapping("/item/interest")
	public ModelAndView interestItems(ModelAndView mav, HttpSession session) {
		
		Member m = (Member) session.getAttribute("memberLoggedIn");
		int memberNo = m.getSeqMemberNo();
		String itrList = itemService.selectMemberInterest(memberNo);
		
		List<Product> list = null;
		
		if(itrList != null) {
			
		String[] itrArr = itrList.split("");
		List<String> itrArrList = new ArrayList<>();
		for(String i : itrArr) {
			itrArrList.add(i);
		}
		logger.debug(itrArrList);
		
		list = itemService.selectItr(itrArrList);
		
		}
		
		logger.debug(list);
		String isInterest = "Y";
		
		mav.addObject("isInterest", isInterest);
		mav.addObject("cpList", list);
		mav.setViewName("item/item");
		
		return mav;
	}
	

	@RequestMapping("/itme/moreInfo")
	public void moreInfo(@RequestParam(value="searchKeyword") String searchKeyword, HttpServletResponse response) throws JsonIOException, IOException {
		
		logger.debug(searchKeyword);
		
		String searchResult = new NaverApi().searchNaver(searchKeyword);
		
		logger.debug(searchResult);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(searchResult, response.getWriter());
	}

	@RequestMapping(value="/item/couponList.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> couponList (@RequestParam(value="buyerNo")String buyerNo){
		logger.debug("couponList 메소드 실행!!");
		List<Map<String, Object>> list = itemService.couponList(buyerNo);
		logger.debug(list);
		return list;

	}
}
