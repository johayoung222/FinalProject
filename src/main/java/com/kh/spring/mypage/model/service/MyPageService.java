package com.kh.spring.mypage.model.service;

import java.util.List;

import com.kh.spring.member.model.vo.Member;
import com.kh.spring.thing.model.vo.ProductIo;

public interface MyPageService {

	int updatephone(Member m);

	int updateemail(Member m);

	List<String> sellList(ProductIo pi);
}
