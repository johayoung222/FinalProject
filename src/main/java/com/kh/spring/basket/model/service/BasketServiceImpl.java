package com.kh.spring.basket.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.basket.model.dao.BasketDao;

@Service
public class BasketServiceImpl implements BasketService{

	@Autowired BasketDao basketDao;

	@Override
	public List<Map<String, String>> basketList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		return basketDao.basketList(cPage, numPerPage);
	}

	@Override
	public int countbasketList() {
		// TODO Auto-generated method stub
		return basketDao.countbasketList();
	}
	
	
	
	
	
	
}
