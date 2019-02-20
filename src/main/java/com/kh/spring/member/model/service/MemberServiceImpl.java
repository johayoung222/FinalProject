package com.kh.spring.member.model.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

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

	@Override
	public List<Map<String, String>> selectAllCategory() {
		return memberDao.selectAllCategory();
	}

	
	@Override
	public int insertFacebookMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.insertFaceBookMember(m);
	}

	@Override
	public int insertMember(ModelAndView mav) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public Member selectOneFBMember(String fbIdcheck) {
		// TODO Auto-generated method stub
		return memberDao.selectOneFBMember(fbIdcheck);
	}

	@Override
	public Member selectOnekakaoMember(String kIdcheck) {
		// TODO Auto-generated method stub
		return memberDao.selectOnekakaoMember(kIdcheck);
	}

	@Override
	public int insertKakaoMember(Member m) {
		// TODO Auto-generated method stub
		return memberDao.insertKakaoMember(m);
	}

	
	

}
