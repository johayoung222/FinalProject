package com.kh.spring.admin.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.admin.model.service.AdminService;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.ProductIo;
import com.kh.spring.thing.model.vo.Regist;


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
	public List<Member> memberSearch(ModelAndView mav, 
			@RequestParam(value="type")String type, 
			@RequestParam(value="search")String search,
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("memeberSearch메소드가 요청되었습니다.");
		int numPerPage= 7;
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		
		List<Member> list = null;
		
		return list;
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
	@ResponseBody
	public List<ProductIo> paidProductSearch(
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		logger.debug("paidProductSearch메소드 실행!!");
		
		Map<String,String> map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		int totalContents = adminService.countpaidProductSearch2(map);
		
		int numPerPage = 7;
		List<ProductIo> list = adminService.paidProductSearch(cPage,numPerPage,map);
		return list;
	}
	
	@RequestMapping("/admin/registList.do")
	public ModelAndView registList(ModelAndView mav) {
		mav.setViewName("admin/regist");
		return mav;
	}
	
	
	@RequestMapping(value="/admin/regist.do")
	@ResponseBody
	public List<Map<String, Object>> regist() {
		System.out.println("regist메소드 실행!!");
		int cPage = 1;
		int numPerPage = 7;
		List<Map<String, Object>> list = adminService.regist(cPage, numPerPage);
				
		return list;
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
	
	@RequestMapping("/admin/category.do")
	public ModelAndView category(ModelAndView mav 
			,@RequestParam(value="registNo")int registNo) {
		System.out.println("category메소드 실행!!");
		logger.debug(registNo);
		
		mav.addObject("registNo",registNo);
		mav.setViewName("admin/category");
		return mav;
	} 
	
	@RequestMapping("/admin/categoryMa.do")
	@ResponseBody
	public List<CategoryMacro> categoryMa() {
		System.out.println("categoryMa메소드 실행!!!!");
		
		List<CategoryMacro> list = adminService.categoryMa();
		//System.out.println(list);
		
		return list;
	} 
	
	@RequestMapping(value="/admin/categoryMi.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Category> categoryMi(@RequestParam(value="macro")String macro) {
		System.out.println("categoryMi메소드 실행!!!!");
		//System.out.println(macro);
		List<Category> list = adminService.categoryMi(macro);
		
		return list;
	} 
	
	@RequestMapping(value="/admin/registOne.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> registOne(@RequestParam(value="registNo")int registNo) {
		System.out.println("registOne메소드 실행!!");
		//System.out.println("ServiceImpl registNo:"+registNo);
		List<Map<String, Object>> list = adminService.registOne(registNo);
		return list;
		
	}
	
	@RequestMapping(value="/admin/inProduct.do", method=RequestMethod.GET)
	@ResponseBody
	public int insertP(@RequestParam(value="registNo")int registNo,
			@RequestParam(value="cMa")String cMa,
			@RequestParam(value="cMi")String cMi,
			@RequestParam(value="registManufacturer")String registManufacturer) {
		
		System.out.println("insertP 메소드 실행!!!!!!!!!!!!!!!!!!!!!");
		Regist regist = adminService.registOne1(registNo);
		Map<String, Object> map = new HashMap<>();

		map.put("seqRegistNo",regist.getSeqRegistNo());
		map.put("registName",regist.getRegistName());
		map.put("registPrice",regist.getRegistPrice());
		//map.put("regitstAuction",regist.getRegitstAuction());
		map.put("registManufacturer",registManufacturer);
		map.put("registAmount",regist.getRegistAmount());
		map.put("registImage",regist.getRegistImage());
		map.put("registRealImage",regist.getRegistRealImage());
		map.put("registDescription",regist.getRegistDescription());
		map.put("registDate",regist.getRegistDate());
		//map.put("registKinds",regist.getReigstKinds());
		map.put("cMi",cMi);
		map.put("cMa",cMa);
		System.out.println("insertP map :"+map);
				
		int result = adminService.insertProduct(map);
		
		if(result ==1) {
			adminService.updateRegist(registNo);
		}
		return result;
	}

	
	
	
	
}
