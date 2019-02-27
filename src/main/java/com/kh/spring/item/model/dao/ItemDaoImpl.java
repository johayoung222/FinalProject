package com.kh.spring.item.model.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

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
	public void insertAsk(String askContent) {
		sqlSession.insert("basket.insertAsk",askContent);
	}

	@Override
	public void updateMember(Map<String, String> map) {
		sqlSession.update("basket.updateMember",map);
	}

	

	
}
