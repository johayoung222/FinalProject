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
import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
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
	
	//관리자 페이지
	@RequestMapping("/admin/adminView.do")
	public String adminView() {
		logger.debug("adminView메소드가 요청되었습니다.");
		return "admin/adminView";	//	/WEB-INF/views/admin/adminView.jsp
	}
	
	//회원리스트 조회
	@RequestMapping("/admin/allMember.do")
	public ModelAndView allMember(@RequestParam(value="cPage" , defaultValue="1") int cPage ,
			ModelAndView mav) {
		logger.debug("allMember메소드 실행!!");
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.allMember(cPage , numPerPage);
		int totalContents = adminService.countallMember();
		String view = "allMember.do";
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/allMember");
		
		return mav;
	}
	
	@RequestMapping("/admin/memberSearch.do")
	public ModelAndView memberSearch(ModelAndView mav, 
			@RequestParam(value="type")String type, 
			@RequestParam(value="search")String search,
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		logger.debug("memeberSearch메소드가 요청되었습니다.");
		String view = "memberSearch.do";
		int numPerPage= 7;
		Map<String, String> map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		logger.debug(map);
		List<Map<String,String>> list = adminService.memberSearch(cPage,numPerPage,map);
		int totalContents = adminService.countmemberSearch(map);
		
		mav.addObject("cPage",cPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("type",type);
		mav.addObject("search",search);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/allMember");
		return mav;
	}
	
	@RequestMapping("/admin/memberPage.do")
	public ModelAndView memberPage(ModelAndView mav
			,@RequestParam(value="memberId")String memberId) {
		logger.debug("memberPage 메소드 실행!!");
		mav.addObject("memberId",memberId);
		mav.setViewName("admin/memberPage");
		return mav;
	}
	
	@RequestMapping(value="/admin/memberOne.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> memberOne(@RequestParam(value="memberId")String memberId){
		List<Map<String,Object>> list = adminService.memberOne(memberId);
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/couponAll.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> couponAll(){
		logger.debug("couponAll메소드 실행!!");
		List<Map<String, Object>> list = adminService.couponAll(); 
		logger.debug(list);
		return list;
	}
	
	@RequestMapping("/admin/couponAutoDelete")
	@ResponseBody
	public int couponAutoDelete() {
		logger.debug("couponAutoDelete메소드 실행!!");
		int result = adminService.couponAutoDelete();
		return result;
	}
	
	@RequestMapping(value="/admin/updateisAdmin.do",method=RequestMethod.GET)
	@ResponseBody
	public int updateisAdmin(@RequestParam(value="isAdmin")String isAdmin,
			@RequestParam(value="memberId")String memberId) {
		logger.debug("updateisAdmin메소드 실행!!");
		Map<String,Object> map = new HashMap<>();
		map.put("isAdmin",isAdmin);
		map.put("memberId",memberId);
		int result = adminService.updateisAdmin(map);
		return result;
		
	}
	
	@RequestMapping(value="/admin/couponPlus.do",method=RequestMethod.GET)
	@ResponseBody
	public int couponPlus(@RequestParam(value="memberNo")int memberNo,
			@RequestParam(value="couponNo")int couponNo) {
		int result = 0;
		logger.debug("couponPlus메소드 실행!!");
		Map<String, Object> map = new HashMap<>();
		map.put("memberNo",memberNo);
		map.put("couponNo",couponNo);
		logger.debug(map);
		result = adminService.couponPlus(map);
		return result;
	}
	
	@RequestMapping(value="/admin/couponList.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String,Object>> couponList(@RequestParam(value="memberNo")int memberNo){
		logger.debug("couponList메소드 실행!!");
		logger.debug(memberNo);
		
		List<Map<String, Object>> list = adminService.couponList(memberNo);
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/deleteCoupon.do",method=RequestMethod.GET)
	@ResponseBody
	public int deleteCoupon(@RequestParam(value="seqcouponNo")int seqcouponNo,
			@RequestParam(value="memberNo")int memberNo) {
		int result = 0;
		//logger.debug("deleteCoupon메소드 실행!!");
		//logger.debug(seqcouponNo+","+memberNo);
		Map<String, Object> map = new HashMap<>();
		map.put("seqcouponNo",seqcouponNo);
		map.put("memberNo",memberNo);
		
		result = adminService.deleteCoupon(map);
		
		
		return result;
	}
	
	//결제된 상품 리스트
	@RequestMapping("/admin/paidProduct.do")
	public ModelAndView paidProduct(ModelAndView mav, @RequestParam(value="cPage", defaultValue="1")int cPage) {
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.paidProduct(cPage, numPerPage);
		int totalContents = adminService.countpaidProduct();
		String view = "paidProduct.do";
		int flag = 0;
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.addObject("flag",flag);
		mav.setViewName("admin/paidProduct");
				
		return mav;
	}
	
	@RequestMapping("/admin/paidAuction.do")
	public ModelAndView paidAuction(ModelAndView mav, @RequestParam(value="cPage", defaultValue="1")int cPage) {
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.paidAuction(cPage, numPerPage);
		int totalContents = adminService.countpaidAuction();
		String view = "paidProduct.do";
		int flag =1;
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.addObject("flag",flag);
		mav.setViewName("admin/paidProduct");
				
		return mav;
	}
	
	@RequestMapping("/admin/paidProductSearch.do")
	@ResponseBody
	public ModelAndView paidProductSearch(ModelAndView mav,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		logger.debug("paidProductSearch메소드 실행!!");
		String view = "paidProductSearch.do";
		Map<String,String> map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		int flag=0;
		
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.paidProductSearch(cPage,numPerPage,map);
		int totalContents = adminService.countpaidProductSearch(map);
		logger.debug(list);
		mav.addObject("cPage",cPage);
		mav.addObject("type",type);
		mav.addObject("search",search);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("list",list);
		mav.addObject("flag",flag);
		mav.addObject("view",view);
		mav.setViewName("admin/paidProduct");
		
		return mav;
	}
	
	@RequestMapping("/admin/paidAuctionSearch.do")
	@ResponseBody
	public ModelAndView paidAuctionSearch(ModelAndView mav,
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		logger.debug("paidAuctionSearch메소드 실행!!");
		String view = "paidAuctionSearch.do";
		Map<String,String> map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		int flag =1;
		
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.paidAuctionSearch(cPage,numPerPage,map);
		int totalContents = adminService.countpaidAuctionSearch(map);
		logger.debug(list);
		mav.addObject("cPage",cPage);
		mav.addObject("type",type);
		mav.addObject("search",search);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.addObject("flag",flag);
		mav.setViewName("admin/paidProduct");
		
		return mav;
	}
		
		
	//판매 신청 리스트
	@RequestMapping("/admin/registList.do")
	public ModelAndView registList(ModelAndView mav,
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		logger.debug("registList메소드 실행!!");
		String view = "registList.do";
		
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.registList(cPage,numPerPage);
		int totalContents = adminService.countpaidregistList();
		logger.debug(list);
		
		mav.addObject("cPage",cPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/regist");
		return mav;
	}
	
	@RequestMapping("/admin/registListMore.do")
	public ModelAndView registListt(ModelAndView mav,
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		logger.debug("registListt메소드 실행!!");
		String view = "registListMore.do";
		
		int numPerPage = 7;
		List<Map<String, String>> list = adminService.registListMore(cPage,numPerPage);
		int totalContents = adminService.countpaidregistListMore();
		logger.debug(list);
		
		mav.addObject("cPage",cPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/regist");
		return mav;
	}
	
	/*
	@RequestMapping(value="/admin/regist.do")
	@ResponseBody
	public List<Map<String, Object>> regist() {
		//logger.debug("regist메소드 실행!!");
		List<Map<String, Object>> list = adminService.regist();
		//logger.debug(list);
		return list;
	}*/
	
	@RequestMapping("/admin/category.do")
	public ModelAndView category(ModelAndView mav 
			,@RequestParam(value="registNo")int registNo) {
		logger.debug(registNo);
		
		mav.addObject("registNo",registNo);
		mav.setViewName("admin/category");
		return mav;
	} 
	
	@RequestMapping("/admin/categoryMa.do")
	@ResponseBody
	public List<CategoryMacro> categoryMa() {
		List<CategoryMacro> list = adminService.categoryMa();
		return list;
	} 
	
	@RequestMapping(value="/admin/categoryMi.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Category> categoryMi(@RequestParam(value="macro")String macro) {
		List<Category> list = adminService.categoryMi(macro);
		return list;
	} 
	
	@RequestMapping(value="/admin/registOne.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> registOne(@RequestParam(value="registNo")int registNo) {
		logger.debug("registOne메소드 실행");
		List<Map<String, Object>> list = adminService.registOne(registNo);
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/inProduct.do", method=RequestMethod.GET)
	@ResponseBody
	public int insertP(@RequestParam(value="registNo")int registNo,
			@RequestParam(value="cMa")String cMa,
			@RequestParam(value="cMi")String cMi,
			@RequestParam(value="registManufacturer")String registManufacturer,
			@RequestParam(value="registAdminDescription")String registAdminDescription) {
		
		Regist regist = adminService.registOne1(registNo);
		Map<String, Object> map = new HashMap<>();

		map.put("seqRegistNo",regist.getSeqRegistNo());
		map.put("registName",regist.getRegistName());
		map.put("registPrice",regist.getRegistPrice());
		map.put("regitstAuction","Y");
		map.put("registImage",regist.getRegistImage());
		map.put("registRealImage",regist.getRegistRealImage());
		map.put("registAmount",regist.getRegistAmount());
		map.put("registDescription",regist.getRegistDescription());
		map.put("seqMemberNo",regist.getSeqMemberNo());
		map.put("registKinds",regist.getRegistKinds());
		map.put("registStatus",regist.getRegistStatus());
		map.put("registManufacturer",registManufacturer);
		map.put("cMi",cMi);
		map.put("cMa",cMa);
		map.put("registAdminDescription",registAdminDescription);
				
		int result = adminService.insertProduct(map);
		if(result ==1) {
			adminService.updateRegist(registNo);
		}
		return result;
	}
	
	@RequestMapping(value="/admin/registAuction.do",method=RequestMethod.GET)
	@ResponseBody
	public int registAuction(@RequestParam(value="registNo")int registNo) {
		logger.debug("registAuction메소드 실행!!");
		int result = adminService.registAuction(registNo);
		return result;
	}
	
	
	
	//판매 상품 리스트
	@RequestMapping("/admin/productList.do")
	public ModelAndView productList(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("productList메소드 실행!!");
		String view = "productList.do";
		int numPerPage =7;
		List<Map<String, String>> list = adminService.productList(cPage, numPerPage);
		int totalContents = adminService.countproductList();
		
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/productList");
		return mav;
	}
	
	
	@RequestMapping("/admin/productListSearch.do")
	public ModelAndView productListSearch(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		logger.debug("productListSearch메소드 실행!!");
		String view = "productListSearch.do";
		int numPerPage =7;
		Map<String, String>map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		List<Map<String, String>> list =adminService.productListSearch(cPage,numPerPage,map);
		int totalContents = adminService.countproductListSearch(map);
		
		mav.addObject("cPage",cPage);
		mav.addObject("type",type);
		mav.addObject("search",search);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/productList");
		return mav;
	}
	
	//경매신청 리스트
	@RequestMapping("/admin/auctionRegist.do")
	public ModelAndView auctionList(ModelAndView mav) {
		mav.setViewName("admin/auctionRegist");
		return mav;
	}
	
	@RequestMapping("/admin/auctionRegistList.do")
	@ResponseBody
	public List<Map<String, Object>> auctionRegistList(){
		logger.debug("auctionRegistList메소드 실행!!");
		List<Map<String, Object>> list = adminService.auctionRegistList();
		logger.debug(list);
		return list;
	}
	
	@RequestMapping("/admin/auctionCategory.do")
	public ModelAndView auctionCategory(ModelAndView mav,
			@RequestParam(value="auctionRegistNo")int auctionRegistNo) {
		logger.debug("auctionCategory메소드 실행!!");
		mav.addObject("auctionRegistNo",auctionRegistNo);
		logger.debug(auctionRegistNo);
		
		mav.setViewName("admin/auctionCategory");
		return mav;
	}
	
	@RequestMapping(value="/admin/auctionRegistOne.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> auctionRegistOne(@RequestParam(value="auctionRegistNo")int auctionRegistNo){
		logger.debug("auctionRegistOne메소드 실행!!");
		List<Map<String, Object>> list = adminService.auctionRegistOne(auctionRegistNo);
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/inAuction.do",method=RequestMethod.GET)
	@ResponseBody
	public int inAuction(@RequestParam(value="auctionRegistNo")int auctionRegistNo,
			@RequestParam(value="cMa")String cMa,
			@RequestParam(value="cMi")String cMi) {
		logger.debug("inAuction 메소드 실행!!");
		Map<String, Object> map = new HashMap<>();
		map.put("auctionCategoryMacro",cMa);
		map.put("auctionCategoryMicro",cMi);
		
		Auction auction = adminService.auctionRegistOne1(auctionRegistNo);
		map.put("seqMemberNo",auction.getSeqMemberNo());
		String sdate = auction.getSdate()+":00";
		map.put("sdate",sdate);
		String edate = auction.getEdate()+":00";
		map.put("edate",edate);
		
		map.put("auctionTitle",auction.getAuctionTitle());
		map.put("auctionImageMain",auction.getAuctionImageMain());
		map.put("auctionImageSub1",auction.getAuctionImageSub1());
		map.put("auctionImageSub2",auction.getAuctionImageSub2());
		map.put("auctionImageSub3",auction.getAuctionImageSub3());
		map.put("auctionPrice",auction.getAuctionPrice());
		map.put("auctionStatus",auction.getAuctionStatus());
		map.put("auctionMember",auction.getAuctionMember());
		map.put("auctionPhone",auction.getAuctionPhone());
		map.put("auctiondetail",auction.getAuctiondetail());
		
		int result = adminService.inAuction(map);
		int result2 =0;
		if(result == 1 ) {
			result2 =adminService.updateAuctionRegist(auctionRegistNo);
		}
		logger.debug(result2);
		return result;
		
	}
	
	@RequestMapping(value="/admin/auctionCencel.do", method=RequestMethod.GET)
	@ResponseBody
	public int auctionCencel(@RequestParam(value="auctionRegistNo")int auctionRegistNo) {
		logger.debug("auctionCencel메소드 실행!!");
		int result = adminService.auctionCencel(auctionRegistNo);
		return result;
	}
	
		
	
	//경매 상품 현황
	@RequestMapping("/admin/auctionList.do")
	public ModelAndView auctionList(ModelAndView mav,
			@RequestParam(value="cPage", defaultValue="1")int cPage) {
		logger.debug("auctionList메소드 실행!!");
		String view = "auctionList.do";
		int numPerPage =7;
		List<Map<String, String>> list = adminService.auctionList(cPage, numPerPage);
		int totalContents = adminService.countauctionList();
		logger.debug(list+","+totalContents);
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/auctionList");
		return mav;
	}
	
	
	@RequestMapping("/admin/auctionListSearch.do")
	public ModelAndView auctionListSearch(ModelAndView mav, 
			@RequestParam(value="cPage", defaultValue="1")int cPage,
			@RequestParam(value="type")String type,
			@RequestParam(value="search")String search) {
		logger.debug("auctionListSearch메소드 실행!!");
		logger.debug(type+","+search);
		String view = "auctionListSearch.do";
		int numPerPage =7;
		Map<String, String>map = new HashMap<>();
		map.put("type",type);
		map.put("search",search);
		List<Map<String, String>> list =adminService.auctionListSearch(cPage,numPerPage,map);
		int totalContents = adminService.countauctionListSearch(map);
		
		mav.addObject("cPage",cPage);
		mav.addObject("type",type);
		mav.addObject("search",search);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/auctionList");
		return mav;
	}
	
	
	//1:1질문 답변
	@RequestMapping("/admin/questionAnswer.do")
	public ModelAndView questionAnswer(ModelAndView mav
			,@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("questionAnswer메소드 실행!!");
		int numPerPage = 7;
		String view = "questionAnswer.do";
		List<Map<String, String>> list = adminService.questionAnswer(cPage,numPerPage);
		int totalContents = adminService.countquestionAnswer();
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.addObject("view",view);
		mav.setViewName("admin/questionAnswer");
		return mav;
	}
	
	@RequestMapping("/admin/questionAnswerY.do")
	public ModelAndView questionAnswerY(ModelAndView mav
			,@RequestParam(value="cPage", defaultValue="1")int cPage) {
		System.out.println("questionAnswer메소드 실행!!");
		int numPerPage = 7;
		String view = "questionAnswerY.do";
		List<Map<String, String>> list = adminService.questionAnswerY(cPage,numPerPage);
		int totalContents = adminService.countquestionAnswer();
		mav.addObject("cPage",cPage);
		mav.addObject("numPerPage",numPerPage);
		mav.addObject("totalContents",totalContents);
		mav.addObject("list",list);
		mav.addObject("view",view);
		
		mav.setViewName("admin/questionAnswer");
		return mav;
	}
	
	
	
	
	//사이트 통계
	@RequestMapping("/admin/siteStatistics.do")
	public ModelAndView siteStatistics(ModelAndView mav) {
		logger.debug("siteStatistics메소드 실행!!");
		mav.setViewName("admin/siteStatistics");
		return mav;
	}
	
	@RequestMapping("/admin/memberGender.do")
	@ResponseBody
	public List<Map<String,Object>> memberGender(){
		logger.debug("memberGender 메소드 실행!!");
		List<Map<String, Object>> list = adminService.memberGender();
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/paidProductCategory.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> paidProductCategory(){
		logger.debug("paidProductCategory메소드 실행!!");
		List<Map<String, Object>> list = adminService.paidProductCategory();
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/registCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> registCategory(){
		logger.debug("registCategory메소드 실행!!");
		List<Map<String, Object>> list = adminService.registCategory();
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/siteAuctionCategory.do", method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> auctionCategory(){
		logger.debug("auctionCategory메소드 실행!!");
		List<Map<String, Object>> list = adminService.auctionCategory();
		logger.debug(list);
		return list;
	}
	
	@RequestMapping(value="/admin/questionCategory.do",method=RequestMethod.GET)
	@ResponseBody
	public List<Map<String, Object>> questionCategory(){
		logger.debug("questionCategory메소드 실행!!");
		List<Map<String, Object>> list = adminService.questionCategory();
		logger.debug(list);
		return list;
		
	}
	

	
	
	
	
}
