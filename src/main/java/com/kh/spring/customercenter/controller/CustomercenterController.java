package com.kh.spring.customercenter.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.customercenter.model.service.CustomerService;
import com.kh.spring.customercenter.model.vo.Board;
import com.kh.spring.customercenter.model.vo.Question;
import com.kh.spring.member.model.vo.Member;

@Controller
public class CustomercenterController {

	Logger logger = Logger.getLogger(getClass());

	@Autowired
	CustomerService customerService;

	@RequestMapping("/customercenter/ccintro.do")
	public String customercenterintro() {
		// System.out.println("ccintro메소드가 요청되었습니다.");
		return "customercenter/customercenterintro"; // /WEB-INF/views/demo/demo.jsp
	}

	// @RequestMapping("/customercenter/ccnews.do")
	// public String customercenternews() {
	// System.out.println("ccnews메소드가 요청되었습니다.");
	// return "customercenter/customercenternews"; // /WEB-INF/views/demo/demo.jsp
	// }

	//@RequestMapping("/customercenter/ccinquiry.do")
	//public String customercenterinquiry() {
		// System.out.println("ccinquiry메소드가 요청되었습니다.");
	//	return "customercenter/customercenterinquiry"; // /WEB-INF/views/demo/demo.jsp
	//}

	//	@RequestMapping("/customercenter/ccqna.do")
	//	public String customercenternewsqna() {
	//		//System.out.println("ccqna메소드가 요청되었습니다.");
	//		return "customercenter/customercenterqna";	//	/WEB-INF/views/demo/demo.jsp
	//	}
	//////////////////////////////////////////////////////////////////////////////////////
	
