package com.kh.spring.member.model.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kh.spring.member.model.dao.MemberDao;
import com.kh.spring.member.model.vo.Member;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	MemberDao memberDao;
	
	@Override
	public int insertMember(Member m) {
		return memberDao.insertMember(m);
	}

	@Override
	public Member selectOneMember(String memberId) {
		return memberDao.selectOneMember(memberId);
	}

	@Override
	public int memberUpdate(Member temp) {
		return memberDao.memberUpdate(temp);
	}

}
