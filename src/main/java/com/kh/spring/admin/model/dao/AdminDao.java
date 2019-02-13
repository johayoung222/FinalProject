package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	List<Map<String, String>> allMember(int cPage, int numPerPage);

	int countallMember();

	List<Map<String, String>> paidProduct(int cPage, int numPerPage);

	int countpaidProduct();

	List<Map<String, String>> regist(int cPage, int numPerPage);

	int countregist();

	List<Map<String, String>> productList(int cPage, int numPerPage);

	int countproductList();

	List<Map<String, String>> questionAnswer(int cPage, int numPerPage);

	int countquestionAnswer();

}
