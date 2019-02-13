package com.kh.spring.admin.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

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
	
	@RequestMapping("/admin/memberFind.do")
	public ModelAndView memberFind(ModelAndView mav, @RequestParam String type
			,@RequestParam(value="search")String search) {
		
		
		return mav;
	}
	
}
