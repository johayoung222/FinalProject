package com.kh.spring.auction.model.dao;

import java.util.List;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.CategoryMacro;

public interface AuctionDao {

	List<String> selectctgList();

	List<CategoryMacro> selectctgmlist(String ctgcode);

	int insertAuctionRegist(Auction auc);

}
