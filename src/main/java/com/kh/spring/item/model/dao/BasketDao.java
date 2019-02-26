package com.kh.spring.item.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.thing.model.vo.Product;

public interface BasketDao {

	Product selectOneProduct(int num);

}
