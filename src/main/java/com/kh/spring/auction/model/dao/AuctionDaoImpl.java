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

	@Override
	public int auctionHistoryInsert(Map<String, Object> map) {
		return sqlSession.insert("auction.auctionHistoryInsert" , map);
	}

	@Override
	public Map<String, String> selectAuctionBid(Map<String, Object> temp) {
		return sqlSession.selectOne("auction.selectAuctionBid" , temp);
	}

	@Override
	public String selectMainImg(int auctionNo) {
		return sqlSession.selectOne("auction.selectMainImg", auctionNo);
	}

	@Override
	public void updateAuctionCheck(int nProductNo) {
		sqlSession.update("auction.updateAuctionCheck",nProductNo);
	}

	@Override
	public void updateWinningBid(Map<String , Object> temp) {
		sqlSession.update("auction.updateWinningBid",temp);
	}

	@Override
	public String selectAuctionTitle(int auctionNo) {
		return sqlSession.selectOne("auction.selectAuctionTitle", auctionNo);
	}

	@Override
	public List<Map<String, String>> selectAuctionListBySearch(String searchKeyword) {
		return sqlSession.selectList("auction.selectAuctionBySearch", searchKeyword);
	}

	@Override
	public List<Map<String, String>> checkHistory(Map<String, Object> temp) {
		return sqlSession.selectList("auction.checkHistory" , temp);
	}

	@Override
	public void updateBuyerNo(Map<String, Object> temp1) {
		sqlSession.update("auction.updateBuyerNo" , temp1);
	}

}
