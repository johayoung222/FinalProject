package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.ProductIo;
import com.kh.spring.thing.model.vo.Regist;

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

	List<Map<String, String>> auctionStatus(int cPage, int numPerPage);

	int countauctionStatus();

	List<Map<String, String>> reportList(int cPage, int numPerPage);

	int countreportList();

	int countpaidProductSearch2(Map<String, String> map);

	List<ProductIo> paidProductSearch(int cPage, int numPerPage, Map<String, String> map);

	List<CategoryMacro> categoryMa();

	List<Category> categoryMi(String macro);

	Regist registOne(int registNo);





	
	

}
