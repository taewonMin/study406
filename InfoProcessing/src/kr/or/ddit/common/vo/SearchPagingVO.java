package kr.or.ddit.common.vo;

public class SearchPagingVO extends PagingVO{
	
	private String keyword;
	private String searchType;
	private String boardGroup;
	private String kind;

	private int studyNo;
	private int subNo;
	private String quizGroup;
	private String quizTag;
	
	public String getQuizGroup() {
		return quizGroup;
	}
	public void setQuizGroup(String quizGroup) {
		this.quizGroup = quizGroup;
	}
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	public String getQuizTag() {
		return quizTag;
	}
	public void setQuizTag(String quizTag) {
		this.quizTag = quizTag;
	}
	public int getSubNo() {
		return subNo;
	}
	public void setSubNo(int subNo) {
		this.subNo = subNo;
	}
	
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
	public String getKind() {
		return kind;
	}
	public void setKind(String kind) {
		this.kind = kind;
	}

}