package kr.or.ddit.quiz.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.common.vo.SearchPagingVO;
import kr.or.ddit.quiz.vo.QuizVO;
import kr.or.ddit.quiz.vo.SubjectVO;

public interface IQuizService {
	// 문제 그룹 리스트 출력
	public List<QuizVO> getQuizGroupList(int studyNo) throws SQLException;
	
	// 문제 리스트 출력
	public List<QuizVO> getQuizList(QuizVO quiz) throws SQLException;
	
	// 과목 정보 가져오기
	public List<SubjectVO> getSubject(String subParentCode) throws SQLException;
	
	// 과목 상세 코드 가져오기
	public String getSubjectCode(QuizVO quiz) throws SQLException;
	
	// 문제 개수 조회
	public int getQuizCnt(QuizVO quiz) throws SQLException;
	
	// 문제 등록
	public void regist(QuizVO quiz) throws SQLException;
	
	// 문제 그룹 번호 가져오기
	public int createQuizGroupValue(int studyNo) throws SQLException;
	
	// 문제 조회수 증가
	public void increaseViewcnt(int quizGroup) throws SQLException;
	
	// 문제 수정
	public void modify(QuizVO quiz) throws SQLException;
	
	// 문제 삭제
	public void remove(QuizVO quiz) throws SQLException;
	
	// 문제 낱개 삭제
	public void removeEl(QuizVO quiz) throws SQLException;
	
	// 문제 상위
	public List<SubjectVO> getSubjectParentList() throws SQLException;

	public List<QuizVO> getQuizSearchList(SearchPagingVO search) throws SQLException;
	
	// 찜하기
	public void zzimDo(QuizVO quiz) throws SQLException;
	
	// 찜취소
	public void zzimCancel(QuizVO quiz) throws SQLException;

	public QuizVO getQuiz(int quizId) throws SQLException;

	public List<QuizVO> getZzimQuiz(String memId) throws SQLException;
}
