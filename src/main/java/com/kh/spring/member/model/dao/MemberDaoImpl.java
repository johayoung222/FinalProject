package com.kh.spring.member.model.dao;

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

}
