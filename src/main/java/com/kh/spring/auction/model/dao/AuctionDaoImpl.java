package com.kh.spring.auction.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AuctionDaoImpl implements AuctionDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<String> selectctgList() {
		return sqlSession.selectList("auction.selectctgList");
	}
}
