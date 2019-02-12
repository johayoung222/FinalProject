package com.kh.spring.board.model.service;

import java.util.List;
import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.board.model.dao.BoardDao;
import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;

@Service
public class BoardServiceImpl implements BoardService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BoardDao boardDao;

	@Override
	public List<Map<String, String>> selectBoardList(int cPage, int numPerPage) {
		return boardDao.selectBoardList(cPage , numPerPage);
	}

	@Override
	public int countBoardList() {
		return boardDao.countBoardList();
	}

	@Override
	@Transactional(rollbackFor=Exception.class)
	public int insertBoard(Board board, List<Attachment> attachList) {
		int result = 0;
		int boardNo = 0;
		
		//1. 게시판 테이블 등록
		result = boardDao.insertBoard(board);
		boardNo = board.getBoardNo();
		logger.debug("boardNo ="+boardNo);
		
		if(result==0) {
			throw new BoardException("게시판 등록 오퓨");
		}
		//2. 첨부파일 테이블 등록
		if(attachList.size()>0) {
			for(Attachment a : attachList) {
				//fk boardNo 셋팅
				a.setBoardNo(boardNo);
				result = boardDao.insertAttachment(a);
				if(result==0) {
					throw new BoardException("첨부파일 등록 오류");
				}
			}
		}
		
		return boardNo;
	}

	@Override
	public Board selectOne(int boardNo) {
		return boardDao.selectOne(boardNo);
	}

	@Override
	public List<Attachment> selectList(int boardNo) {
		return boardDao.selectList(boardNo);
	}
}
