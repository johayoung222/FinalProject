package com.kh.spring.mypage.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.mypage.model.dao.MyPageDao;

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
}
