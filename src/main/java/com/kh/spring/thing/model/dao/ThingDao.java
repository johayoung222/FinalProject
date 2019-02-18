package com.kh.spring.thing.model.dao;

import java.util.List;

import com.kh.spring.thing.model.vo.Category;

public interface ThingDao {

	List<Category> selectCategorys();

}
