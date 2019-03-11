package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.ProductIo;

public interface MyPageService {

	int updatephone(Member m);

	int updateemail(Member m);

	/*
	 * List<Map<String, Object>> sellList(int seqMemberNo);
	 * 
	 * List<Map<String, Object>> sellList2(int seqMemberNo);
	 */

	List<Map<String, Object>> sellList(int cPage, int numPerPage, int seqMemberNo);
	
	List<Map<String, Object>> sellList2(int cPage, int numPerPage, int seqMemberNo);

	int countproduct(int seqMemberNo);

	int countproduct2(int seqMemberNo);

	List<Map<String, Object>> buyList(int cPage, int numPerPage,int seqMemberNo);

	int countbuy(int seqMemberNo);

	List<Map<String, Object>> coupons(int memberNo);
}
