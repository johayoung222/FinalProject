package com.kh.spring.thing.model.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.thing.model.dao.ThingDao;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

@Service
public class ThingServiceImpl implements ThingService {
	@Autowired
	ThingDao thingDao;
	
	
	@Override
	public List<Category> selectCategorys() {
		List<Category> categoryList = new ArrayList<Category>();
		categoryList = thingDao.selectCategorys();
		
		return categoryList;
	}


	@Override
	public Product selectOne(int productNo) {
		return thingDao.selectOne(productNo);
	}


	@Override
	public int sell(Regist regist) {
		return thingDao.sell(regist);
	}

}
