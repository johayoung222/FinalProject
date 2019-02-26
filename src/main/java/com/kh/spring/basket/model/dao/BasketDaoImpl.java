package com.kh.spring.basket.model.dao;


import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BasketDaoImpl implements BasketDao {

	
	@Autowired SqlSessionTemplate  sqlSession;
	
	
	
	
	
}
