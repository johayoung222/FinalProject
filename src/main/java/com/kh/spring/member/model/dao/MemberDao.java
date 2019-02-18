package com.kh.spring.member.model.dao;

import java.util.List;
import java.util.Map;

import com.kh.spring.member.model.vo.Member;

public interface MemberDao {

	int insertMember(Member m);

	Member selectOneMember(String memberId);

	int memberUpdate(Member temp);

	List<Map<String, String>> selectAllCategory();

	int insertFaceBookMember(Member m);

}
