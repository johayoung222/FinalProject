package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.admin.model.dao.AdminDao;

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
}
