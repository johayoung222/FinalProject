package com.kh.spring.auction.model.service;

import java.util.List;

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
	
}
