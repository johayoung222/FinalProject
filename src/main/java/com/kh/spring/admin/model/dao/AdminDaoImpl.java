package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> allMember(int cPage, int numPerPage) {
		System.out.println("Dao allMember cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.allMember",null, rowBounds);
		System.out.println("Dao allMember list : "+list);
		return list;
	}

	@Override
	public int countallMember() {
		return sqlSession.selectOne("admin.countallMember");
	}

	@Override
	public List<Map<String, String>> paidProduct(int cPage, int numPerPage) {
		System.out.println("Dao paidProduct cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.paidProduct",null, rowBounds);
		System.out.println("Dao paidProduct list : "+list);
		return list;
	}

	@Override
	public int countpaidProduct() {
		return sqlSession.selectOne("admin.countpaidProduct");
	}

	@Override
	public List<Map<String, String>> regist(int cPage, int numPerPage) {
		System.out.println("Dao regist cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.regist",null, rowBounds);
		System.out.println("Dao regist list : "+list);
		return list;
	}

	@Override
	public int countregist() {
		return sqlSession.selectOne("admin.countregist");
	}

	@Override
	public List<Map<String, String>> productList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.productList",null,rowBounds);
	}

	@Override
	public int countproductList() {
		return sqlSession.selectOne("admin.countproductList");
	}

	@Override
	public List<Map<String, String>> questionAnswer(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("admin.questionAnswer",null, rowBounds);
	}

	@Override
	public int countquestionAnswer() {
		return sqlSession.selectOne("admin.countquestionAnswer");
	}

}
