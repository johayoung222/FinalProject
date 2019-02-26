package com.kh.spring.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.ProductIo;
import com.kh.spring.thing.model.vo.Regist;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> allMember(int cPage, int numPerPage) {
		//System.out.println("Dao allMember cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.allMember",null, rowBounds);
		//System.out.println("Dao allMember list : "+list);
		return list;
	}
	
	@Override
	public int countallMember() {
		return sqlSession.selectOne("admin.countallMember");
	}

	@Override
	public List<Map<String, String>> paidProduct(int cPage, int numPerPage) {
		//System.out.println("Dao paidProduct cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.paidProduct",null, rowBounds);
		//System.out.println("Dao paidProduct list : "+list);
		return list;
	}
	
	@Override
	public int countpaidProduct() {
		return sqlSession.selectOne("admin.countpaidProduct");
	}

	@Override
	public List<Map<String, Object>> regist(int cPage, int numPerPage) {
		//System.out.println("Dao regist cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, Object>> list = sqlSession.selectList("admin.regist",null, rowBounds);
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

	@Override
	public List<Map<String, String>> auctionStatus(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("admin.auctionStatus",null, rowBounds);
	}

	@Override
	public int countauctionStatus() {
		return sqlSession.selectOne("admin.countauctionStatus");
	}

	@Override
	public List<Map<String, String>> reportList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("admin.reportList",null, rowBounds);
	}

	@Override
	public int countreportList() {
		return sqlSession.selectOne("admin.countreportList");
	}

	@Override
	public int countpaidProductSearch2(Map<String, String> map) {
		return sqlSession.selectOne("admin.countpaidProductSearch2");
	}

	@Override
	public List<ProductIo> paidProductSearch(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.paidProductSearch",map,rowBounds);
	}

	@Override
	public List<CategoryMacro> categoryMa() {
		return sqlSession.selectList("admin.categoryMa");
	}

	@Override
	public List<Category> categoryMi(String macro) {
		return sqlSession.selectList("admin.categoryMi",macro);
	}

	@Override
	public List<Map<String, Object>> registOne(int registNo) {
		List<Map<String, Object>> list = sqlSession.selectList("admin.registOne",registNo);
		//System.out.println("Dao regist list : "+list);
		return list; 
	}

	@Override
	public Regist registOne1(int registNo) {
		return sqlSession.selectOne("admin.registOne1",registNo);
	}

	

	
	


	



	

	

}
