package com.kh.spring.admin.model.dao;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.auction.model.vo.Auction;
import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.Category;
import com.kh.spring.thing.model.vo.CategoryMacro;
import com.kh.spring.thing.model.vo.ProductIo;
import com.kh.spring.thing.model.vo.Regist;

@Repository
public class AdminDaoImpl implements AdminDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	//회원 리스트 조회----------------------------------------------------------
	@Override
	public List<Map<String, String>> allMember(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.allMember",null, rowBounds);
		return list;
	}
	@Override
	public int countallMember() {
		return sqlSession.selectOne("admin.countallMember");
	}

	@Override
	public List<Map<String, String>> memberSearch(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("admin.memberSearch",map,rowBounds);
	}
	@Override
	public int countmemberSearch(Map<String, String> map) {
		return sqlSession.selectOne("admin.countmemberSearch",map);
	}

	@Override
	public List<Map<String, Object>> memberOne(String memberId) {
		return sqlSession.selectList("admin.memberOne",memberId);
	}
	
	@Override
	public List<Map<String, Object>> couponAll() {
		return sqlSession.selectList("admin.couponAll");
	}

	@Override
	public int updateisAdmin(Map<String, Object> map) {
		return sqlSession.update("admin.updateisAdmin",map);
	}
	
	@Override
	public int couponPlus(Map<String, Object> map) {
		return sqlSession.insert("admin.couponPlus",map);
	}
	
	@Override
	public List<Map<String, Object>> couponList(int memberNo) {
		return sqlSession.selectList("admin.couponList",memberNo);
	}
	
	@Override
	public int deleteCoupon(Map<String, Object> map) {
		return sqlSession.delete("admin.deleteCoupon",map);
	}
	
	@Override
	public int couponAutoDelete() {
		return sqlSession.delete("admin.couponAutoDelete");
	}
	
	
	
	
	//결제된 상품 리스트----------------------------------------------------------------
	@Override
	public List<Map<String, String>> paidProduct(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.paidProduct",null, rowBounds);
		return list;
	}
	@Override
	public int countpaidProduct() {
		return sqlSession.selectOne("admin.countpaidProduct");
	}
	
	@Override
	public List<Map<String, String>> paidAuction(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin.paidAuction",null, rowBounds);
	}
	@Override
	public int countpaidAuction() {
		return sqlSession.selectOne("admin.countpaidAuction");
	}
	
	
	@Override
	public List<Map<String,String>> paidProductSearch(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.paidProductSearch",map,rowBounds);
	}
	@Override
	public int countpaidProductSearch(Map<String, String> map) {
		return sqlSession.selectOne("admin.countpaidProductSearch",map);
	}
	
	@Override
	public List<Map<String, String>> paidAuctionSearch(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.paidAuctionSearch",map,rowBounds);
	}
	@Override
	public int countpaidAuctionSearch(Map<String, String> map) {
		return sqlSession.selectOne("admin.countpaidAuctionSearch",map);
	}

	
	//판매 신청 리스트-----------------------------------------------------------
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

	@Override
	public int insertProduct(Map<String, Object> map) {
		return sqlSession.insert("admin.insertProduct",map);
	}

	@Override
	public void updateRegist(int registNo) {
		sqlSession.update("admin.updateRegist",registNo);
	}
	
	@Override
	public int registAuction(int registNo) {
		return sqlSession.update("admin.registAuction",registNo);
	}
	
	@Override
	public List<Map<String, Object>> registCancel() {
		return sqlSession.selectList("admin.registCancel");
	}
	
	@Override
	public List<Map<String, String>> registList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.registList",null,rowBounds);
	}
	@Override
	public int countpaidregistList() {
		return sqlSession.selectOne("admin.countpaidregistList");
	}
	
	@Override
	public List<Map<String, String>> registListMore(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.registListMore",null,rowBounds);
	}
	@Override
	public int countpaidregistListMore() {
		return sqlSession.selectOne("admin.countpaidregistListMore");
	}
	
	
	
	
	
	
	//상품 리스트--------------------------------------------------------------------
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
	public List<Map<String, String>> productListSearch(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.productListSearch",map,rowBounds);
	}
	@Override
	public int countproductListSearch(Map<String, String> map) {
		return sqlSession.selectOne("admin.countproductListSearch",map);
	}

	
	//경매신청 리스트---------------------------------------------------------------------
	@Override
	public List<Map<String, Object>> auctionRegistList() {
		return sqlSession.selectList("admin.auctionRegistList");
	}
	
	@Override
	public List<Map<String, Object>> auctionRegistOne(int auctionRegistNo) {
		return sqlSession.selectList("admin.auctionRegistOne",auctionRegistNo);
	}
	
	@Override
	public Auction auctionRegistOne1(int auctionRegistNo) {
		return sqlSession.selectOne("admin.auctionRegistOne1",auctionRegistNo);
	}
	
	@Override
	public int inAuction(Map<String, Object> map) {
		return sqlSession.insert("admin.inAuction",map);
	}
	@Override
	public int updateAuctionRegist(int auctionRegistNo) {
		return sqlSession.update("admin.updateAuctionRegist",auctionRegistNo);
	}
	
	@Override
	public int auctionCencel(int auctionRegistNo) {
		return sqlSession.update("admin.auctionCencel",auctionRegistNo);
	}
	
	
	//경매 상품 현황---------------------------------------------------------------------
	@Override
	public List<Map<String, String>> auctionList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.auctionList",rowBounds);
	}
	@Override
	public int countauctionList() {
		return sqlSession.selectOne("admin.countauctionList");
	}
	
	@Override
	public List<Map<String, String>> auctionListSearch(int cPage, int numPerPage, Map<String, String> map) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.auctionListSearch",map,rowBounds);
	}
	@Override
	public int countauctionListSearch(Map<String, String> map) {
		return sqlSession.selectOne("admin.countauctionListSearch",map);
	}
	
	
	//1:1질문 답변-------------------------------------------------------------------
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
	public List<Map<String, String>> questionAnswerY(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);
		return sqlSession.selectList("admin.questionAnswerY",null, rowBounds);
	}
	@Override
	public int countquestionAnswerY() {
		return sqlSession.selectOne("admin.countquestionAnswerY");
	}

	
	
	//사이트 통계 -----------------------------------------------------------
	@Override
	public List<Map<String, Object>> memberGender() {
		return sqlSession.selectList("admin.memberGender");
	}
	@Override
	public List<Map<String, Object>> paidProductCategory() {
		return sqlSession.selectList("admin.paidProductCategory");
	}
	@Override
	public List<Map<String, Object>> registCategory() {
		return sqlSession.selectList("admin.registCategory");
	}
	@Override
	public List<Map<String, Object>> auctionCategory() {
		return sqlSession.selectList("admin.auctionCategory");
	}
	@Override
	public List<Map<String, Object>> questionCategory() {
		return sqlSession.selectList("admin.questionCategory");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	

	

	

	
	

	
	


	



	

	

}
