package com.kh.spring.mypage.model.dao;

import com.kh.spring.member.model.vo.Member;

public interface MyPageDao {

	int updatephone(Member m);

	int updateemail(Member m);

}
