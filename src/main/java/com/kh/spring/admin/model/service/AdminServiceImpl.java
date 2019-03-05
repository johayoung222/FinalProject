package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.ProductIo;
import com.kh.spring.thing.model.vo.Regist;

@Service
public class AdminServiceImpl implements AdminService {
	
	@Autowired
	AdminDao adminDao;
	
	//회원 리스트 조회----------------------------------------------------------------
	@Override
	public List<Map<String, String>> allMember(int cPage, int numPerPage) {
		return adminDao.allMember(cPage, numPerPage);
	}
	
	@Override
	public int countallMember() {
		return adminDao.countallMember();
	}
	
	@Override
	public List<Map<String, String>> memberSearch(int cPage, int numPerPage, Map<String, String> map) {
		return adminDao.memberSearch(cPage, numPerPage, map);
	}

	@Override
	public int countmemberSearch(Map<String, String> map) {
		return adminDao.countmemberSearch(map);
	}
	
	@Override
	public List<Map<String, Object>> memberOne(String memberId) {
		return adminDao.memberOne(memberId);
	}
	
	@Override
	public List<Map<String, Object>> couponAll() {
		return adminDao.couponAll();
	}
	
	@Override
	public int updateisAdmin(Map<String, Object> map) {
		return adminDao.updateisAdmin(map);
	}

	
	@Override
	public int couponPlus(Map<String, Object> map) {
		return adminDao.couponPlus(map);
	}
	
	@Override
	public List<Map<String, Object>> couponList(int memberNo) {
		return adminDao.couponList(memberNo);
	}
	
	@Override
	public int deleteCoupon(Map<String, Object> map) {
		return adminDao.deleteCoupon(map);
	}



	
	//결제된 상품 리스트----------------------------------------------------------------
	@Override
	public List<Map<String, String>> paidProduct(int cPage, int numPerPage) {
		return adminDao.paidProduct(cPage, numPerPage);
	}
	
	@Override
	public int countpaidProduct() {
		return adminDao.countpaidProduct();
	}
	
	@Override
	public List<Map<String,String>> paidProductSearch(int cPage, int numPerPage, Map<String, String> map) {
		return adminDao.paidProductSearch(cPage,numPerPage,map);
	}
	
	@Override
	public int countpaidProductSearch(Map<String, String> map) {
		return adminDao.countpaidProductSearch(map);
	}
	
	
	//판매 신청 리스트----------------------------------------------------------------
	@Override
	public List<Map<String, Object>> regist() {
		return adminDao.regist();
	}

	@Override
	public int countregist() {
		return adminDao.countregist();
	}

	@Override
	public List<CategoryMacro> categoryMa() {
		return adminDao.categoryMa();
	}

	@Override
	public List<Category> categoryMi(String macro) {
		return adminDao.categoryMi(macro);
	}

	@Override
	public List<Map<String, Object>> registOne(int registNo) {
		return adminDao.registOne(registNo);
	}

	@Override
	public Regist registOne1(int registNo) {
		return adminDao.registOne1(registNo);
	}

	@Override
	public int insertProduct(Map<String, Object> map) {
		return adminDao.insertProduct(map);
	}

	@Override
	public void updateRegist(int registNo) {
		adminDao.updateRegist(registNo);
	}
	
	
	//상품 리스트-------------------------------------------------------------
	@Override
	public List<Map<String, String>> productList(int cPage, int numPerPage) {
		return adminDao.productList(cPage, numPerPage);
	}

	@Override
	public int countproductList() {
		return adminDao.countproductList();
	}
	
	@Override
	public List<Map<String, String>> productListSearch(int cPage, int numPerPage, Map<String, String> map) {
		return adminDao.productListSearch(cPage,numPerPage,map);
	}

	@Override
	public int countproductListSearch(Map<String, String> map) {
		return adminDao.countproductListSearch(map);
	}
	
	
	//1:1질문 답변----------------------------------------------------------------
	@Override
	public List<Map<String, String>> questionAnswer(int cPage, int numPerPage) {
		return adminDao.questionAnswer(cPage, numPerPage);
	}

	@Override
	public int countquestionAnswer() {
		return adminDao.countquestionAnswer();
	}

	@Override
	public List<Map<String, String>> questionAnswerY(int cPage, int numPerPage) {
		return adminDao.questionAnswerY(cPage, numPerPage);
	}
	
	@Override
	public int countquestionAnswerY() {
		return adminDao.countquestionAnswerY();
	}
	
	//경매 상품 현황------------------------------------------------------------------
	@Override
	public List<Map<String, String>> acutionStatus(int cPage, int numPerPage) {
		return adminDao.auctionStatus(cPage, numPerPage);
	}

	@Override
	public int countauctionStatus() {
		return adminDao.countauctionStatus();
	}
	

	
	//신고접수 리스트----------------------------------------------------------------
	@Override
	public List<Map<String, String>> reportList(int cPage, int numPerPage) {
		return adminDao.reportList(cPage,numPerPage);
	}

	@Override
	public int countreportList() {
		return adminDao.countreportList();
	}

	//사이트 통계------------------------
	@Override
	public List<Map<String, Object>> memberGender() {
		return adminDao.memberGender();
	}

	@Override
	public List<Map<String, Object>> paidProductCategory() {
		return adminDao.paidProductCategory();
	}

	


	

	
	

	
	
	

	

	
	



	

	

	




	

	
	
}
