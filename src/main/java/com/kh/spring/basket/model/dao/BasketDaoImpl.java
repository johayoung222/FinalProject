package com.kh.spring.basket.model.dao;


import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.basket.model.vo.Basket;

@Repository
public class BasketDaoImpl implements BasketDao {

	
	@Autowired SqlSessionTemplate  sqlSession;

	@Override
	public List<Map<String, String>> basketList(int cPage, int numPerPage) {
		// TODO Auto-generated method stub
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("basket.basketList",null,rowBounds);
	}

	@Override
	public int countbasketList() {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("basket.countbasketList");
	}

	@Override
	public int insertBasket(Basket b) {
		// TODO Auto-generated method stub
		return sqlSession.insert("basket.insertBasket",b);
	}

	@Override
	public List<Map<String, String>> selectProductList(Basket b) {
		// TODO Auto-generated method stub
		return sqlSession.selectList("basket.selectProductList",b);
	}

	@Override
	public int deleteBasket(Basket b) {
		// TODO Auto-generated method stub
		return sqlSession.delete("basket.deletBasketList",b);
	}


	@Override
	public int selectSumProduct(Basket b) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("basket.selectSum",b);
	}

	@Override
	public Basket selectOnebasket(Basket b) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("basket.selectOneBasket",b);
	}

	
	
	
	
	
	
	
}
