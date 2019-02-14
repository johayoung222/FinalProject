package com.kh.spring.admin.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.model.service.AdminService;

/**
 * @controller클래스 메소드가 가질 수 있는 파라미터
 * - HttpServletRequest
 * - HttpServletResponse
 * - HttpSession <- 가져올 필요없이 바로 사용이 가능하다.
 * 
 * - InputStream/Reader : 요청에 대한 입력
 * - OutputStream/Writer : 응답에 대한 출력
 * 
 * - @PathVariable
 * - @RequestParam
 * - @RequestHeader
 * - @CookieValue
 * - @RequestBody
 * 
 * - Map , Model , ModelMap : 뷰에 전달할 Model데이터
 * - Command객체 - vo객체
 * - Error , BindingResult : 유효성 검사 관련 객체
 * - SessionStatus : 세션 관리 객체
 * - java.util.Locale : 서버의 지역정보
 *
 */

@Controller
public class AdminController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AdminService adminService;
	
	@RequestMapping("/admin/adminView.do")
	public String adminView() {
		System.out.println("adminView메소드가 요청되었습니다.");
		return "admin/adminView";	//	/WEB-INF/views/admin/adminView.jsp
	}
	
	@RequestMapping("/admin/allMember.do")
	public ModelAndView allMember(@RequestParam(value="cPage" , defaultValue="1") int cPage ,
			ModelAndView mav) {
		System.out.println("allMember메소드가 요청되었습니다.");
				
		int numPerPage = 7;
		
		List<Map<String, String>> list = adminService.allMember(cPage , numPerPage);
		System.out.println("Controller allMember list : "+list);
		int totalContents = adminService.countallMember();
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.setViewName("admin/allMember");
		
		return mav;
	}
	
	@RequestMapping("/admin/memberSearch.do")
	public ModelAndView memberSearch(ModelAndView mav, 
			@RequestParam(value="type")String type, 
			@RequestParam(value="search")String search,
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		//System.out.println("controller type:"+type);
		//System.out.println("controller search:"+search);
		System.out.println("memeberSearch메소드가 요청되었습니다.");
		int numPerPage= 7;
		int totalContents =0;
		List<Map<String, String>> list =null;
		if("member_id".equals(type)) {
			list = adminService.idSearch(search,cPage,numPerPage);
			totalContents =adminService.countidSearch(search);
		}else if("member_name".equals(type)) {
			list = adminService.nameSearch(search,cPage,numPerPage);
			totalContents =adminService.countnameSearch(search);
		}
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/allMember");
		
		return mav;
	}
	
	@RequestMapping("/admin/paidProduct.do")
	public ModelAndView paidProduct(ModelAndView mav, @RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("paidProduct메소드 실행!!");
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.paidProduct(cPage, numPerPage);
		System.out.println("Controller paidProduct list : "+list);
		int totalContents = adminService.countpaidProduct();
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.setViewName("admin/paidProduct");
				
		return mav;
	}
	
	@RequestMapping("/admin/paidProductSearch.do")
	public ModelAndView paidProductSearch(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		System.out.println("paidProductSearch메소드 실행!!");
		List<Map<String, String>> list = null;
		int numPerPage = 7;
		int totalContents=0;
		if("product_name".equals(type)) {
			list = adminService.paidProductNameSerach(search,cPage, numPerPage);
			totalContents = adminService.countpaidProductNameSerach(search);
		}else if("product_buyer".equals(type)) {
			list = adminService.paidProductBuyerSerach(search,cPage, numPerPage);
			totalContents = adminService.countpaidProductBuyerSerach(search);
		}else if("product_category".equals(type)) {
			list = adminService.paidProductCategorySerach(search,cPage, numPerPage);
			totalContents = adminService.countpaidProductCategorySerach(search);
		}
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.setViewName("admin/paidProduct");
		
		return mav;
	}
	
	
	
	@RequestMapping("/admin/regist.do")
	public ModelAndView regist(ModelAndView mav, @RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("regist메소드 실행!!");
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.regist(cPage, numPerPage);
		System.out.println("Controller regist list : "+list);
		int totalContents = adminService.countregist();
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.setViewName("admin/regist");
		
		return mav;
	}
		
	@RequestMapping("/admin/productList.do")
	public ModelAndView productList(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("productList메소드 실행!!");
		int numPerPage =7;
		List<Map<String, String>> list = adminService.productList(cPage, numPerPage);
		int totalContents = adminService.countproductList();
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/productList");
		return mav;
	}
	
	@RequestMapping("/admin/productListSearch.do")
	public ModelAndView productListSearch(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		System.out.println("productListSearch메소드 실행!!");
		int numPerPage =7;
		int totalContents=0;
		List<Map<String, String>> list =null;
				
		if("product_name".equals(type)) {
			list = adminService.productListNameSearch(search,cPage, numPerPage);
			totalContents = adminService.countproductListNameSearch(search);
		}else if("product_onsale".equals(type)) {
			list = adminService.productListOnsaleSearch(search,cPage, numPerPage);
			totalContents = adminService.countproductListOnsaleSearch(search);
		}else if("product_manufacturer".equals(type)) {
			list = adminService.productListManufacturerSearch(search,cPage, numPerPage);
			totalContents = adminService.countproductListManufacturerSearch(search);
		}else if("category_micro".equals(type)) {
			list = adminService.productListCategorymiSearch(search,cPage, numPerPage);
			totalContents = adminService.countproductListCategorymiSearch(search);
		}
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/productList");
		return mav;
	}
	
	@RequestMapping("/admin/questionAnswer.do")
	public ModelAndView questionAnswer(ModelAndView mav
			,@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("questionAnswer메소드 실행!!");
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.questionAnswer(cPage,numPerPage);
		int totalContents = adminService.countquestionAnswer();
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/questionAnswer");
		return mav;
	}
	
	@RequestMapping("/admin/acutionStatus.do")
	public ModelAndView actionStatus(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("actionStatus메소드 실행!!");
		int numPerPage =7;
		List<Map<String, String>> list = adminService.acutionStatus(cPage, numPerPage);
		int totalContents = adminService.countauctionStatus();
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/auctionStatus");
		
		
		return mav;
	}
	
	@RequestMapping("/admin/reportList.do")
	public ModelAndView reportList(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("reportList메소드 실행!!");
		int numPerPage =7;
		List<Map<String, String>> list = adminService.reportList(cPage, numPerPage);
		int totalContents = adminService.countreportList();
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/reportList");		
		
		return mav;
	}
	
	/*
	@RequestMapping("/admin/siteStatistics.do")
	public ModelAndView siteStatistics(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("siteStatistics메소드 실행!!");
		int numPerPage =7;
		List<Map<String, String>> list = adminService.siteStatistics(cPage, numPerPage);
		int totalContents = adminService.countsiteStatistics();
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.setViewName("admin/questionAnswer");
		
		
		return mav;
	}
	*/
	
}
