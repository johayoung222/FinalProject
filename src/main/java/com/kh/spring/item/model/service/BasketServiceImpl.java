package com.kh.spring.item.model.service;


import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.kh.spring.item.model.dao.BasketDao;
import com.kh.spring.item.model.vo.Basket;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

@Service
public class BasketServiceImpl implements BasketService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BasketDao basketDao;

	@Override
	public int countBasket(int productId, String userId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public void insert(Basket vo) {
		basketDao.insert(vo);
	}

	@Override
	public void updateBasket(Basket vo) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public Product selectOneProduct(int num) {
		return basketDao.selectOneProduct(num);
	}

	@Override
	public Member selectJoinMember(int sellerNo) {
		return basketDao.selectJoinMember(sellerNo);
	}




	
}
