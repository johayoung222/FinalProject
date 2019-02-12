package com.kh.spring.member.model.dao;

import com.kh.spring.member.model.vo.Member;

public interface MemberDao {

	int insertMember(Member m);

	Member selectOneMember(String memberId);

	int memberUpdate(Member temp);

}
