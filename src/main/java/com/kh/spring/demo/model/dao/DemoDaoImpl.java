package com.kh.spring.demo.model.dao;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.demo.model.vo.Dev;

@Repository
public class DemoDaoImpl implements DemoDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertDev(Dev dev) {
		return sqlSession.insert("demo.insertDev" , dev);
	}

	@Override
	public List<Dev> selectDemoList() {
		return sqlSession.selectList("demo.selectDemoList");
	}

	@Override
	public int deleteDemo(int no) {
		return sqlSession.delete("demo.deleteDemo" , no);
	}
}
