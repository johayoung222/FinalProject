package com.kh.spring.admin.model.service;

import java.util.List;
import java.util.Map;

public interface AdminService {

	List<Map<String, String>> allMember(int cPage, int numPerPage);

	int countallMember();

	List<Map<String, String>> paidProduct(int cPage, int numPerPage);

	int countpaidProduct();

	List<Map<String, String>> regist(int cPage, int numPerPage);

	int countregist();

}
