package kr.or.ddit.quiz.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.quiz.vo.QuizVO;
import kr.or.ddit.quiz.vo.SubjectVO;

public interface IQuizService {
	// 문제 그룹 리스트 출력
	public List<QuizVO> getQuizGroupList() throws SQLException;
	
	// 문제 리스트 출력
	public List<QuizVO> getQuizList(int quizGroup) throws SQLException;
	
	// 과목 정보 가져오기
	public List<SubjectVO> getSubject(String subParentCode) throws SQLException;
	
	// 문제 등록
	public void regist(QuizVO quiz) throws SQLException;
	
	// 문제 그룹 번호 가져오기
	public int createQuizGroupValue() throws SQLException;
	
	// 문제 조회수 증가
	public void increaseViewcnt(int quizGroup) throws SQLException;
	
	// 문제 삭제
	public void remove(int quizGroup) throws SQLException;
}
