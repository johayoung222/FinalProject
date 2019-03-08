package com.kh.spring.thing.model.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.log4j.Logger;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.Order;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

@Repository
public class ThingDaoImpl implements ThingDao {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Category> selectCategorys() {
		List<Category> categoryList = new ArrayList<Category>(); 
		
		categoryList = sqlSession.selectList("thing.selectCategorys");
		
		return categoryList;
	}


	@Override
	public Product selectOne(int productNo) {
		Product p = sqlSession.selectOne("thing.selectOne",productNo);
		logger.debug(p);
		return p;
	}


	@Override
	public int sell(Regist regist) {
		return sqlSession.insert("thing.sell", regist);
	}


	@Override
	public void insertOrder(Order order) {
		sqlSession.insert("thing.insertOrder",order);
	}


	@Override
	public void updateOnSale(int nProductNo) {
		sqlSession.update("thing.updateOnSale",nProductNo);
	}

}
