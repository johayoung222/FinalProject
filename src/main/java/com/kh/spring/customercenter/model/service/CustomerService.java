package com.kh.spring.customercenter.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.customercenter.model.vo.Board;




public interface CustomerService {

	List<Map<String, String>> selectNewsList(int cPage, int numPerPage);

	int countNewsList();

	int insertNews(Board board);

	int updateNews(Board board);

	int deleteNews(Board board);
}
