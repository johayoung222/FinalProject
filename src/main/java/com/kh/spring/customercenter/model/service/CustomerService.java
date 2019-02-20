package com.kh.spring.customercenter.model.service;

import java.util.List;
import java.util.Map;



public interface CustomerService {

	List<Map<String, String>> selectNewsList(int cPage, int numPerPage);

	int countNewsList();
}
