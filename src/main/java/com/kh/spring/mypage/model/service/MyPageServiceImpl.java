package com.kh.spring.mypage.model.service;

import java.util.List;
import java.util.Map;

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

	/*
	 * @Override public List<Map<String, Object>> sellList(int seqMemberNo) {
	 * List<Map<String, Object>> list = myPageDao.sellList(seqMemberNo); return
	 * list; }
	 * 
	 * @Override public List<Map<String, Object>> sellList2(int seqMemberNo) {
	 * List<Map<String, Object>> list = myPageDao.sellList2(seqMemberNo); return
	 * list; }
	 */
	@Override
	public List<Map<String, Object>> sellList(int cPage, int numPerPage, int seqMemberNo) {
		List<Map<String, Object>> list = myPageDao.sellList(seqMemberNo,cPage,numPerPage);
		return list;
	}

	@Override
	public List<Map<String, Object>> sellList2(int cPage, int numPerPage, int seqMemberNo) {
		List<Map<String, Object>> list = myPageDao.sellList2(seqMemberNo,cPage,numPerPage);
		return list;
	}

	@Override
	public int countproduct(int seqMemberNo) {
		return myPageDao.countproduct(seqMemberNo);
	}
	public int countproduct2(int seqMemberNo) {
		return myPageDao.countproduct2(seqMemberNo);
	}

	@Override
	public List<Map<String, Object>> buyList(int cPage, int numPerPage,int seqMemberNo) {
		List<Map<String, Object>> list = myPageDao.buyList(cPage,numPerPage,seqMemberNo);
		return list;
	}

	@Override
	public int countbuy(int seqMemberNo) {
		return myPageDao.countbuy(seqMemberNo);
	}

	@Override
	public List<Map<String, Object>> coupons(int memberNo) {
		return myPageDao.coupons(memberNo);
	}
}
