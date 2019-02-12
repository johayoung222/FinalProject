package com.kh.spring;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/**
 * Spring Framework의 특징
 * 	- IOC Inversion Of Control 제어의 역전
 * 	- DI Dependency Injection 의존 주입
 * 		ex) MemberService memberService = new MemberService(); 이런게 필요없다.
 *	- AOP Aspect Oriented Programming 관점지향 프로그래밍
 *	- POJO Plain Old Java Object <-> ejb(기업용 프레임워크)
 *		상대적으로 쉽게 사용한다는 의미에서 POJO
 *	- PSA Portable Service Abstraction 추상화된 제어
 *
 *	이러한 5가지 특징이 존재한다.
 * 
 */
@Controller
public class HomeController {
	
	private static final Logger logger = LoggerFactory.getLogger(HomeController.class);
	
	/**
	 * Simply selects the home view to render by returning its name.
	 */
	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		logger.info("Welcome home! The client locale is {}.", locale);
		
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		
		String formattedDate = dateFormat.format(date);
		
		model.addAttribute("serverTime", formattedDate );
		
		return "home";
	}
	
}
