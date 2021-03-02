package kr.or.ddit.board.vo;

import java.util.Date;

public class BoardVO { 
	private int boardNo; // 게시글 번호
	private String boardTitle; // 게시글 제목
	private Date boardDate; // 등록 날짜
	private int boardCnt =0; // 조회 수
	private String boardGroup;
	private String memId;	// 작성자
	private String boardContent;
	private String boardTag;
	private String memName;
	private int boardZzim;
	
	public String getBoardContent() {
		return boardContent;
	}
	public void setBoardContent(String boardContent) {
		this.boardContent = boardContent;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getBoardTitle() {
		return boardTitle;
	}
	public void setBoardTitle(String boardTitle) {
		this.boardTitle = boardTitle;
	}
	public Date getBoardDate() {
		return boardDate;
	}
	public void setBoardDate(Date boardDate) {
		this.boardDate = boardDate;
	}
	public int getBoardCnt() {
		return boardCnt;
	}
	public void setBoardCnt(int boardCnt) {
		this.boardCnt = boardCnt;
	}
	public String getBoardGroup() {
		return boardGroup;
	}
	public void setBoardGroup(String boardGroup) {
		this.boardGroup = boardGroup;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public String getBoardTag() {
		return boardTag;
	}
	public void setBoardTag(String boardTag) {
		this.boardTag = boardTag;
	}
	public String getMemName() {
		return memName;
	}
	public void setMemName(String memName) {
		this.memName = memName;
	}
	public int getBoardZzim() {
		return boardZzim;
	}
	public void setBoardZzim(int boardZzim) {
		this.boardZzim = boardZzim;
	}
}

