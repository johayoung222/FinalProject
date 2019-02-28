package com.kh.spring.category.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.thing.model.vo.Regist;

public interface CategoryDao {

	List<Regist> laptopPcEnd();

	List<Map<String, String>> selectMacro();

}
