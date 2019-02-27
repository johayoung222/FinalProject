package com.kh.spring.basket.model.dao;

import java.util.List;
import java.util.Map;

public interface BasketDao {

	List<Map<String, String>> basketList(int cPage, int numPerPage);

	int countbasketList();

}
