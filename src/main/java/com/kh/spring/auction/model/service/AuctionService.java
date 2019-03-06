package com.kh.spring.auction.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.CategoryMacro;

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

}
