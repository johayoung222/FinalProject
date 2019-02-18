package com.kh.spring.member.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.social.MissingAuthorizationException;
import org.springframework.social.connect.Connection;
import org.springframework.social.facebook.api.Facebook;
import org.springframework.social.facebook.api.User;
import org.springframework.social.facebook.api.UserOperations;
import org.springframework.social.facebook.api.impl.FacebookTemplate;
import org.springframework.social.facebook.connect.FacebookConnectionFactory;
import org.springframework.social.oauth2.AccessGrant;
import org.springframework.social.oauth2.GrantType;
import org.springframework.social.oauth2.OAuth2Operations;
import org.springframework.social.oauth2.OAuth2Parameters;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.vo.Member;

public class FacebookController {
	Logger logger = Logger.getLogger(getClass());

	// 페이스북 oAuth 관련
    @Autowired
    private FacebookConnectionFactory connectionFactory;
    @Autowired
    private OAuth2Parameters oAuth2Parameters;
 
//   뷰로 매핑
	/*
	 * @RequestMapping(value = "/member/facebookLogin.do", method = {
	 * RequestMethod.GET, RequestMethod.POST }) public String
	 * join(HttpServletResponse response, Model model) {
	 * 
	 * OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
	 * String facebook_url =
	 * oauthOperations.buildAuthorizeUrl(GrantType.AUTHORIZATION_CODE,
	 * oAuth2Parameters);
	 * 
	 * model.addAttribute("facebook_url", facebook_url);
	 * System.out.println("/facebook" + facebook_url);
	 * 
	 * return "/member/memberMoveLogin.do";
	 * 
	 * 
	 * 
	 * 
	 * }
	 */
    
    
    
	
	 
	/*
	 * @RequestMapping("/member/facebookLogin.do")
	 * 
	 * @ResponseBody public ModelAndView facebookLogin(@RequestParam("userinfo")
	 * String userinfo , ModelAndView mav){
	 * 
	 * logger.debug("facebook 정보 : " + userinfo); Map<String, Object> map = new
	 * HashMap<>(); System.out.println("값이 들어오십니까? faceBooKLogin");
	 * 
	 * 
	 * mav.setViewName("member/memberLogin");
	 * 
	 * return mav;
	 * 
	 * }
	 */
    
    @RequestMapping(value = "/facebookSignInCallback", method = { RequestMethod.GET, RequestMethod.POST })
    public String facebookSignInCallback(@RequestParam String code) throws Exception {
 
        try {
             String redirectUri = oAuth2Parameters.getRedirectUri();
            System.out.println("Redirect URI : " + redirectUri);
            System.out.println("Code : " + code);
 
            OAuth2Operations oauthOperations = connectionFactory.getOAuthOperations();
            AccessGrant accessGrant = oauthOperations.exchangeForAccess(code, redirectUri, null);
            String accessToken = accessGrant.getAccessToken();
            System.out.println("AccessToken: " + accessToken);
            Long expireTime = accessGrant.getExpireTime();
        
            
            if (expireTime != null && expireTime < System.currentTimeMillis()) {
                accessToken = accessGrant.getRefreshToken();
                logger.debug("accessToken is expired. refresh token = {}");
            };
            
        
            Connection<Facebook> connection = connectionFactory.createConnection(accessGrant);
            Facebook facebook = connection == null ? new FacebookTemplate(accessToken) : connection.getApi();
            UserOperations userOperations = facebook.userOperations();
            
            try
 
            {            
                String [] fields = { "id", "email",  "name"};
                User userProfile = facebook.fetchObject("me", User.class, fields);
                System.out.println("유저이메일 : " + userProfile.getEmail());
                System.out.println("유저 id : " + userProfile.getId());
                System.out.println("유저 name : " + userProfile.getName());
                
            } catch (MissingAuthorizationException e) {
                e.printStackTrace();
            }
 
        
        } catch (Exception e) {
 
            e.printStackTrace();
 
        }
        return "redirect:/memberEnroll";
 
    }
    
}
