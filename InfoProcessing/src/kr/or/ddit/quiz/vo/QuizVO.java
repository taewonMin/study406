package kr.or.ddit.quiz.vo;

public class QuizVO {
	private int quizId;
	private int quizGroup;
	private int quizNo;
	private String quizTitle;
	private String quizProb;
	private String quizAnswer;
	private String subNo;
	private String quizRegdate;
	private int quizViewcnt;
	private String quizTag;
	private String memId;
	private int studyNo;
	
	private String subParentName;
	private String subName;
	private String[] quizSubCode;
	
	
	public String[] getQuizSubCode() {
		return quizSubCode;
	}
	public void setQuizSubCode(String[] quizSubCode) {
		this.quizSubCode = quizSubCode;
	}
	public int getQuizId() {
		return quizId;
	}
	public void setQuizId(int quizId) {
		this.quizId = quizId;
	}
	public String getQuizTag() {
		return quizTag;
	}
	public void setQuizTag(String quizTag) {
		this.quizTag = quizTag;
	}
	public String getSubParentName() {
		return subParentName;
	}
	public void setSubParentName(String subParentName) {
		this.subParentName = subParentName;
	}
	public String getSubName() {
		return subName;
	}
	public void setSubName(String subName) {
		this.subName = subName;
	}
	public int getQuizViewcnt() {
		return quizViewcnt;
	}
	public void setQuizViewcnt(int quizViewcnt) {
		this.quizViewcnt = quizViewcnt;
	}
	public String getQuizRegdate() {
		return quizRegdate;
	}
	public void setQuizRegdate(String quizRegdate) {
		this.quizRegdate = quizRegdate;
	}
	public String getMemId() {
		return memId;
	}
	public void setMemId(String memId) {
		this.memId = memId;
	}
	public int getQuizGroup() {
		return quizGroup;
	}
	public void setQuizGroup(int quizGroup) {
		this.quizGroup = quizGroup;
	}
	public int getQuizNo() {
		return quizNo;
	}
	public void setQuizNo(int quizNo) {
		this.quizNo = quizNo;
	}
	public String getQuizTitle() {
		return quizTitle;
	}
	public void setQuizTitle(String quizTitle) {
		this.quizTitle = quizTitle;
	}
	public String getQuizProb() {
		return quizProb;
	}
	public void setQuizProb(String quizProb) {
		this.quizProb = quizProb;
	}
	public String getQuizAnswer() {
		return quizAnswer;
	}
	public void setQuizAnswer(String quizAnswer) {
		this.quizAnswer = quizAnswer;
	}
	public String getSubNo() {
		return subNo;
	}
	public void setSubNo(String subNo) {
		this.subNo = subNo;
	}
	public int getStudyNo() {
		return studyNo;
	}
	public void setStudyNo(int studyNo) {
		this.studyNo = studyNo;
	}
	
}
