package com.kh.spring.item.model.service;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.item.model.dao.ItemDao;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

@Service
public class ItemServiceImpl implements ItemService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	ItemDao basketDao;

	@Override
	public Product selectOneProduct(int num) {
		return basketDao.selectOneProduct(num);
	}

	@Override
	public Member selectJoinMember(int sellerNo) {
		return basketDao.selectJoinMember(sellerNo);
	}

	
}
