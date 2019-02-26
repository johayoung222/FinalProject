package com.kh.spring.item.model.service;

import com.kh.spring.item.model.vo.Basket;
import com.kh.spring.thing.model.vo.Product;

public interface BasketService {

	int countBasket(int productId, String userId);

	void insert(Basket vo);

	void updateBasket(Basket vo);

	Product selectOneProduct(int num);

}
