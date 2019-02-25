package com.kh.spring.customercenter.model.service;

import java.util.List;

import java.util.Map;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.customercenter.model.dao.CustomerDao;
import com.kh.spring.customercenter.model.vo.Board;

@Service
public class CustomerServiceImpl implements CustomerService {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	CustomerDao customerDao;

	@Override
	public List<Map<String, String>> selectNewsList(int cPage, int numPerPage) {
		return customerDao.selectNewsList(cPage , numPerPage);
	}

	@Override
	public int countNewsList() {
		return customerDao.countNewsList();
	}

	@Override
	public int insertNews(Board board) {
		int result = 0;
		result = customerDao.insertNews(board);
		return result;
	}

	@Override
	public int updateNews(Board board) {
		int result = 0;
		result = customerDao.updateNews(board);
		return result;
	}

	@Override
	public int deleteNews(Board board) {
		int result = 0;
		result = customerDao.deleteNews(board);
		return result;
	}


	
}
