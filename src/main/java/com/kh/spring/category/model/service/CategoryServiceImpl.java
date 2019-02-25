package com.kh.spring.category.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.category.model.dao.CategoryDao;
import com.kh.spring.thing.model.vo.Regist;

@Service
public class CategoryServiceImpl implements CategoryService {
	@Autowired
	CategoryDao categoryDao;
	
	@Override
	public List<Regist> laptopPcEnd() {
		return categoryDao.laptopPcEnd();
	}

	
	
	
}
