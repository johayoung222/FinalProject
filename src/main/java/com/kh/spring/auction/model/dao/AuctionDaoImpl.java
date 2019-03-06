package com.kh.spring.auction.model.dao;

import java.util.List;
import java.util.Map;

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

	@Override
	public List<Map<String, String>> selectAuctionList() {
		return sqlSession.selectList("auction.selectAuctionList");
	}

	@Override
	public List<Map<String, String>> selectAuction(int auctionNo) {
		return sqlSession.selectList("auction.selectAuction" , auctionNo);
	}

	@Override
	public String selectCtgMacroName(String string) {
		return sqlSession.selectOne("auction.selectCtgMacroName", string);
	}

	@Override
	public String selectCtgMicroName(Map<String, Object> ctg) {
		return sqlSession.selectOne("auction.selectCtgMicroName", ctg);
	}

	@Override
	public Map<String, Object> selectAuctionHistory(String string) {
		int auctionNo = Integer.parseInt(string);
		return sqlSession.selectOne("auction.selectAuctionHistory" , auctionNo);
	}

	@Override
	public Map<String, String> selectMyHistory(Map<String, Object> temp) {
		return sqlSession.selectOne("auction.selectMyHistory" , temp);
	}

}
