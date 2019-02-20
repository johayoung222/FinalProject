package com.kh.spring.customercenter.model.dao;

import java.util.List;
import java.util.Map;



public interface CustomerDao {

	List<Map<String, String>> selectNewsList(int cPage, int numPerPage);

	int countNewsList();
}
