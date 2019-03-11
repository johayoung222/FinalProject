package com.kh.spring.auction.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.Product;

public interface AuctionService {

	List<String> selectctgList();

	List<CategoryMacro> selectctgmlist(String ctgcode);

	int insertAuctionRegist(Auction auc);

	List<Map<String, String>> selectAuctionList();

	List<Map<String, String>> selectAuction(int auctionNo);

	String selectCtgMacroName(String string);

	String selectCtgMicroName(Map<String, Object> ctg);

	Map<String, Object> selectAuctionHistory(String string);

	Map<String, String> selectMyHistory(Map<String, Object> temp);

	int auctionHistoryInsert(Map<String, Object> map);

	Map<String, String> selectAuctionBid(Map<String, Object> temp);

	String selectMainImg(int auctionNo);

	void updateAuctionCheck(int nProductNo);

	void updateWinningBid(Map<String, Object> temp);

	String selectAuctionTitle(int auctionNo);

	List<Map<String, String>> selectAuctionListBySearch(String searchKeyword);

	List<Map<String, String>> checkHistory(Map<String, Object> temp);

	void updateBuyerNo(Map<String, Object> temp1);

	List<Map<String, String>> selectAuctionAllList();

	int auctionCount();

}
