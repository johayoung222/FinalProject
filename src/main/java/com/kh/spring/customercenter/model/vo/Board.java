package com.kh.spring.customercenter.model.vo;

import java.io.Serializable;
import java.sql.Date;

import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
public class Board implements Serializable{

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	
	private int seq_board_no;
	private String boardtitle;
	private String boardcontent;
	private Date boarddate;
	private String boardwriter;
	private String boardkinds;
	private int board_readcount;
	private int seq_member_no;
	
	public Board() {}

	public Board(int seq_board_no, String boardtitle, String boardcontent, Date boarddate, String boardwriter,
			String boardkinds, int board_readcount, int seq_member_no) {
		super();
		this.seq_board_no = seq_board_no;
		this.boardtitle = boardtitle;
		this.boardcontent = boardcontent;
		this.boarddate = boarddate;
		this.boardwriter = boardwriter;
		this.boardkinds = boardkinds;
		this.board_readcount = board_readcount;
		this.seq_member_no = seq_member_no;
	}

	public int getSeq_board_no() {
		return seq_board_no;
	}

	public void setSeq_board_no(int seq_board_no) {
		this.seq_board_no = seq_board_no;
	}

	public String getBoardtitle() {
		return boardtitle;
	}

	public void setBoardtitle(String boardtitle) {
		this.boardtitle = boardtitle;
	}

	public String getBoardcontent() {
		return boardcontent;
	}

	public void setBoardcontent(String boardcontent) {
		this.boardcontent = boardcontent;
	}

	public Date getBoarddate() {
		return boarddate;
	}

	public void setBoarddate(Date boarddate) {
		this.boarddate = boarddate;
	}

	public String getBoardwriter() {
		return boardwriter;
	}

	public void setBoardwriter(String boardwriter) {
		this.boardwriter = boardwriter;
	}

	public String getBoardkinds() {
		return boardkinds;
	}

	public void setBoardkinds(String boardkinds) {
		this.boardkinds = boardkinds;
	}

	public int getBoard_readcount() {
		return board_readcount;
	}

	public void setBoard_readcount(int board_readcount) {
		this.board_readcount = board_readcount;
	}

	public int getSeq_member_no() {
		return seq_member_no;
	}

	public void setSeq_member_no(int seq_member_no) {
		this.seq_member_no = seq_member_no;
	}
	
	
	
	
}
