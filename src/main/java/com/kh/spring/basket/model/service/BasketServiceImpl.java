package com.kh.spring.basket.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.basket.model.dao.BasketDao;
import com.kh.spring.basket.model.vo.Basket;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired BasketDao basketDao;

	@Override
	public int countbasketList() {
		// TODO Auto-generated method stub
		return basketDao.countbasketList();
	}

	@Override
	public int insertBasket(Basket b) {
		// TODO Auto-generated method stub
		return basketDao.insertBasket(b);
	}

	@Override
	public List<Map<String, String>> selectProductList(Basket b) {
		// TODO Auto-generated method stub
		return basketDao.selectProductList(b);
	}

	@Override
	public int deleteBasket(Basket b) {
		// TODO Auto-generated method stub
		return basketDao.deleteBasket(b);
	}

	@Override
	public int selectSumProduct(Basket b) {
		// TODO Auto-generated method stub
		return basketDao.selectSumProduct(b);
	}

	@Override
	public Basket selectOneBasket(Basket b) {
		// TODO Auto-generated method stub
		return basketDao.selectOnebasket(b);
	}

	

	
	
	
	
	
	
	
	
}
