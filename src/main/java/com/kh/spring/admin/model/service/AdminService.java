package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.ProductIo;
import com.kh.spring.thing.model.vo.Regist;

public interface AdminService {
	
	//회원 리스트 조회 
	List<Map<String, String>> allMember(int cPage, int numPerPage);

	int countallMember();
	
	List<Map<String, String>> memberSearch(int cPage, int numPerPage, Map<String, String> map);

	int countmemberSearch(Map<String, String> map);
	
	List<Map<String, Object>> memberOne(String memberId);
	
	List<Map<String, Object>> couponAll();
	
	int updateisAdmin(Map<String, Object> map);
	
	List<Map<String, Object>> couponList(int memberNo);

	int couponPlus(Map<String, Object> map);
	
	int deleteCoupon(Map<String, Object> map);
	
	int couponAutoDelete();
	
	
	//결제된 상품 리스트 
	List<Map<String, String>> paidProduct(int cPage, int numPerPage);
	
	int countpaidProduct();
	
	List<Map<String, String>> paidAuction(int cPage, int numPerPage);

	int countpaidAuction();
	
	List<Map<String, String>> paidProductSearch(int cPage, int numPerPage, Map<String, String> map);

	int countpaidProductSearch(Map<String, String> map);
	
	List<Map<String, String>> paidAuctionSearch(int cPage, int numPerPage, Map<String, String> map);

	int countpaidAuctionSearch(Map<String, String> map);
	
	
	//판매신청 리스트
	List<Map<String, String>> registList(int cPage, int numPerPage);
	
	int countpaidregistList();
	
	List<CategoryMacro> categoryMa();

	List<Category> categoryMi(String macro);

	List<Map<String, Object>> registOne(int registNo);

	Regist registOne1(int registNo);

	int insertProduct(Map<String, Object> map);

	void updateRegist(int registNo);
	
	int registAuction(int registNo);
	
	List<Map<String, Object>> registCancel();
	
	
	List<Map<String, String>> registListMore(int cPage, int numPerPage);

	int countpaidregistListMore();
	
	
	//상품 리스트
	List<Map<String, String>> productList(int cPage, int numPerPage);
	
	int countproductList();
	
	List<Map<String, String>> productListSearch(int cPage, int numPerPage, Map<String, String> map);
	
	int countproductListSearch(Map<String, String> map);
		
	
	//경매신청 리스트
	List<Map<String, Object>> auctionRegistList();
	
	List<Map<String, Object>> auctionRegistOne(int auctionRegistNo);
	
	Auction auctionRegistOne1(int auctionRegistNo);
	
	int inAuction(Map<String, Object> map);

	int updateAuctionRegist(int auctionRegistNo);
	
	int auctionCencel(int auctionRegistNo);
	
	//경매 상품 현황
	List<Map<String, String>> auctionList(int cPage, int numPerPage);

	int countauctionList();
	
	List<Map<String, String>> auctionListSearch(int cPage, int numPerPage, Map<String, String> map);

	int countauctionListSearch(Map<String, String> map);
	
	//1:1질문답변
	List<Map<String, String>> questionAnswer(int cPage, int numPerPage);

	int countquestionAnswer();

	List<Map<String, String>> questionAnswerY(int cPage, int numPerPage);
	
	int countquestionAnswerY();
	
	//사이트 통계
	List<Map<String, Object>> memberGender();

	List<Map<String, Object>> paidProductCategory();

	List<Map<String, Object>> registCategory();

	List<Map<String, Object>> auctionCategory();

	List<Map<String, Object>> questionCategory();

	int interestDelete(int memberNo);

	int memberUpdate(Map<String, Object> map);

	int memberUpdate1(Member m);

	

	



	

	

	

	

	

	

	

	

	

	

	

	


	

	

	

	

	

	

	

	

	








	


	

	

	


	

}
