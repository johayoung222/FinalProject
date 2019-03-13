package com.kh.spring.member.controller;

import java.io.IOException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
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

import com.google.gson.Gson;
import com.google.gson.JsonIOException;
import com.kh.spring.member.model.service.MemberService;
import com.kh.spring.member.model.vo.Member;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Controller
@SessionAttributes(value = { "memberLoggedIn" })
public class MemberController {
	Logger logger = Logger.getLogger(getClass());

	@Autowired
	MemberService memberService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@Autowired
    private JavaMailSender mailSender;

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
		if (logger.isDebugEnabled()) {
			logger.debug("회원등록페이지 요청");
		}
		return "member/memberEnroll";
	}

	@RequestMapping("/member/memberEnrollEnd.do")
	public String memberEnrollEnd(Member m, HttpServletRequest req) {
		if (logger.isDebugEnabled()) {
			logger.debug("회원등록 요청");
		}

		System.out.println("암호화전 : " + m.getMemberPassword());
		String temp = m.getMemberPassword();
		// BCrypt방식 암호화
		m.setMemberPassword(bcryptPasswordEncoder.encode(temp));
		System.out.println("암호화후 : " + m.getMemberPassword());

		logger.debug(m);
		int result = memberService.insertMember(m);

		String loc = "/member/memberMoveLogin.do";
		String msg = "";
		if (result > 0) {
			msg = "회원가입성공!";
		} else {
			msg = "회원가입실패!";
		}
		req.setAttribute("loc", loc);
		req.setAttribute("msg", msg);

		return "common/msg";
	}
	/*
	 * @RequestMapping(value="/member/memberLogin.do" , method=RequestMethod.POST)
	 * public String memberLogin(@RequestParam String memberId ,
	 * 
	 * @RequestParam String password , Model model , HttpSession session) { // 아이디를
	 * 통해서 selectOne메소드 호출결과 Member객체를 가져온다. Member m =
	 * memberService.selectOneMember(memberId); String msg = ""; String view =
	 * "common/msg"; String loc = "";
	 * 
	 * // 로그인처리 if(m == null) { msg = "아이디가 존재하지 않습니다."; loc = "/";
	 * model.addAttribute("msg" , msg); model.addAttribute("loc" , loc); } else {
	 * if(bcryptPasswordEncoder.matches(password, m.getPassword())) { // 세션 - 상태유지
	 * // session.setAttribute("", m); model.addAttribute("" , m);
	 * 
	 * view ="redirect:/"; } else { msg = "비밀번호가 틀렸습니다."; loc = "/";
	 * model.addAttribute("msg" , msg); model.addAttribute("loc" , loc); } } return
	 * view; }
	 */

	/**
	 *
	 * ModelAndView(2.0) - Model과 view단 정보를 하나의 객체에서 관리 ModelMap(2.0) : 일반클래스 -
	 * Model객체관리, view단은 문자열로 리턴 Model(2.5) : 인터페이스 - Model객체관리, view단은 문자열로 리턴
	 * 
	 * ModelAndView로 바꾸어보기
	 *
	 */

	@RequestMapping(value = "/member/memberLogin.do", method = RequestMethod.POST)
	public ModelAndView memberLogin(@RequestParam String memberId, @RequestParam String password, ModelAndView mav,
			HttpSession session) {
		if (logger.isDebugEnabled()) {
			logger.debug("회원로그인 요청");
		}

		// 아이디를 통해서 selectOne메소드 호출결과 Member객체를 가져온다.
		Member m = memberService.selectOneMember(memberId);
		logger.debug(m);
		String msg = "";
		String view = "common/msg";
		String loc = "";

		// 로그인처리
		if (m == null) {
			msg = "아이디가 존재하지 않습니다.";
			loc = "/member/memberMoveLogin.do";
			mav.addObject("msg", msg);
			mav.addObject("loc", loc);
		} else {
			if (bcryptPasswordEncoder.matches(password, m.getMemberPassword())) {
				// 세션 - 상태유지
				// session.setAttribute("", m);
				mav.addObject("memberLoggedIn", m);

				view = "redirect:/";
			} else {
				msg = "비밀번호가 틀렸습니다.";
				loc = "/member/memberMoveLogin.do";
				mav.addObject("msg", msg);
				mav.addObject("loc", loc);
			}
		}
		mav.setViewName(view);
		return mav;
	}

	@RequestMapping("/member/memberLogout.do")
	public String logout(SessionStatus sessionStatus) {
		if (logger.isDebugEnabled()) {
			logger.debug("회원로그아웃 요청");
		}

		// session.setAttribute() -> session.invalidate();
		// @SessionAttributes -> sessionStatus.setComplete()
		if (!sessionStatus.isComplete()) {
			sessionStatus.setComplete();
		}

		return "redirect:/";
	}

	@RequestMapping("/member/memberView.do")
	public String view(Model model, @RequestParam String memberId) {
		Member m = memberService.selectOneMember(memberId);
		model.addAttribute("m", m);
		return "member/memberView";
	}

	@RequestMapping("/member/memberUpdateEnd.do")
	public String memberUpdate(Model model, Member m) {
		int result = memberService.memberUpdate(m);
		System.out.println(result > 0 ? "회원정보수정성공" : "회원정보수정실패");
		return "redirect:/member/memberView.do?memberId=" + m.getMemberId();
	}
	/*
	 * @RequestMapping("/member/checkDuplicate.do") public void
	 * checkDuplicate(@RequestParam("memberId") String memberId ,
	 * HttpServletResponse response) throws IOException {
	 * logger.debug("ID중복체크 : "+memberId);
	 * 
	 * Member m = memberService.selectOneMember(memberId); boolean isUsable = m ==
	 * null?true:false;
	 * 
	 * response.getWriter().print(isUsable); }
	 */

	/**
	 * BeanNameViewResolver를 이용해 jsonView라는 뷰 클래스를 지정
	 * 
	 */
	/*
	 * @RequestMapping("/member/checkDuplicate.do") public String
	 * checkDuplicate(@RequestParam("memberId") String memberId , Model model) {
	 * logger.debug("ID중복체크 : "+memberId); Member m =
	 * memberService.selectOneMember(memberId); boolean isUsable = m ==
	 * null?true:false; model.addAttribute("isUsable" , isUsable); return
	 * "jsonView"; // BeanNameViewResolver에 의해 처리될 bean객체 이름 }
	 */

	/**
	 * @ResponseBody어노테이션을 이용하여 리턴된 객체를 jsonString으로 자동변환하여 전송
	 * 
	 */
	@RequestMapping("/member/checkDuplicate.do")
	@ResponseBody
	public Map<String, Object> checkDuplicate(@RequestParam("memberId") String memberId) {
		logger.debug("ID중복체크 : " + memberId);
		Map<String, Object> map = new HashMap<>();
		Member m = memberService.selectOneMember(memberId);
		boolean isUsable = m == null ? true : false;
		map.put("isUsable", isUsable);
		return map;
	}

	@RequestMapping("/member/memberInterest.do")
	public ModelAndView selectInterest(ModelAndView mav) {

		List<Map<String, String>> list = memberService.selectAllCategory();

		mav.addObject("category", list);
		mav.setViewName("/member/memberInterest");

		return mav;
	}

	/*
	 * 페이스북 관련: 로그인 관련
	 */
	@RequestMapping("/member/facebookLogin")
	 @ResponseBody
	public Map<String, Object> facebookLogin(@RequestParam("memberId") String memberId, 
			@RequestParam("memberName") String memberName, @RequestParam("memberEmail") String memberEmail,
			HttpSession session) {

		Map<String, Object> map = new HashMap<>();
		Member m = memberService.selectOneMember(memberId);
		boolean fbisUsable = m == null ? true : false;
		logger.debug(m);
		logger.debug(fbisUsable);
		
	       
		if(fbisUsable == true) {
			  m = new Member();
		      m.setMemberId(memberId);
		      m.setMemberName(memberName);
		      m.setMemberEmail(memberEmail);
		      int result = memberService.insertFacebookMember(m);
			  session.setAttribute("memberLoggedIn",m);
			}else {
				
				session.setAttribute("memberLoggedIn", m);
				
			}
		
	        
	      map.put("fbisUsable", fbisUsable);
	      return map;
		

	}


	/*
	 * facebook으로 시작하기
	 */
	@RequestMapping("/member/facebookEnrollEnd")
	@ResponseBody
	public ModelAndView facebookEnrollEnd(@RequestParam("fbId") String fbId, @RequestParam("fbName") String fbName,
			@RequestParam("fbBirth") String fbBirth, @RequestParam("fbEmail") String fbEmail,
			@RequestParam("fgender") String gender, ModelAndView mav) {

		Member m = new Member();
		m.setMemberId(fbId);
		m.setMemberName(fbName);
		m.setMemberBirth(fbBirth);
		m.setMemberEmail(fbEmail);
		m.setGender(gender);

		int result = memberService.insertFacebookMember(m);
		System.out.println(result > 0 ? "회원등록성공" : "회원등록실패");

		mav.addObject("result", result);
		mav.setViewName("member/memberLogin");

		return mav;

	}

	/*
	 * facebook 폼안에 있는 아이디값 중복검사!
	 */
	@RequestMapping("/member/facebookCheckDuplicate.do")
	@ResponseBody
	public Map<String, Object> facebookCheckDuplicate(@RequestParam("fbIdcheck") String fbIdcheck) {

		logger.debug("검사할 faceBookID : " + fbIdcheck);

		Map<String, Object> map = new HashMap<>();
		Member m = memberService.selectOneFBMember(fbIdcheck);
		boolean FBisUsable = m == null ? true : false;
		System.out.println("검사할건!" + FBisUsable);
		map.put("FBisUsable", FBisUsable);

		return map;

	}

	/* 카카오 관련 code */
	//카카오 로그인
	@RequestMapping("/member/kakaoLogin")
	@ResponseBody
	public Map<String, Object> kakaoLogin(@RequestParam("kakaoId") String kakaoId,
			@RequestParam("kakaoName") String kakaoName ,HttpSession session) {

	
		Member m = memberService.selectOneMember(kakaoId);
	
		Map<String, Object> map = new HashMap<>();
		
		boolean kisUsable = m == null ? true : false;
	
	       
		if(kisUsable == true) {
		  m = new Member();
	      m.setMemberId(kakaoId);
	      m.setMemberName(kakaoName);
	      int result = memberService.insertKakaoMember(m);
		
		  session.setAttribute("memberLoggedIn",m);
		}else {
			
			session.setAttribute("memberLoggedIn", m);
			
		}
		
		
	      map.put("kisUsable", kisUsable);
	      return map;

	}
	/* kakao 회원 등록하기 */
	@RequestMapping("/member/kakaoEnrollEnd")
	@ResponseBody
	public ModelAndView kakaoEnrollEnd(@RequestParam("kId") String kId, @RequestParam("kName") String kName,
			@RequestParam("kBirth") String kBirth, @RequestParam("kEmail") String kEmail,
			@RequestParam("kgender") String kgender, ModelAndView mav) {

		Member m = new Member();
		m.setMemberId(kId);
		m.setMemberName(kName);
		m.setMemberBirth(kBirth);
		m.setMemberEmail(kEmail);
		m.setGender(kgender);

		int result = memberService.insertKakaoMember(m);
		System.out.println(result > 0 ? "회원등록성공" : "회원등록실패");

		mav.addObject("result", result);
		mav.setViewName("member/memberLogin");

		return mav;

	}

	 /*
		 * kakao 폼안에 있는 아이디값 중복검사!
		 */
		@RequestMapping("/member/kakaoCheckDuplicate.do")
		@ResponseBody
		public Map<String, Object> kakaoCheckDuplicate(@RequestParam("kIdcheck") String kIdcheck) {

			logger.debug("검사할 kakaoID : " + kIdcheck);

			Map<String, Object> map = new HashMap<>();
			Member m = memberService.selectOnekakaoMember(kIdcheck);
			boolean kisUsable = m == null ? true : false;
			System.out.println("검사할건!" + kisUsable);
			map.put("kisUsable", kisUsable);
			
			return map;

		}
		
		/* 구글 관련 */
		/* 구글에서 정보 뽑아오기 */
		@RequestMapping("/member/googleLogin")
		@ResponseBody
		public Map<String, Object> googleLogin(@RequestParam("googleId") String googleId, HttpSession session) {

		
			Member m = memberService.selectOneMember(googleId);
		
			Map<String, Object> map = new HashMap<>();
			
			boolean gisUsable = m == null ? true : false;
			logger.debug(m);
			logger.debug(gisUsable);
			
		       
			if(gisUsable == false) {
				  session.setAttribute("memberLoggedIn", m);
		         //map.put("memberLoggedIn", m);
			}
			
			
		      map.put("gisUsable", gisUsable);
		      return map;

		}
		
		 
		//구글로 회원 가입하기
		 @RequestMapping("/member/googleEnrollEnd")
		public ModelAndView googleEnrollEnd(@RequestParam("gId") String gId, @RequestParam("gName") String gName,
					@RequestParam("gBirth") String gBirth, @RequestParam("gEmail") String gEmail,
					@RequestParam("ggender") String ggender, ModelAndView mav) {

				Member m = new Member();
				m.setMemberId(gId);
				m.setMemberName(gName);
				m.setMemberBirth(gBirth);
				m.setMemberEmail(gEmail);
				m.setGender(ggender);

				int result = memberService.insertgoogleMember(m);
				System.out.println(result > 0 ? "회원등록성공" : "회원등록실패");

				mav.addObject("result", result);
				mav.setViewName("member/memberLogin");

				return mav;

			}
		 
		 
		    @RequestMapping("/member/googleCheckDuplicate.do")
			@ResponseBody
			public Map<String, Object> googleCheckDuplicate(@RequestParam("gIdcheck") String gIdcheck) {

				logger.debug("검사할 건 googleID : " + gIdcheck);
				Map<String, Object> map = new HashMap<>();
				Member m = memberService.selectOnegoogleMember(gIdcheck);
				boolean gisUsable = m == null ? true : false;
				System.out.println("검사할건!" + gisUsable);
				map.put("gisUsable", gisUsable);
				return map;

			}
	
    @RequestMapping(value="/member/findAccount", method=RequestMethod.GET)
    public String moveFindPopup() {
    	return "member/findAccount";
    }
    
    //--------------------------------------------------------------------------
	/* 아이디찾기 정보있을시 메일발송 */
    @RequestMapping("/member/findid.do")
    public String findid(HttpServletRequest request,Model model) {
    	String memberEmail = request.getParameter("memberEmail");
		logger.debug("memberEmail=="+memberEmail);
		
		Member m = new Member();
		m.setMemberEmail(memberEmail);
		
		int countId = memberService.countmemberId(m);
		int certified = ((int) (Math.random() * 899999)+100000);
		
		
		if(countId > 0) {
			String setfrom = "7sscheduler@gmail.com";         
		    String tomail  = memberEmail;     // 받는 사람 이메일
		    String title   = "Get!t 인증번호 입니다!";      // 제목
		    String content = "인증번호는 ["+certified+"] 입니다 :)";    // 내용
		   
		    try {
		      MimeMessage message = mailSender.createMimeMessage();
		      MimeMessageHelper messageHelper 
		                        = new MimeMessageHelper(message, true, "UTF-8");
		 
		      messageHelper.setFrom(setfrom);  // 보내는사람 생략하거나 하면 정상작동을 안함
		      messageHelper.setTo(tomail);     // 받는사람 이메일
		      messageHelper.setSubject(title); // 메일제목은 생략이 가능하다
		      messageHelper.setText(content);  // 메일 내용
		     
		      mailSender.send(message);
		    } catch(Exception e){
		      System.out.println(e);
		    }
		}
		
		model.addAttribute("countId",countId);
		model.addAttribute("memberEmail",memberEmail);
		model.addAttribute("certified",certified);
		return "member/findAccount";
    }

	/* 아이디 가져오기 */
    @RequestMapping("/member/searchId.do")
    @ResponseBody
    public Map<String, Object> searchid(HttpServletRequest request) {
    	String memberEmail = request.getParameter("memberEmail");
		logger.debug("memberEmail=="+memberEmail);
		String memberId = null;
		Map<String, Object> map = new HashMap<>();
		memberId= memberService.selectmemberId(memberEmail);
		logger.debug("mm=="+memberId);
		
		map.put("memberId",memberId);
    	
		return map;
    }
	
	/* 비밀번호찾기 */
	@RequestMapping("/member/findpwd.do")
    public String findpwd(HttpServletRequest request,Model model) {
    	String memberPhone = request.getParameter("memberPhone");
    	String memberId = request.getParameter("memberId");
		logger.debug("memberPhone=="+memberPhone);
		logger.debug("memberId=="+memberId);
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPhone(memberPhone);
		int count = memberService.countmember(m);
		int certified = ((int) (Math.random() * 899999)+100000);
		
		if(count > 0) {
			String api_key = "NCSFQJJ9HCHO2HEE";
			String api_secret = "TMVG7ETX4WMP6I1OI4XPMFSCZJBOO0FK";
			Message coolsms = new Message(api_key, api_secret);
			
			
			HashMap<String, String> set = new HashMap<String, String>();
			
			
			
			 set.put("to", memberPhone); // 수신번호 
			 set.put("from", "01090294425"); // 발신번호
			 set.put("text", "인증번호 ["+certified+"]입니다 :) "); // 문자내용
			 set.put("type","sms"); // 문자 타입 
			 set.put("app_version", "test app 1.2"); //application nameand version
			
			
			System.out.println(set);
			
			try {
				JSONObject result = (JSONObject) coolsms.send(set);
				System.out.println(result.toString());
			} catch (CoolsmsException e) {
				System.out.println(e.getMessage());
				System.out.println(e.getCode());
			}
		}
		
		
	
		model.addAttribute("count",count);
		model.addAttribute("memberPhone",memberPhone);
		model.addAttribute("memberId",memberId);
		model.addAttribute("certified",certified);
    	
		return "member/findAccount";
    }
	
	@RequestMapping("/member/certified.do")
	public String certified() {
		return "member/findAccount";
	}

	/* 비밀번호 찾기후 비밀번호변경 */
	@RequestMapping("/member/updatePwd.do")
	public String updatePwd(HttpServletRequest request,Model model) {
		String memberId = request.getParameter("memberId");
		String memberPassword = request.getParameter("pwd");
		
		Member m = new Member();
		m.setMemberId(memberId);
		m.setMemberPassword(bcryptPasswordEncoder.encode(memberPassword));
		
		int result = memberService.updatePwd(m);
		
		
		return "member/findAccount";
	}
	
	@RequestMapping("/member/memberItrUpdate")
	public void interestUpdate(@RequestParam(value="memberNo") String memberNo,@RequestParam(value="interest") String interest,
							HttpServletResponse response) throws JsonIOException, IOException {
		
		logger.debug(interest+"/"+memberNo);
		
		Map<String,String> map = new HashMap<>();
		map.put("memberNo",memberNo);
		map.put("interest",interest);
		
		int result = memberService.updateItr(map);
		
		response.setContentType("application/json; charset=UTF-8");
		new Gson().toJson(result,response.getWriter());
	}

	
}