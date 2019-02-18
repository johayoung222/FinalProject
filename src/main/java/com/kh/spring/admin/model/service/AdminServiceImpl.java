package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;
import com.kh.spring.thing.model.vo.ProductIo;

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
	public List<Map<String, String>> idSearch(String search, int cPage, int numPerPage) {
		return adminDao.idSearch(search,cPage,numPerPage);
	}
	
	@Override
	public int countidSearch(String search) {
		return adminDao.countidSearch(search);
	}

	@Override
	public List<Map<String, String>> nameSearch(String search, int cPage, int numPerPage) {
		return adminDao.nameSearch(search,cPage,numPerPage);
	}

	@Override
	public int countnameSearch(String search) {
		return adminDao.countnameSearch(search);
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
	public List<Map<String, String>> paidProductNameSerach(String search, int cPage, int numPerPage) {
		return adminDao.paidProductNameSerach(search,cPage,numPerPage);
	}
	
	@Override
	public int countpaidProductNameSerach(String search) {
		return adminDao.countpaidProductNameSerach(search);
	}

	@Override
	public List<Map<String, String>> paidProductBuyerSerach(String search, int cPage, int numPerPage) {
		return adminDao.paidProductBuyerSerach(search,cPage,numPerPage);
	}
	
	@Override
	public int countpaidProductBuyerSerach(String search) {
		return adminDao.countpaidProductBuyerSerach(search);
	}

	@Override
	public List<Map<String, String>> paidProductCategorySerach(String search, int cPage, int numPerPage) {
		return adminDao.paidProductCategorySerach(search,cPage,numPerPage);
	}
	
	@Override
	public int countpaidProductCategorySerach(String search) {
		return adminDao.countpaidProductCategorySerach(search);
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
	public List<Map<String, String>> productListNameSearch(String search, int cPage, int numPerPage) {
		return adminDao.productListNameSearch(search,cPage,numPerPage);
	}

	@Override
	public int countproductListNameSearch(String search) {
		return adminDao.countproductListNameSearch(search);
	}

	@Override
	public List<Map<String, String>> productListOnsaleSearch(String search, int cPage, int numPerPage) {
		return adminDao.productListOnsaleSearch(search,cPage,numPerPage);
	}

	@Override
	public int countproductListOnsaleSearch(String search) {
		return adminDao.countproductListOnsaleSearch(search);
	}

	@Override
	public List<Map<String, String>> productListManufacturerSearch(String search, int cPage, int numPerPage) {
		return adminDao.productListManufacturerSearch(search,cPage,numPerPage);
	}

	@Override
	public int countproductListManufacturerSearch(String search) {
		return adminDao.countproductListManufacturerSearch(search);
	}

	@Override
	public List<Map<String, String>> productListCategorymiSearch(String search, int cPage, int numPerPage) {
		return adminDao.productListCategorymiSearch(search,cPage,numPerPage);
	}

	@Override
	public int countproductListCategorymiSearch(String search) {
		return adminDao.countproductListCategorymiSearch(search);
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



	

	
	
}
