package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

@Repository
public class BoardDaoImpl implements BoardDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		RowBounds rowBounds = new RowBounds((cPage-1) * numPerPage, numPerPage);
		return sqlSession.selectList("board.selectBoardList" , null , rowBounds);
	}

	@Override
	public int countBoardList() {
		return sqlSession.selectOne("board.countBoardList");
	}

	@Override
	public int insertBoard(Board board) {
		int result = sqlSession.insert("board.insertBoard", board);
		return result;
	}

	@Override
	public int insertAttachment(Attachment a) {
		int result = sqlSession.insert("board.insertAttachment",a);
		return result;
	}

	@Override
	public Board selectOne(int boardNo) {
		Board board = sqlSession.selectOne("board.selectOne", boardNo);
		return board;
	}

	@Override
	public List<Attachment> selectList(int boardNo) {
		List<Attachment> attachmentList = sqlSession.selectList("board.selectAttachmentList", boardNo);
		return attachmentList;
	}
	
}
