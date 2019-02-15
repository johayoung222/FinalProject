package com.kh.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.kh.spring.member.model.vo.Member;

@Repository
public class MemberDaoImpl implements MemberDao {

	@Autowired
	SqlSessionTemplate SqlSession;
	
	@Override
	public int insertMember(Member m) {
		return SqlSession.insert("member.insertMember" , m);
	}

	@Override
	public Member selectOneMember(String memberId) {
		return SqlSession.selectOne("member.selectOneMember", memberId);
	}

	@Override
	public int memberUpdate(Member temp) {
		return SqlSession.update("member.memberUpdate" , temp);
	}

	@Override
	public List<Map<String, String>> selectAllCategory() {
		List<Map<String,String>> list = SqlSession.selectList("system.selectAllCategory");
		System.out.println(list);
		return list;
	}

	@Override
	public int insertFaceBookMember(Member m) {
		// TODO Auto-generated method stub
		return SqlSession.insert("member.insertFaceBookMember" , m);
	}

}
