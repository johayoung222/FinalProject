package com.kh.spring.customercenter.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.customercenter.model.vo.Board;




public interface CustomerDao {

	List<Map<String, String>> selectNewsList(int cPage, int numPerPage);

	int countNewsList();

	int insertNews(Board board);

	int updateNews(Board board);

	int deleteNews(Board board);

	List<Map<String, String>> selectQnaList(int cPage, int numPerPage);

	List<Map<String, String>> selectSearchList(int cPage, int numPerPage, String searchkeyword);

	int countQnaList(String searchkeyword);

	List<Board> selectMainList();

}
