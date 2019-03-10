package com.kh.spring.item.model.service;
import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.ProductAsk;
import com.kh.spring.thing.model.vo.Regist;

public interface ItemService {

	Product selectOneProduct(int num);

	Member selectJoinMember(int sellerNo);

	int insertAsk(ProductAsk pAsk);

	void updateProduct(Map<String, String> map);

	List<Product> searchItem(String searchKeyword);

	List<Map<String, String>> searchItemAjax(String myData);

	List<Regist> selectAllRegist();

	List<Product> selectNew();

	List<Product> selectNowProduct(Map<String, String> map);

	List<ProductAsk> selectAskAll(int productNo);

	List<Product> selectUpItems();

	List<Map<String, Object>> couponList(String buyerNo);

}
