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
	ItemDao itemDao;

	@Override
	public Product selectOneProduct(int num) {
		return itemDao.selectOneProduct(num);
	}

	@Override
	public Member selectJoinMember(int sellerNo) {
		return itemDao.selectJoinMember(sellerNo);
	}

	@Override
	public int insertAsk(ProductAsk pAsk) {
		return itemDao.insertAsk(pAsk);
	}

	@Override
	public void updateProduct(Map<String, String> map) {
		itemDao.updateProduct(map);
	}

	@Override
	public List<Product> searchItem(String searchKeyword) {
		return itemDao.searchItem(searchKeyword);
	}

	@Override
	public List<Map<String, String>> searchItemAjax(String myData) {
		return itemDao.searchItemAjax(myData);
	}

	@Override
	public List<Regist> selectAllRegist() {
		return itemDao.selectAllRegist();
	}

	@Override
	public List<Product> selectNew() {
		return itemDao.selectNew();
	}

	@Override
	public List<Product> selectNowProduct(Map<String, String> map) {
		return itemDao.selectNowProduct(map);
	}

	@Override
	public List<ProductAsk> selectAskAll(int productNo) {
		return itemDao.selectAskAll(productNo);
	}

	@Override
	public List<Product> selectUpItems() {
		return itemDao.selectUpItems();
	}

	@Override
	public List<Product> selectItr(List<String> itrArrList) {
		return itemDao.selectItr(itrArrList);
	}

	@Override
	public String selectMemberInterest(int memberNo) {
		return itemDao.selectMemberInterest(memberNo);
	}
		
	@Override	
	public List<Map<String, Object>> couponList(String buyerNo) {
	return itemDao.couponList(buyerNo);
	}

	
}
