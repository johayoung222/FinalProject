package com.kh.spring.category.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.thing.model.vo.Regist;

@Repository
public class CategoryDaoImpl implements CategoryDao {
	@Autowired
	SqlSessionTemplate sqlSession;
	
	
	@Override
	public List<Regist> laptopPcEnd() {
		return sqlSession.selectList("regist.laptopPcEnd");
	}


	@Override
	public List<Map<String, String>> selectMacro() {
		return sqlSession.selectList("product.selectAll");
	}

}
