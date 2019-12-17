package com.kh.spring.mypage.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.ProductIo;

public interface MyPageDao {

	int updatephone(Member m);

	int updateemail(Member m);

	/*
	 * List<Map<String, Object>> sellList(int seqMemberNo);
	 * 
	 * List<Map<String, Object>> sellList2(int seqMemberNo);
	 */

	List<Map<String, Object>> sellList(int seqMemberNo, int cPage, int numPerPage);
	
	List<Map<String, Object>> sellList2(int seqMemberNo, int cPage, int numPerPage);
	
	List<Map<String, Object>> sellList3(int seqMemberNo, int cPage, int numPerPage);

	int countproduct(int seqMemberNo);

	int countproduct2(int seqMemberNo);
	
	int countproduct3(int seqMemberNo);


	List<Map<String, Object>> buyList(int cPage, int numPerPage, int seqMemberNo);

	int countbuy(int seqMemberNo);

	int updateaddress(Member m);

	List<Map<String, Object>> coupons(int memberNo);

	int acountbuy(int seqMemberNo);

	List<Map<String, Object>> abuyList(int cPage, int numPerPage, int seqMemberNo);

	int memberAddressUpdate(Member m);
}
