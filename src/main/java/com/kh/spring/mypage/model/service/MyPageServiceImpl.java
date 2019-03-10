package com.kh.spring.mypage.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.dao.MyPageDao;
import com.kh.spring.thing.model.vo.ProductIo;

@Service
public class MyPageServiceImpl implements MyPageService {

	@Autowired
	MyPageDao myPageDao;

	@Override
	public int updatephone(Member m) {
		int result = 0;
		result = myPageDao.updatephone(m);
		return result;
	}

	@Override
	public int updateemail(Member m) {
		int result = 0;
		result = myPageDao.updateemail(m);
		return result;
	}

	@Override
	public List<String> sellList(ProductIo pi) {
		List<String> list = myPageDao.sellList(pi);
		return list;
	}
}
