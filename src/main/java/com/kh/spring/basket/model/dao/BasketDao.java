package com.kh.spring.basket.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.basket.model.vo.Basket;

public interface BasketDao {

	List<Map<String, String>> basketList(int cPage, int numPerPage);

	int countbasketList();

	int insertBasket(Basket b);

	List<Map<String, String>> selectProductList(Basket b);

	int deleteBasket(Basket b);

	

	List<Map<String, String>> selectSumProduct(Basket b);

}
