package com.kh.spring.basket.model.service;

import java.util.List;
import java.util.Map;

public interface BasketService{

	List<Map<String, String>> basketList(int cPage, int numPerPage);

	int countbasketList();

}
