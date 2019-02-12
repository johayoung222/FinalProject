package com.kh.spring.demo.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.demo.model.service.DemoService;
import com.kh.spring.demo.model.vo.Dev;

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
public class DemoController {
	
	// DI : 스프링은 Bean을 관리시에, 기본적으로 싱글턴을 처리한다.
	@Autowired
	DemoService demoService;
	
	@RequestMapping("/demo/demo.do")
	public String demo() {
		System.out.println("demo메소드가 요청되었습니다.");
		return "demo/demo";	//	/WEB-INF/views/demo/demo.jsp
	}
	
	@RequestMapping("/demo/demo1.do")
	public String demo1(HttpServletRequest request) {
		String devName = request.getParameter("devName");
		int devAge = Integer.parseInt(request.getParameter("devAge"));
		String devEmail = request.getParameter("devEmail");
		String devGender = request.getParameter("devGender");
		String[] devLang = request.getParameterValues("devLang");
		
		Dev dev = new Dev(0, devName, devAge, devEmail, devGender, devLang);
		System.out.println("dev@demo1 = "+dev);
		
		request.setAttribute("dev", dev);
		
		return "demo/demoResult";
	}
	
	@RequestMapping("/demo/demo2.do")
	public String demo2(Model model , 
						@RequestParam(value="devName" , required=true) String devName ,
						// RequestParam안에는 required라는 속성이 존재하는데, 기본적으로 true이다.
						// 만약, 주소창에서 안치고 들어가고 싶으면 false로 지정해주면 된다.
						@RequestParam(value="devAge" , defaultValue="20") int devAge ,
						// 또한, defaultValue라는 속성도 있는데, 넘어온 값이 없을 경우에 20이라고 지정한다.
						@RequestParam(value="devEmail") String devEmail ,
						@RequestParam(value="devGender") String devGender ,
						@RequestParam(value="devLang") String[] devLang ) {
		Dev dev = new Dev(0, devName, devAge, devEmail, devGender, devLang);
		System.out.println("dev@demo2 = "+dev);
		// request.setAttribute("dev", dev);
		model.addAttribute("dev" , dev);
		return "demo/demoResult";
	}
	
	@RequestMapping("/demo/demo3.do")
	public String demo3(Model model , Dev dev) {
		System.out.println("dev@demo3 = "+dev);
		model.addAttribute("dev" , dev);
		return "demo/demoResult";
	}
	
	@RequestMapping(value="/demo/insertDev.do" ,
					method=RequestMethod.POST)
					// POST만 받겠다 라는 뜻이다.
	public String insertDev(Dev dev) {
		// 업무로직
		int result = demoService.insertDev(dev);
		System.out.println(result > 0?"등록성공":"등록실패");
		return "redirect:/";
	}
	
	@RequestMapping("/demo/demoList.do")
	public String selectDemoList(Model model) {
		List<Dev> list = demoService.selectDemoList();
		model.addAttribute("list" , list);
		return "demo/demoList";
	}
	
	// @RequestMapping("/demo/updateDev.do")
	
	@RequestMapping("/demo/deleteDev.do")
	public String deleteDemo(HttpServletRequest request) {
		int no = Integer.parseInt(request.getParameter("no"));
		System.out.println(demoService.deleteDemo(no)>0?"삭제성공":"삭제실패");
		return "redirect:/demo/demoList.do";
	}
	
}
