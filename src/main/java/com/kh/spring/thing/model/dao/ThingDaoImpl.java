package com.kh.spring.thing.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.thing.model.vo.Category;

@Repository
public class ThingDaoImpl implements ThingDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Category> selectCategorys() {
		List<Category> categoryList = new ArrayList<Category>(); 
		
		categoryList = sqlSession.selectList("thing.selectCategorys");
		
		return categoryList;
	}

}
