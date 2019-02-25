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
		return sqlSession.selectList("news.selectNewsList" , null , rowBounds);
	}

	@Override
	public int countNewsList() {
		return sqlSession.selectOne("news.countNewsList");
	}

	@Override
	public int insertNews(Board board) {
		int result = sqlSession.insert("news.insertNews", board);
		return result;
	}
	
	@Override
	public int updateNews(Board board) {
		int result = sqlSession.update("news.updateNews",board);
		return result;
	}

	@Override
	public int deleteNews(Board board) {
		int result = sqlSession.delete("news.deleteNews",board);
		return result;
	}


	
}
