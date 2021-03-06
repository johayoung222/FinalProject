package com.kh.spring.basket.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.basket.model.vo.Basket;
import com.kh.spring.thing.model.vo.Product;

public interface BasketService{

	int countbasketList();

	int insertBasket(Basket b);

	List<Map<String, String>> selectProductList(Basket b);

	int deleteBasket(Basket b);

	int selectSumProduct(Basket b);


	Basket selectOneBasket(Basket b);


}
