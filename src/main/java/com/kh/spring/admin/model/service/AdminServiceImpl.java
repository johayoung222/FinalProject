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

	@Override
	public List<Map<String, String>> allMember(int cPage, int numPerPage) {
		return adminDao.allMember(cPage, numPerPage);
	}
	
	@Override
	public int countallMember() {
		return adminDao.countallMember();
	}
	
	@Override
	public List<Map<String, String>> paidProduct(int cPage, int numPerPage) {
		return adminDao.paidProduct(cPage, numPerPage);
	}
	
	@Override
	public int countpaidProduct() {
		return adminDao.countpaidProduct();
	}
	
	@Override
	public List<Map<String, String>> regist(int cPage, int numPerPage) {
		return adminDao.regist(cPage, numPerPage);
	}

	@Override
	public int countregist() {
		return adminDao.countregist();
	}

	@Override
	public List<Map<String, String>> productList(int cPage, int numPerPage) {
		return adminDao.productList(cPage, numPerPage);
	}

	@Override
	public int countproductList() {
		return adminDao.countproductList();
	}
	
	@Override
	public List<Map<String, String>> questionAnswer(int cPage, int numPerPage) {
		return adminDao.questionAnswer(cPage, numPerPage);
	}

	@Override
	public int countquestionAnswer() {
		return adminDao.countquestionAnswer();
	}

	@Override
	public List<Map<String, String>> acutionStatus(int cPage, int numPerPage) {
		return adminDao.auctionStatus(cPage, numPerPage);
	}

	@Override
	public int countauctionStatus() {
		return adminDao.countauctionStatus();
	}

	@Override
	public List<Map<String, String>> reportList(int cPage, int numPerPage) {
		return adminDao.reportList(cPage,numPerPage);
	}

	@Override
	public int countreportList() {
		return adminDao.countreportList();
	}
	
	@Override
	public int countpaidProductSearch2(Map<String, String> map) {
		return adminDao.countpaidProductSearch2(map);
	}

	@Override
	public List<ProductIo> paidProductSearch(int cPage, int numPerPage, Map<String, String> map) {
		return adminDao.paidProductSearch(cPage,numPerPage,map);
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
	public Regist registOne(int registNo) {
		return adminDao.registOne(registNo);
	}


	

	

	




	

	
	
}
