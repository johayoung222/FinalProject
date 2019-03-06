package com.kh.spring.category.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.Regist;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Regist> laptopPcEnd() {
		return sqlSession.selectList("regist.laptopPcEnd");
	}


	@Override
	public List<Map<String, String>> selectMacro() {
		return sqlSession.selectList("product.selectAll");
	}


	@Override
	public List<String> MainAuctionSelect() {
		sqlSession.selectList("auction.MainAuctionSelect");
		List<String> list = null;
		return list;
	}


	@Override
	public List<Product> selectByCategory(Map<String, String> map) {
		return sqlSession.selectList("product.selectByCategory",map);
	}

}
