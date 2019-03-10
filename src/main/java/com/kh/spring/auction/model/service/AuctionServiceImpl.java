package com.kh.spring.auction.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.auction.model.dao.AuctionDao;
import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.CategoryMacro;

@Service
public class AuctionServiceImpl implements AuctionService {
	
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	AuctionDao auctionDao;

	@Override
	public List<String> selectctgList() {
		return auctionDao.selectctgList();
	}

	@Override
	public List<CategoryMacro> selectctgmlist(String ctgcode) {
		return auctionDao.selectctgmlist(ctgcode);
	}

	@Override
	public int insertAuctionRegist(Auction auc) {
		return auctionDao.insertAuctionRegist(auc);
	}

	@Override
	public List<Map<String, String>> selectAuctionList() {
		return auctionDao.selectAuctionList();
	}

	@Override
	public List<Map<String, String>> selectAuction(int auctionNo) {
		return auctionDao.selectAuction(auctionNo);
	}

	@Override
	public String selectCtgMacroName(String string) {
		return auctionDao.selectCtgMacroName(string);
	}

	@Override
	public String selectCtgMicroName(Map<String, Object> ctg) {
		return auctionDao.selectCtgMicroName(ctg);
	}

	@Override
	public Map<String, Object> selectAuctionHistory(String string) {
		return auctionDao.selectAuctionHistory(string);
	}

	@Override
	public Map<String, String> selectMyHistory(Map<String, Object> temp) {
		return auctionDao.selectMyHistory(temp);
	}

	@Override
	public int auctionHistoryInsert(Map<String, Object> map) {
		return auctionDao.auctionHistoryInsert(map);
	}

	@Override
	public Map<String, String> selectAuctionBid(Map<String, Object> temp) {
		return auctionDao.selectAuctionBid(temp);
	}

	@Override
	public String selectMainImg(int auctionNo) {
		return auctionDao.selectMainImg(auctionNo);
	}

	@Override
	public void updateAuctionCheck(int nProductNo) {
		auctionDao.updateAuctionCheck(nProductNo);
	}

	@Override
	public void updateWinningBid(Map<String , Object> temp) {
		auctionDao.updateWinningBid(temp);
	}

	@Override
	public String selectAuctionTitle(int auctionNo) {
		return auctionDao.selectAuctionTitle(auctionNo);
	}

	@Override
	public List<Map<String, String>> selectAuctionListBySearch(String searchKeyword) {
		return auctionDao.selectAuctionListBySearch(searchKeyword);
	}

	@Override
	public List<Map<String, String>> checkHistory(Map<String, Object> temp) {
		return auctionDao.checkHistory(temp);
	}

	
}
