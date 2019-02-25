package com.kh.spring.customercenter.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.customercenter.model.vo.Board;


@Repository
public class CustomerDaoImpl implements CustomerDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectNewsList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return sqlSession.selectList("cc.selectNewsList" , null , rowBounds);
	}

	@Override
	public int countNewsList() {
		return sqlSession.selectOne("cc.countNewsList");
	}

	@Override
	public int insertNews(Board board) {
		int result = sqlSession.insert("cc.insertNews", board);
		return result;
	}
	
	@Override
	public int updateNews(Board board) {
		int result = sqlSession.update("cc.updateNews",board);
		return result;
	}

	@Override
	public int deleteNews(Board board) {
		int result = sqlSession.delete("cc.deleteNews",board);
		return result;
	}
	
	
	//자주묻는질문 페이지바
	 @Override 
	 public List<Map<String, String>> selectQnaList(int cPage, int numPerPage) { 
		 RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage,numPerPage); 
		 return sqlSession.selectList("cc.selectQnaList" , null ,rowBounds); 
	}
	
	//서치키워드
	@Override
	public List<Map<String, String>> selectSearchList(int cPage, int numPerPage, String searchkeyword) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage,numPerPage);
		return sqlSession.selectList("cc.selectSearchList", searchkeyword, rowBounds);
	}

	@Override
	public int countQnaList(String searchkeyword) {
		return sqlSession.selectOne("cc.countQnaList", searchkeyword);
	}

	@Override
	public List<Board> selectMainList() {
		return sqlSession.selectList("cc.selectMainList");
	}


	
}
