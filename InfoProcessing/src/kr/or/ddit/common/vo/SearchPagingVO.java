
package kr.or.ddit.common.vo;

public class SearchPagingVO extends PagingVO{
	
	private String donm;
	private String sigugun;
	private String induty;
	
	private int boardNo;
	private String keyword;
	private String title;
	private String content;
	private String writer;
	
	private String[] addr;
	private String[] details;
	
	private String campsiteId;
	private String groupCode;
	private String searchType;
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getDonm() {
		return donm;
	}
	public void setDonm(String donm) {
		this.donm = donm;
	}
	public String getSigugun() {
		return sigugun;
	}
	public void setSigugun(String sigugun) {
		this.sigugun = sigugun;
	}
	public String getInduty() {
		return induty;
	}
	public void setInduty(String induty) {
		this.induty = induty;
	}
	public int getBoardNo() {
		return boardNo;
	}
	public void setBoardNo(int boardNo) {
		this.boardNo = boardNo;
	}
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriter() {
		return writer;
	}
	public void setWriter(String writer) {
		this.writer = writer;
	}
	public String[] getAddr() {
		return addr;
	}
	public void setAddr(String[] addr) {
		this.addr = addr;
	}

	public String getCampsiteId() {
		return campsiteId;
	}
	public void setCampsiteId(String campsiteId) {
		this.campsiteId = campsiteId;
	}
	public String getGroupCode() {
		return groupCode;
	}
	public void setGroupCode(String groupCode) {
		this.groupCode = groupCode;
	}
	public String[] getDetails() {
		return details;
	}
	public void setDetails(String[] details) {
		this.details = details;
	}





}