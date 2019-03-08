package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.member.model.vo.Member;

public interface MemberService {

	int insertMember(Member m);

	Member selectOneMember(String memberId);

	int memberUpdate(Member temp);

	List<Map<String, String>> selectAllCategory();

	int insertMember(ModelAndView mav);

	int insertFacebookMember(Member m);

	Member selectOneFBMember(String fbIdcheck);

	Member selectOnekakaoMember(String kIdcheck);

	int insertKakaoMember(Member m);

	int insertgoogleMember(Member m);

	Member selectOnegoogleMember(String gIdcheck);

	String selectmemberId(String memberEmail);

	int countmember(Member m);

	int updatePwd(Member m);



}
