package com.kh.spring.auction.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.CategoryMacro;

@Repository
public class AuctionDaoImpl implements AuctionDao {

	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<String> selectctgList() {
		return sqlSession.selectList("auction.selectctgList");
	}

	@Override
	public List<CategoryMacro> selectctgmlist(String ctgcode) {
		return sqlSession.selectList("auction.selectctgmlist" , ctgcode);
	}

	@Override
	public int insertAuctionRegist(Auction auc) {
		return sqlSession.insert("auction.insertAuctionRegist" , auc);
	}
}
