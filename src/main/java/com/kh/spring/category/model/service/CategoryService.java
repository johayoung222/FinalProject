package com.kh.spring.category.model.service;

import java.util.List;
import java.util.Map;

import com.kh.spring.thing.model.vo.Regist;

public interface CategoryService {

	List<Regist> laptopPcEnd();

	List<Map<String, String>> selectMacro();

	List<String> MainAuctionSelect();

}
