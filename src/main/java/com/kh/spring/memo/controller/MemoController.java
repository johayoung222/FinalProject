package com.kh.spring.memo.controller;

import java.util.List;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.kh.spring.memo.model.service.MemoService;
import com.kh.spring.memo.model.vo.Memo;

@Controller
public class MemoController {

	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	MemoService memoService;

	@Autowired
	BCryptPasswordEncoder bcryptPasswordEncoder;
	
	@RequestMapping("/memo/memo.do")
	public String memo(Model model) {
		List<Memo> list = memoService.selectMemoList();
		model.addAttribute("list" , list);
		return "memo/memo";
	}
	
	@RequestMapping("/memo/insertMemo.do")
	public String insertMemo(Memo memo) {
		int result = memoService.insertMemo(memo);
		System.out.println(result>0?"메모등록성공":"메모등록실패");	
		return "redirect:/memo/memo.do";
	}
	
	@RequestMapping("/memo/deleteMemo.do")
	public String deleteMemo(@RequestParam int no , @RequestParam String password) {
		Memo memo = new Memo();
		memo.setMemoNo(no);
		memo.setPassword(password);
		int result = memoService.deleteMemo(memo);
		System.out.println(result > 0?"메모삭제성공":"메모삭제실패");
		return "redirect:/memo/memo.do";
	}
}
