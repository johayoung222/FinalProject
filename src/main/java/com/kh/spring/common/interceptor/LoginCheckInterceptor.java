package com.kh.spring.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.kh.spring.member.model.vo.Member;

/**
 * 
 * 로그인하지않고, /member/memberView.do?memberId=admin
 * 			   /member/memberUpdate.do를 요청시 로그인여부를 검사하고,
 * 로그인하지 않았다면, common/msg.jsp 에서 경고메시지를 출력
 * "로그인후에 이용하세요"
 *
 */
public class LoginCheckInterceptor extends HandlerInterceptorAdapter {

	Logger logger = Logger.getLogger(getClass());
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		HttpSession session = request.getSession();
		Member memberLoggedIn = (Member)session.getAttribute("memberLoggedIn");
		if(logger.isDebugEnabled()) { 
			if(memberLoggedIn == null) {
				request.setAttribute("loc", "/");
				request.setAttribute("msg", "로그인후에 이용하세요");
				request.getRequestDispatcher("/WEB-INF/views/common/msg.jsp").forward(request, response);					
				return false;
			}
			
		}
		
		return super.preHandle(request, response, handler);
		
	}	
}
