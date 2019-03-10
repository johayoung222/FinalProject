package com.kh.spring.thing.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.Order;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

public interface ThingService {

	List<Category> selectCategorys();

	Product selectOne(int productNo);

	int sell(Regist regist);

	void insertOrder(Order order);

	void updateOnSale(Map<String, Object> map);

	void updateCoupon(Map<String, Object> map);

}
