package kr.or.ddit.common.vo;

public class SearchPagingVO extends PagingVO{
	
	private String keyword;
	private String searchType;
	private String boardGroup;

	private String quizGroup;
	private String studyNo;
	private String quizTag;
	private String subNo;
	
	public String getKeyword() {
		return keyword;
	}
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	public String getSearchType() {
		return searchType;
	}
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	public String getBoardGroup() {
		return boardGroup;
	}
	public void setBoardGroup(String boardGroup) {
		this.boardGroup = boardGroup;
	}
	



}