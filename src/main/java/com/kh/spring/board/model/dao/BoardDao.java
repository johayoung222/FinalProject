package com.kh.spring.board.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

public interface BoardDao {

	List<Map<String, String>> selectBoardList(int cPage, int numPerPage);

	int countBoardList();

	int insertBoard(Board board);

	int insertAttachment(Attachment a);

	Board selectOne(int boardNo);

	List<Attachment> selectList(int boardNo);
}
