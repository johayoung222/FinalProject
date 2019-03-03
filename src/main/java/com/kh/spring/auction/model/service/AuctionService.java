package com.kh.spring.auction.model.service;

import java.util.List;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.thing.model.vo.CategoryMacro;

public interface AuctionService {

	List<String> selectctgList();

	List<CategoryMacro> selectctgmlist(String ctgcode);

	int insertAuctionRegist(Auction auc);

}
