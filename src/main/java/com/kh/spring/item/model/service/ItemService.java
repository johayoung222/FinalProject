package com.kh.spring.item.model.service;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

public interface ItemService {

	Product selectOneProduct(int num);

	Member selectJoinMember(int sellerNo);

	void insertAsk(String askContent);

	void updateMember(Map<String, String> map);

}
