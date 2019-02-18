package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

public interface AdminDao {

	List<Map<String, String>> allMember(int cPage, int numPerPage);

	int countallMember();

	List<Map<String, String>> idSearch(String search, int cPage, int numPerPage);
	
	int countidSearch(String search);
	
	List<Map<String, String>> nameSearch(String search, int cPage, int numPerPage);

	int countnameSearch(String search);

	List<Map<String, String>> paidProduct(int cPage, int numPerPage);
	
	int countpaidProduct();

	List<Map<String, String>> paidProductNameSerach(String search, int cPage, int numPerPage);
	
	int countpaidProductNameSerach(String search);
	
	List<Map<String, String>> paidProductBuyerSerach(String search, int cPage, int numPerPage);
	
	int countpaidProductBuyerSerach(String search);
	
	List<Map<String, String>> paidProductCategorySerach(String search, int cPage, int numPerPage);

	int countpaidProductCategorySerach(String search);

	List<Map<String, String>> regist(int cPage, int numPerPage);

	int countregist();

	List<Map<String, String>> productList(int cPage, int numPerPage);

	int countproductList();
	
	List<Map<String, String>> productListNameSearch(String search, int cPage, int numPerPage);

	int countproductListNameSearch(String search);

	List<Map<String, String>> productListOnsaleSearch(String search, int cPage, int numPerPage);

	int countproductListOnsaleSearch(String search);

	List<Map<String, String>> productListManufacturerSearch(String search, int cPage, int numPerPage);

	int countproductListManufacturerSearch(String search);

	List<Map<String, String>> productListCategorymiSearch(String search, int cPage, int numPerPage);

	int countproductListCategorymiSearch(String search);


	List<Map<String, String>> questionAnswer(int cPage, int numPerPage);

	int countquestionAnswer();

	List<Map<String, String>> auctionStatus(int cPage, int numPerPage);

	int countauctionStatus();

	List<Map<String, String>> reportList(int cPage, int numPerPage);

	int countreportList();

	
	

}
