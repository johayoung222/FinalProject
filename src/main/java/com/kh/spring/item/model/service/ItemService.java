package com.kh.spring.item.model.service;
import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.ProductAsk;

public interface ItemService {

	Product selectOneProduct(int num);

	Member selectJoinMember(int sellerNo);

	int insertAsk(ProductAsk pAsk);

	void updateProduct(Map<String, String> map);

	List<Map<String, String>> searchItem(String searchKeyword);

	List<Map<String, String>> searchItemAjax(String myData);

}
