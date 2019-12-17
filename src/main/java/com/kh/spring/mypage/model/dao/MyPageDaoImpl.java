package com.kh.spring.mypage.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
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

	/*
	 * @Override public List<Map<String, Object>> sellList(int seqMemberNo) {
	 * List<Map<String, Object>> list =
	 * SqlSession.selectList("mypage.sellList",seqMemberNo); return list; }
	 * 
	 * @Override public List<Map<String, Object>> sellList2(int seqMemberNo) {
	 * List<Map<String, Object>> list =
	 * SqlSession.selectList("mypage.sellList2",seqMemberNo); return list; }
	 */

	@Override
	public List<Map<String, Object>> sellList(int seqMemberNo, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage,numPerPage); 
		return SqlSession.selectList("mypage.sellList" , seqMemberNo, rowBounds); 
	}

	@Override
	public List<Map<String, Object>> sellList2(int seqMemberNo, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage,numPerPage); 
		return SqlSession.selectList("mypage.sellList2" , seqMemberNo, rowBounds); 
	}

	@Override
	public int countproduct(int seqMemberNo) {
		return SqlSession.selectOne("mypage.countproduct", seqMemberNo);
	}
	
	@Override
	public List<Map<String, Object>> sellList3(int seqMemberNo, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage,numPerPage); 
		return SqlSession.selectList("mypage.sellList3" , seqMemberNo, rowBounds); 
	}

	@Override
	public int countproduct3(int seqMemberNo) {
		return SqlSession.selectOne("mypage.countproduct3", seqMemberNo);
	}
	
	@Override
	public int countproduct2(int seqMemberNo) {
		return SqlSession.selectOne("mypage.countproduct2", seqMemberNo);
	}

	@Override
	public List<Map<String, Object>> buyList(int cPage, int numPerPage,int seqMemberNo) {
		RowBounds rowbounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return SqlSession.selectList("mypage.buyList", seqMemberNo,rowbounds);
	}

	@Override
	public int countbuy(int seqMemberNo) {
		return SqlSession.selectOne("mypage.countbuy",seqMemberNo);
	}
	
	@Override
	public List<Map<String, Object>> abuyList(int cPage, int numPerPage,int seqMemberNo) {
		RowBounds rowbounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return SqlSession.selectList("mypage.abuyList", seqMemberNo,rowbounds);
	}

	@Override
	public int acountbuy(int seqMemberNo) {
		return SqlSession.selectOne("mypage.acountbuy",seqMemberNo);
	}

	@Override
	public int updateaddress(Member m) {
		int result = 0;
		result = SqlSession.update("mypage.updateaddress",m);
		return result;
	}
	@Override
	public List<Map<String, Object>> coupons(int memberNo) {
		return SqlSession.selectList("mypage.coupons",memberNo);
	}

	@Override
	public int memberAddressUpdate(Member m) {
		return SqlSession.update("mypage.memberAddressUpdate",m);
	}

}
