package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

@Controller
@SessionAttributes(value = {"memberLoggedIn"})
public class MemberController {
	Logger logger = Logger.getLogger(getClass());

	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/member/memberMoveLogin.do")
	public String memberLogin() {
		
		return "member/memberLogin";
	}
	/**
	 * 
	 * 회원가입 요청이 들어왔을 시 처리
	 */
	@RequestMapping("/member/memberEnroll.do")
	public String memberEnroll() {
		// logger가 Debug모드라면 실행해라 !
		// 효율적으로 사용하기 위한 조건문이다.
		if(logger.isDebugEnabled()) {
			logger.debug("회원등록페이지 요청");			
		}
		return "member/memberEnroll";
	}
	
	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m , HttpServletRequest req) {
		if(logger.isDebugEnabled()) {
			logger.debug("회원등록 요청");			
		}

		System.out.println("암호화전 : "+m.getMemberPassword());
		String temp = m.getMemberPassword();
		// BCrypt방식 암호화
		m.setMemberPassword(bcryptPasswordEncoder.encode(temp));
		System.out.println("암호화후 : "+m.getMemberPassword());
		
		int result = memberService.insertMember(m);
		System.out.println(result > 0?"회원등록성공":"회원등록실패");
		
		String loc = "/";
		String msg ="";
		if(result > 0) {
			msg = "회원가입성공!";
		} else {
			msg = "회원가입실패!";			
		}
		req.setAttribute("loc", loc);
		req.setAttribute("msg", msg);
		
		return "common/msg";
	}
	/*
	@RequestMapping(value="/member/memberLogin.do" , method=RequestMethod.POST)
	public String memberLogin(@RequestParam String memberId , 
							  @RequestParam String password , 
							  Model model ,
							  HttpSession session) {
		// 아이디를 통해서 selectOne메소드 호출결과 Member객체를 가져온다.
		Member m = memberService.selectOneMember(memberId);
		String msg = "";
		String view = "common/msg";
		String loc = "";
		
		// 로그인처리
		if(m == null) {
			msg = "아이디가 존재하지 않습니다.";
			loc = "/";
			model.addAttribute("msg" , msg);
			model.addAttribute("loc" , loc);
		} else {
			if(bcryptPasswordEncoder.matches(password, m.getPassword())) {
				// 세션 - 상태유지
				// session.setAttribute("", m);
				model.addAttribute("" , m);
				
				view ="redirect:/";
			} else {
				msg = "비밀번호가 틀렸습니다.";
				loc = "/";
				model.addAttribute("msg" , msg);
				model.addAttribute("loc" , loc);
			}
		}
		return view;
	}
	*/
	
	/**
	 *
	 * ModelAndView(2.0)
	 *  - Model과 view단 정보를 하나의 객체에서 관리
	 * ModelMap(2.0) : 일반클래스
	 *  - Model객체관리, view단은 문자열로 리턴
	 * Model(2.5) : 인터페이스
	 *  - Model객체관리, view단은 문자열로 리턴
	 *  
	 *  ModelAndView로 바꾸어보기
	 *
	 */
	
	@RequestMapping(value="/member/memberLogin.do" , method=RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String memberId , 
							  @RequestParam String password , 
							  ModelAndView mav ,
							  HttpSession session) {
		if(logger.isDebugEnabled()) {
			logger.debug("회원로그인 요청");			
		}

		// 아이디를 통해서 selectOne메소드 호출결과 Member객체를 가져온다.
		Member m = memberService.selectOneMember(memberId);
		logger.debug(m);
		String msg = "";
		String view = "common/msg";
		String loc = "";
		
		// 로그인처리
		if(m == null) {
			msg = "아이디가 존재하지 않습니다.";
			loc = "/member/memberMoveLogin.do";
			mav.addObject("msg" , msg);
			mav.addObject("loc" , loc);
		} else {
			if(bcryptPasswordEncoder.matches(password, m.getMemberPassword())) {
				// 세션 - 상태유지
				// session.setAttribute("", m);
				mav.addObject("memberLoggedIn" , m);
				
				view ="redirect:/";
			} else {
				msg = "비밀번호가 틀렸습니다.";
				loc = "/member/memberMoveLogin.do";
				mav.addObject("msg" , msg);
				mav.addObject("loc" , loc);
			}
		}
		mav.setViewName(view);
		return mav;
	}
	
	@RequestMapping("/member/memberLogout.do")
	public String logout(SessionStatus sessionStatus) {
		if(logger.isDebugEnabled()) {
			logger.debug("회원로그아웃 요청");			
		}

		// session.setAttribute() -> session.invalidate();
		// @SessionAttributes -> sessionStatus.setComplete()
		if(!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}
		
		return "redirect:/";
	}
	
	@RequestMapping("/member/memberView.do")
	public String view(Model model , @RequestParam String memberId) {
		Member m = memberService.selectOneMember(memberId);
		model.addAttribute("m" , m);
		return "member/memberView";
	}
	
	@RequestMapping("/member/memberUpdateEnd.do")			
	public String memberUpdate(Model model , Member m) {
		int result = memberService.memberUpdate(m);
		System.out.println(result > 0?"회원정보수정성공":"회원정보수정실패");
		return "redirect:/member/memberView.do?memberId="+m.getMemberId();
	}
	/*
	@RequestMapping("/member/checkDuplicate.do")
	public void checkDuplicate(@RequestParam("memberId") String memberId , HttpServletResponse response) throws IOException {
		logger.debug("ID중복체크 : "+memberId);
		
		Member m = memberService.selectOneMember(memberId);
		boolean isUsable = m == null?true:false;
		
		response.getWriter().print(isUsable);
	}
	*/
	
	/**
	 * BeanNameViewResolver를 이용해 jsonView라는 뷰 클래스를 지정
	 * 
	 */
	/*
	 @RequestMapping("/member/checkDuplicate.do") public String
	 checkDuplicate(@RequestParam("memberId") String memberId , Model model) {
	 	logger.debug("ID중복체크 : "+memberId); Member m =
	 	memberService.selectOneMember(memberId); boolean isUsable = m ==
	 	null?true:false; model.addAttribute("isUsable" , isUsable);
	 	return "jsonView"; // BeanNameViewResolver에 의해 처리될 bean객체 이름 
	 }
	 */	
	
	/**
	 * @ResponseBody어노테이션을 이용하여 리턴된 객체를 jsonString으로 자동변환하여 전송
	 * 
	 */
	@RequestMapping("/member/checkDuplicate.do")
	@ResponseBody
	public Map<String , Object> checkDuplicate(@RequestParam("memberId") String memberId) {
		logger.debug("ID중복체크 : "+memberId);
		Map<String , Object> map = new HashMap<>();
		Member m = memberService.selectOneMember(memberId);
		boolean isUsable = m == null?true:false;
		map.put("isUsable", isUsable);
		return map;
	}
	
	@RequestMapping("/member/memberInterest.do")
	public ModelAndView selectInterest(ModelAndView mav) {
		
		List<Map<String,String>> list = memberService.selectAllCategory();
		
		mav.addObject("category",list);
		mav.setViewName("/member/memberInterest");
		
		return mav;
	}
	
}
