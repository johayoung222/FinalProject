package com.kh.spring.customercenter.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.customercenter.model.vo.Board;
import com.kh.spring.customercenter.model.vo.Question;
import com.kh.spring.member.model.vo.Member;




public interface CustomerService {

	List<Map<String, String>> selectNewsList(int cPage, int numPerPage);

	int countNewsList();

	int insertNews(Board board);

	int updateNews(Board board);

	int deleteNews(Board board);

	List<Map<String, String>> selectQnaList(int cPage, int numPerPage);

	List<Map<String, String>> selectSearchList(int cPage, int numPerPage, String searchkeyword);

	int countQnaList(String searchkeyword);

	List<Board> selectMainList();

	Board selectQnaMain(Board board);

	List<Map<String, String>> selectTutorialList(int cPage, int numPerPage);

	int countTutorialList();

	List<Map<String, String>> selectbuyTutorialList(int cPage, int numPerPage);
	
	int countbuyTutorialList();
	
	List<Map<String, String>> selectsellTutorialList(int cPage, int numPerPage);
	
	int countsellTutorialList();

	int insertQna(Board board);

	int updateQna(Board board);

	int deleteQna(Board board);

	int insertInquiry(Question q);

	List<Map<String, String>> selectinquiryList(Question q);


}
