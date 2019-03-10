package com.kh.spring.item.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;
import com.kh.spring.thing.model.vo.ProductAsk;
import com.kh.spring.thing.model.vo.Regist;

@Repository
public class ItemDaoImpl implements ItemDao {
	
	@Autowired
	SqlSession sqlSession;

	@Override
	public Product selectOneProduct(int num) {
		Product p = sqlSession.selectOne("basket.selectOneProduct", num);
		return p;
	}

	@Override
	public Member selectJoinMember(int sellerNo) {
		Member m = sqlSession.selectOne("basket.selectJoinMember", sellerNo);
		return m;
	}

	@Override
	public int insertAsk(ProductAsk pAsk) {
		return sqlSession.insert("basket.insertAsk",pAsk);
	}

	@Override
	public void updateProduct(Map<String, String> map) {
		sqlSession.update("basket.updateProduct",map);
	}

	@Override
	public List<Product> searchItem(String searchKeyword) {
		return sqlSession.selectList("basket.searchItems", searchKeyword);
	}

	@Override
	public List<Map<String, String>> searchItemAjax(String myData) {
		return sqlSession.selectList("basket.searchItemsAjax", myData);
	}

	@Override
	public List<Regist> selectAllRegist() {
		return sqlSession.selectList("basket.selectAllRegist");
	}

	@Override
	public List<Product> selectNew() {
		return sqlSession.selectList("basket.selectNew");
	}

	@Override
	public List<Product> selectNowProduct(Map<String, String> map) {
		return sqlSession.selectList("basket.selectNowProduct",map);
	}

	@Override
	public List<ProductAsk> selectAskAll(int productNo) {
		return sqlSession.selectList("basket.selectAskAll",productNo);
	}

	@Override
	public List<Product> selectUpItems() {
		return sqlSession.selectList("basket.selectUpItems");
	}

	@Override
	public List<Map<String, Object>> couponList(String buyerNo) {
		return sqlSession.selectList("basket.couponList",buyerNo);
	}

	

	

	
}