	//공지사항 페이지 리스트
	@RequestMapping("/customercenter/ccnews.do")
	public ModelAndView selectBoardList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			ModelAndView mav) {

		int numPerPage = 5;
		// 업무로직
		// 1.게시글 리스트(페이징적용)
		List<Map<String, String>> list = customerService.selectNewsList(cPage, numPerPage);
		logger.debug("list==" + list);

		// 2.전체컨텐츠수
		int totalContents = customerService.countNewsList();
		logger.debug("totalC==" + totalContents);

		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("customercenter/customercenternews");

		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);

		return mav;
	}

	// 관리자일시 공지사항등록
	@RequestMapping("/customercenter/insertNews.do")
	public ModelAndView insertNews(Board board, ModelAndView mav) {

		logger.debug("board=" + board);

		// 2. 업무로직
		int result = customerService.insertNews(board);
		logger.debug("cont result" + result);

		// 3. 뷰단처리
		String loc = "/customercenter/ccnews.do";
		String msg = "";

		if (result > 0) {
			msg = "게시물 등록 성공";
		} else {
			msg = "게시물 등록 실패";
		}

		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");

		return mav;
	}
	//공지사항 수정
	@RequestMapping("/customercenter/updateNews.do")
	public ModelAndView updateNews(Board board, ModelAndView mav) {
		// logger.debug("board="+board);

		int result = customerService.updateNews(board);
		logger.debug("cont result" + result);

		// 3. 뷰단처리
		String loc = "/customercenter/ccnews.do";
		String msg = "";

		if (result > 0) {
			msg = "게시물 수정 성공";
		} else {
			msg = "게시물 수정 실패";
		}

		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");

		return mav;
	}
	
	//공지사항 삭제
	@RequestMapping("/customercenter/deleteNews.do")
	public ModelAndView deleteNews(Board board, ModelAndView mav) {
		logger.debug("board=" + board);

		int result = customerService.deleteNews(board);
		logger.debug("cont1 result" + result);

		String loc = "/customercenter/ccnews.do";
		String msg = "";

		if (result > 0) {
			msg = "게시물 삭제 성공";
		} else {
			msg = "게시물 삭제 실패";
		}

		mav.addObject("loc", loc);
		mav.addObject("msg", msg);
		mav.setViewName("common/msg");

		return mav;
	}
	
	//자주묻는질문--------------------------------------------------------------------------------------------
	
	//자주묻는질문페이지 리스트
	@RequestMapping("/customercenter/ccqna.do")
	public ModelAndView selectQnaList(@RequestParam(value = "cPage", defaultValue = "1") int cPage,
			ModelAndView mav) {

		int numPerPage = 9;
		//업무로직 
		//1.게시글 리스트(페이징적용)
		List<Map<String, String>> list = customerService.selectQnaList(cPage, numPerPage);
		logger.debug("list==" + list);

		//2.전체컨텐츠수
		mav.addObject("list", list);
		mav.setViewName("customercenter/customercenterqna");

		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);

		return mav;
	}
	
	//키워드 검색
	@RequestMapping("/customercenter/searchKeyword.do")
	public ModelAndView seachKeyword(ModelAndView mav,
									 @RequestParam(name="searchkeyword") String searchkeyword,
									 @RequestParam(value = "cPage", defaultValue = "1") int cPage) {
		int numPerPage = 5;
		logger.debug("keyword=="+searchkeyword);
		//업무로직 
		//1.게시글 리스트(페이징적용)
		List<Map<String, String>> list = customerService.selectSearchList(cPage, numPerPage,searchkeyword);
		logger.debug("list==" + list);

		//2.전체컨텐츠수
		int totalContents = customerService.countQnaList(searchkeyword);
		logger.debug("totalC==" + totalContents);
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("customercenter/searchKeyword");

		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		mav.addObject("searchkeyword",searchkeyword);
		return mav;
	}

	/* 사용법카테고리 */
	@RequestMapping("/customercenter/mainTutorial.do")
	public ModelAndView mainTutorial(ModelAndView mav,
									@RequestParam(value = "cPage", defaultValue = "1") int cPage) {
		int numPerPage = 5;
		//업무로직 
		//1.게시글 리스트(페이징적용)
		List<Map<String, String>> list = customerService.selectTutorialList(cPage, numPerPage);
		logger.debug("list==" + list);
		
		//2.전체컨텐츠수
		int totalContents = customerService.countTutorialList();
		//logger.debug("totalC==" + totalContents);
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("customercenter/searchKeyword");
		
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		return mav;
	} 

	/* 구매카테고리 */
	@RequestMapping("/customercenter/buyTutorial.do")
	public ModelAndView buyTutorial(ModelAndView mav,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage) {
		int numPerPage = 5;
		//업무로직 
		//1.게시글 리스트(페이징적용)
		List<Map<String, String>> list = customerService.selectbuyTutorialList(cPage, numPerPage);
		logger.debug("list==" + list);
		
		//2.전체컨텐츠수
		int totalContents = customerService.countbuyTutorialList();
		//logger.debug("totalC==" + totalContents);
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("customercenter/searchKeyword");
		
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		return mav;
	} 

	/* 판매카테고리 */
	@RequestMapping("/customercenter/sellTutorial.do")
	public ModelAndView sellTutorial(ModelAndView mav,
			@RequestParam(value = "cPage", defaultValue = "1") int cPage) {
		int numPerPage = 5;
		//업무로직 
		//1.게시글 리스트(페이징적용)
		List<Map<String, String>> list = customerService.selectsellTutorialList(cPage, numPerPage);
		logger.debug("list==" + list);
		
		//2.전체컨텐츠수
		int totalContents = customerService.countsellTutorialList();
		//logger.debug("totalC==" + totalContents);
		
		mav.addObject("totalContents", totalContents);
		mav.addObject("list", list);
		mav.setViewName("customercenter/searchKeyword");
		
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		return mav;
	} 
	
	/* 질문 상세페이지 */
	@RequestMapping("/customercenter/qnamain.do")
	public ModelAndView qnaMain(Board board,ModelAndView mav,@RequestParam(name="seq_board_no") int seq_board_no) {
		
		logger.debug("+=+"+board);
		logger.debug("seq_board_no"+seq_board_no);
		board.setSeq_board_no(seq_board_no);
		board = customerService.selectQnaMain(board);
		
		
		mav.addObject("seq_board_no", seq_board_no);
		mav.addObject("board",board);
		mav.setViewName("customercenter/qnaMain");
		return mav;
	}
	
	// 관리자일시 자주 묻는 질문 등록
		@RequestMapping("/customercenter/insertQna.do")
		public ModelAndView insertQna(Board board,
									  @RequestParam(name="catradio") String catradio,
									  ModelAndView mav) {

			logger.debug("board=" + board);
			logger.debug("catradio=" + catradio);
			
			board.setBoardkinds(catradio);

			// 2. 업무로직
			int result = customerService.insertQna(board);
			logger.debug("result" + result);

			// 3. 뷰단처리
			String loc = "/customercenter/ccqna.do";
			String msg = "";

			if (result > 0) {
				msg = "게시물 등록 성공";
			} else {
				msg = "게시물 등록 실패";
			}

			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");

			return mav;
		}
		//자주묻는질문 수정
		@RequestMapping("/customercenter/updateQna.do")
		public ModelAndView updateQna(Board board, ModelAndView mav,@RequestParam(name="seq_board_no") int seq_board_no) {
			logger.debug("upboard="+board);

			int result = customerService.updateQna(board);
			logger.debug("cont result" + result);

			// 3. 뷰단처리
			String loc = "/customercenter/qnamain.do?seq_board_no="+seq_board_no;
			String msg = "";

			if (result > 0) {
				msg = "게시물 수정 성공";
			} else {
				msg = "게시물 수정 실패";
			}

			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");

			return mav;
		}
		
		//자주묻는질문 삭제
		@RequestMapping("/customercenter/deleteQna.do")
		public ModelAndView deleteQna(Board board, ModelAndView mav) {
			logger.debug("delboard=" + board);

			int result = customerService.deleteNews(board);

			String loc = "/customercenter/ccqna.do";
			String msg = "";

			if (result > 0) {
				msg = "게시물 삭제 성공";
			} else {
				msg = "게시물 삭제 실패";
			}

			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");

			return mav;
		}
	//1:1문의-----------------------------------------------------------------------------------------
		@RequestMapping("/customercenter/ccinquiry.do")
		public ModelAndView selectinquiryList(HttpSession session,
											  ModelAndView mav) {
			Member m = (Member)session.getAttribute("memberLoggedIn");
			Question q = new Question();
			q.setSeq_member_no(m.getSeqMemberNo());
			logger.debug("1234==="+m);
			// 업무로직
			// 1.게시글 리스트(페이징적용)
			List<Map<String, String>> list = customerService.selectinquiryList(q);
			logger.debug("list==" + list);

			mav.addObject("list", list);
			mav.setViewName("customercenter/customercenterinquiry");

			return mav;
		}
		
		
		@RequestMapping("/customercenter/insertInquiry.do")
		public ModelAndView insertInquiry(ModelAndView mav,
										  @RequestParam(name="selone") String selone,
										  @RequestParam(name="seltwo") String seltwo,
										  @RequestParam(name="incontent") String incontent,
										  @RequestParam(name="seq_member_no") int seq_member_no) {
		/*
		 * logger.debug("1234---"+selone); logger.debug("1234---"+seltwo);
		 * logger.debug("1234---"+incontent); logger.debug("1234---"+seq_member_no);
		 */
			
			
			Question q = new Question();
			q.setQuestion_lkinds(selone);
			q.setQuestion_mkinds(seltwo);
			q.setQuestion_content(incontent);
			q.setSeq_member_no(seq_member_no);
			
			int result = customerService.insertInquiry(q);
			
			String loc = "/customercenter/ccinquiry.do";
			String msg = "";

			if (result > 0) {
				msg = "1:1문의 등록을 완료하였습니다 답변을 기다려주세요~ :)";
			} else {
				msg = "1:1문의 실패";
			}
			
			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");
			
			return mav;
		}
		@RequestMapping("/customercenter/insertAnswer.do")
		public ModelAndView insertAnswer(ModelAndView mav,
										 @RequestParam(name="question_answer") String question_answer,
										 @RequestParam(name="seq_member_no") int seq_member_no,
										 @RequestParam(name="seq_question_no") int seq_question_no) {
			Question q = new Question();
			q.setSeq_question_no(seq_question_no);
			q.setSeq_member_no(seq_member_no);
			q.setQuestion_answer(question_answer);
			
			int result = customerService.insertAnswer(q);
			
			String loc = "/admin/questionAnswer.do";
			String msg = "";
			if (result > 0) {
				msg = "1:1문의 답변을 등록 하였습니다~ :)";
			} else {
				msg = "1:1문의  답변 실패";
			}
			
			mav.addObject("q",q); 
			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");
			return mav;

		}
		
		
	

}
