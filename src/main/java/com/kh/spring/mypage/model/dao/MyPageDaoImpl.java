package com.kh.spring.mypage.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.ProductIo;

@Repository
public class MyPageDaoImpl implements MyPageDao {
	
	@Autowired
	SqlSessionTemplate SqlSession;

	@Override
	public int updatephone(Member m) {
		int result = 0;
		result = SqlSession.update("mypage.updatephone",m);
		return result;
	}

	@Override
	public int updateemail(Member m) {
		int result = 0;
		result = SqlSession.update("mypage.updateemail",m);
		return result;
	}

	@Override
	public List<String> sellList(ProductIo pi) {
		List<String>list = SqlSession.selectList("mypage.sellList", pi);
		return list;
	}

}
