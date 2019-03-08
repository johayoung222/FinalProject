package com.kh.spring.item.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.item.model.dao.ItemDao;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.ProductAsk;
import com.kh.spring.thing.model.vo.Regist;

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

	@Override
	public int insertAsk(ProductAsk pAsk) {
		return basketDao.insertAsk(pAsk);
	}

	@Override
	public void updateProduct(Map<String, String> map) {
		basketDao.updateProduct(map);
	}

	@Override
	public List<Product> searchItem(String searchKeyword) {
		return basketDao.searchItem(searchKeyword);
	}

	@Override
	public List<Map<String, String>> searchItemAjax(String myData) {
		return basketDao.searchItemAjax(myData);
	}

	@Override
	public List<Regist> selectAllRegist() {
		return basketDao.selectAllRegist();
	}

	@Override
	public List<Product> selectNew() {
		return basketDao.selectNew();
	}

	@Override
	public List<Product> selectNowProduct(Map<String, String> map) {
		return basketDao.selectNowProduct(map);
	}

	@Override
	public List<ProductAsk> selectAskAll(int productNo) {
		return basketDao.selectAskAll(productNo);
	}

	
}
