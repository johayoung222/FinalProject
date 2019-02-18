package com.kh.spring.admin.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.thing.model.vo.ProductIo;

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
	public List<Map<String, String>> idSearch(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);				
		return sqlSession.selectList("admin.idSearch",search,rowBounds);
	}
	
	@Override
	public int countidSearch(String search) {
		return sqlSession.selectOne("admin.countidSearch",search);
	}

	@Override
	public List<Map<String, String>> nameSearch(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage, numPerPage);				
		return sqlSession.selectList("admin.nameSearch",search,rowBounds);
	}

	@Override
	public int countnameSearch(String search) {
		return sqlSession.selectOne("admin.countnameSearch",search);
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
	public List<Map<String, String>> paidProductNameSerach(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin.paidProductNameSerach",search, rowBounds);
	}
	
	@Override
	public int countpaidProductNameSerach(String search) {
		return sqlSession.selectOne("admin.countpaidProductNameSerach",search);
	}

	@Override
	public List<Map<String, String>> paidProductBuyerSerach(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin.paidProductBuyerSerach",search, rowBounds);
	}
	
	@Override
	public int countpaidProductBuyerSerach(String search) {
		return sqlSession.selectOne("admin.countpaidProductBuyerSerach",search);
	}

	@Override
	public List<Map<String, String>> paidProductCategorySerach(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return sqlSession.selectList("admin.paidProductCategorySerach",search, rowBounds);
	}
	
	@Override
	public int countpaidProductCategorySerach(String search) {
		return sqlSession.selectOne("admin.countpaidProductCategorySerach",search);
	}

	@Override
	public int countpaidProduct() {
		return sqlSession.selectOne("admin.countpaidProduct");
	}

	@Override
	public List<Map<String, String>> regist(int cPage, int numPerPage) {
		//System.out.println("Dao regist cPage :"+cPage+", "+numPerPage);
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		List<Map<String, String>> list = sqlSession.selectList("admin.regist",null, rowBounds);
		//System.out.println("Dao regist list : "+list);
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
	public List<Map<String, String>> productListNameSearch(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.productListNameSearch",search,rowBounds);
	}

	@Override
	public int countproductListNameSearch(String search) {
		return sqlSession.selectOne("admin.countproductListNameSearch",search);
	}

	@Override
	public List<Map<String, String>> productListOnsaleSearch(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.productListOnsaleSearch",search,rowBounds);
	}

	@Override
	public int countproductListOnsaleSearch(String search) {
		return sqlSession.selectOne("admin.countproductListOnsaleSearch",search);
	}

	@Override
	public List<Map<String, String>> productListManufacturerSearch(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.productListManufacturerSearch",search,rowBounds);
	}

	@Override
	public int countproductListManufacturerSearch(String search) {
		return sqlSession.selectOne("admin.countproductListManufacturerSearch",search);
	}

	@Override
	public List<Map<String, String>> productListCategorymiSearch(String search, int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1)*numPerPage,numPerPage);
		return sqlSession.selectList("admin.productListCategorymiSearch",search,rowBounds);
	}

	@Override
	public int countproductListCategorymiSearch(String search) {
		return sqlSession.selectOne("admin.countproductListCategorymiSearch",search);
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



	

	

}
