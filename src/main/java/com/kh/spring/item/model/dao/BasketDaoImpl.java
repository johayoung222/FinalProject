package com.kh.spring.item.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.item.model.vo.Basket;

@Repository
public class BasketDaoImpl implements BasketDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public void insert(Basket vo) {
		sqlSession.insert("basket.insertBasket", vo);
	}

	

	
}
