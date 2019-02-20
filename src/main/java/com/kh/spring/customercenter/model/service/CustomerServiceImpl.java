package com.kh.spring.customercenter.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.customercenter.model.dao.CustomerDao;

@Service
public class CustomerServiceImpl implements CustomerService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CustomerDao customerDao;

	@Override
	public List<Map<String, String>> selectNewsList(int cPage, int numPerPage) {
		return customerDao.selectNewsList(cPage , numPerPage);
	}

	@Override
	public int countNewsList() {
		return customerDao.countNewsList();
	}


	
}
