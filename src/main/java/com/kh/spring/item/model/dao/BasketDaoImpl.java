package com.kh.spring.item.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Product;

@Repository
public class BasketDaoImpl implements BasketDao {
	
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

	

	
}
