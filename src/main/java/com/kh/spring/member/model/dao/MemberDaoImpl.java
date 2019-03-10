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
	SqlSessionTemplate sqlSession;
	
	@Override
	public int insertMember(Member m) {
		return sqlSession.insert("member.insertMember" , m);
	}

	@Override
	public Member selectOneMember(String memberId) {
		return sqlSession.selectOne("member.selectOneMember", memberId);
	}

	@Override
	public int memberUpdate(Member temp) {
		return sqlSession.update("member.memberUpdate" , temp);
	}

	@Override
	public List<Map<String, String>> selectAllCategory() {
		List<Map<String,String>> list = sqlSession.selectList("system.selectAllCategory");
		System.out.println(list);
		return list;
	}

	@Override
	public int insertFaceBookMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertFaceBookMember" , m);
	}

	@Override
	public Member selectOneFBMember(String fbIdcheck) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMember", fbIdcheck);
	}

	@Override
	public Member selectOnekakaoMember(String kIdcheck) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMember",kIdcheck);
	}

	@Override
	public int insertKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertKakaoMember" , m);
	}

	@Override
	public int insertgoogleMember(Member m) {
		// TODO Auto-generated method stub
		return sqlSession.insert("member.insertgoogleMember",m);
		
	}

	@Override
	public Member selectOnegoogleMember(String gIdcheck) {
		// TODO Auto-generated method stub
		return sqlSession.selectOne("member.selectOneMember",gIdcheck);
	}

	@Override
	public int updatePhone(Member member) {
		int result = 0;
		result = sqlSession.update("member.updatePhone",member);
		return result;
	}

	@Override
	public String selectmemberId(String memberEmail) {
		return sqlSession.selectOne("member.selectmemberId", memberEmail);
	}

	@Override
	public int countmember(Member m) {
		return sqlSession.selectOne("member.countmember",m);
	}

	@Override
	public int updatePwd(Member m) {
		return sqlSession.update("member.updatePwd",m);
	}

	@Override
	public int countmemberId(Member m) {
		return sqlSession.selectOne("member.countmemberId",m);
	}

	@Override
	public int updateItr(Map<String, String> map) {
		return sqlSession.update("member.updateItr", map);
	}

	

}
