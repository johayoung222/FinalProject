package com.kh.spring.item.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

public interface ItemDao {

	Product selectOneProduct(int num);

	Member selectJoinMember(int sellerNo);

}