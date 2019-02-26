package com.kh.spring.item.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.item.model.vo.Basket;
import com.kh.spring.thing.model.vo.Product;



public interface BasketDao {

	void insert(Basket vo);

	Product selectOneProduct(int num);

}
