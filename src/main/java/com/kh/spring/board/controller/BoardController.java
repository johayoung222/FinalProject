package com.kh.spring.board.controller;

import java.io.BufferedInputStream;
import java.io.BufferedOutputStream;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import javax.servlet.ServletOutputStream;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.kh.spring.board.model.exception.BoardException;
import com.kh.spring.board.model.service.BoardService;
import com.kh.spring.board.model.vo.Attachment;
import com.kh.spring.board.model.vo.Board;
import com.kh.spring.common.util.Utils;

@Controller
public class BoardController {
	Logger logger = Logger.getLogger(getClass());
	
	@Autowired
	BoardService boardService;
	
	@RequestMapping("/board/boardList.do")
	public ModelAndView selectBoardList(@RequestParam(value="cPage" , defaultValue="1") int cPage ,
										ModelAndView mav ,
										HttpServletRequest request) {
		if(logger.isDebugEnabled()) {
			logger.debug("게시판 목록페이지");
		}
		
		int numPerPage = 5;
		// 업무로직
		// 1. 게시글리스트(페이징 적용)
		List<Map<String , String>> list = boardService.selectBoardList(cPage , numPerPage);
		logger.debug("list : "+list);
		
		// 2. 전체컨텐츠수
		int totalContents = boardService.countBoardList();
		mav.addObject("totalContents" , totalContents);
		mav.addObject("list" , list);
		mav.setViewName("board/boardList");
		
		// 페이지바 처리하기 위한 소스코드
		mav.addObject("totalContents", totalContents);
		mav.addObject("cPage", cPage);
		mav.addObject("numPerPage", numPerPage);
		
		return mav;
	}

	@RequestMapping("/board/boardForm.do")
	public void boardForm() {
		/* return "board/boardForm"; */
		//ViewTranslator에서 요청 url로 부터 view단 파일경로를 유추
	}
	
	@RequestMapping("/board/insertBoard.do")
	public ModelAndView insertBoard(Board board , @RequestParam(name="upFile",required=false) MultipartFile [] upFiles,HttpServletRequest req,ModelAndView mav) {
		
		logger.debug("board="+board);
		for(int i = 0 ; i<upFiles.length ; i++) {			
			logger.debug("fileName="+upFiles[i].getOriginalFilename());
			logger.debug("size="+upFiles[i].getSize());
		}
		
		try{
			//1. 파일업로드
			String saveDirectory = req.getSession().getServletContext().getRealPath("/resources/upload/board");
			logger.debug("saveDirectory = "+saveDirectory);
			
			List<Attachment> attachList = new ArrayList<>();
			
			//MultipartFile 처리
			
			for(MultipartFile f : upFiles) {
				if(!f.isEmpty()) {
					//파일명(업로드)
					String originalFileName = f.getOriginalFilename();
					
					//파일명(서버저장용)
					String renamedFileName = Utils.getRenamedFileName(originalFileName);
					logger.debug("renamedFileName ="+renamedFileName);
					//실제 서버에 파일저장
					try {
						f.transferTo(new File(saveDirectory+"/"+renamedFileName));
					} catch (IllegalStateException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					} catch (IOException e) {
						// TODO Auto-generated catch block
						e.printStackTrace();
					}
					
					//첨부파일 객체 생성. 리스트에 추가
					Attachment attach = new Attachment();
					attach.setOriginalFileName(originalFileName);
					attach.setRenamedFileName(renamedFileName);
					attachList.add(attach);
				}
			}
			
			//2. 업무로직
			int result = boardService.insertBoard(board,attachList);
			
			//3. 뷰단처리
			String loc = "/board/boardList.do";
			String msg = "";
			
			if(result>0) {
				msg = "게시물 등록 성공";
			}else {
				msg= "게시물 등록 실패";
			}
			
			
			mav.addObject("loc", loc);
			mav.addObject("msg", msg);
			mav.setViewName("common/msg");
		} catch(Exception e) {
			logger.error("게시물 등록 에러",e);
			throw new BoardException("게시물 등록 에러",e);
		}
		
		return mav;
		
	}
	
	@RequestMapping("/board/boardView.do")
	public ModelAndView boardView(ModelAndView mav, @RequestParam(value="boardNo") int boardNo) {
		
		//board 객체 가져오기
		Board board = boardService.selectOne(boardNo);
		
		//해당 보드번호에 있는 첨부파일 가져오기
		List<Attachment> attachmentList = boardService.selectList(boardNo);
		
		
		mav.addObject("board", board);
		mav.addObject("attachmentList", attachmentList);
		mav.setViewName("board/boardView");
		return mav;
	}
	
	@RequestMapping("/board/fileDownload.do")
	public void fileDownload(@RequestParam(name="oName") String oName, @RequestParam(name="rName") String rName
							 , HttpServletRequest req, HttpServletResponse res) {
		
		String saveDirectory = req.getSession().getServletContext().getRealPath("/resources/upload/board/");
		
		try {
			// 입력 스트림
			FileInputStream fis = new FileInputStream(new File(saveDirectory + rName));
			BufferedInputStream bis = new BufferedInputStream(fis);
			
			// 출력 스트림
			ServletOutputStream sos = res.getOutputStream();
			BufferedOutputStream bos = new BufferedOutputStream(sos);
			
			// 전송할 파일명 작성
			String resFileName = "";
			
			// 요청브라우저에 따른 분기 : IE -> MSIE: IE version10 이전, Trident: IE version10 이후
			boolean isMSIE = (req.getHeader("user-agent").indexOf("MSIE") != -1 || req.getHeader("user-agent").indexOf("Trident") != -1);
			
			if(isMSIE) {
				// utf-8인코딩처리를 명시적으로 해줘야 함
				resFileName = URLEncoder.encode(oName, "UTF-8");
				// 이렇게 하면 공백이 '+'로 처리됨. 이를 다시 한 번 %20으로 치환
				resFileName = resFileName.replaceAll("\\+", "%20");
			}
			else {
				// utf-8로 받아온 파일명을 톰캣의 기본인코딩방식인 ISO-8859-1로 변환을 해준다.
				resFileName = new String(oName.getBytes("UTF-8"), "ISO-8859-1");
			}
			
			
			// 이진데이터전송을 위한 MIME타입 설정
			res.setContentType("application/octet-stream");
			res.setHeader("Content-Disposition", "attachment;filename=" + resFileName);
			
			// 파일 쓰기
			int read = -1;
			while((read=bis.read()) != -1) {
				bos.write(read);
			}
			bos.close();
			bis.close();
			
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		}
	
	}
}
