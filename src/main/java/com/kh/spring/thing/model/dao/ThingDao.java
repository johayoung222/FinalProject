package com.kh.spring.thing.model.dao;

import java.util.List;

import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.Order;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

public interface ThingDao {

	List<Category> selectCategorys();

	Product selectOne(int productNo);

	int sell(Regist regist);

	void insertOrder(Order order);

	void updateOnSale(int nProductNo);

}
