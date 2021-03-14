package kr.or.ddit.quiz.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.common.vo.SearchPagingVO;
import kr.or.ddit.quiz.vo.QuizVO;
import kr.or.ddit.quiz.vo.SubjectVO;

public interface IQuizDAO {
	// 문제 그룹 리스트 출력
	public List<QuizVO> selectQuizGroupList(SqlMapClient smc,int studyNo) throws SQLException;
	
	// 문제 리스트 출력
	public List<QuizVO> selectQuizList(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 과목 정보 가져오기
	public List<SubjectVO> getSubject(SqlMapClient smc, String subParentCode) throws SQLException;
	
	// 과목 상세 코드 가져오기
	public String getSubjectCode(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 문제 개수 조회
	public int selectQuizCnt(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 문제 등록
	public void insertQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 퀴즈ID 생성
	public int createQuizId(SqlMapClient smc) throws SQLException;
	
	// 문제 그룹코드 생성
	public int createQuizGroupValue(SqlMapClient smc, int studyNo) throws SQLException;
	
	// 문제 조회수 증가
	public void updateQuizViewcnt(SqlMapClient smc, int quizGroup) throws SQLException;
	
	// 문제 수정
	public void updateQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 문제 삭제
	public void deleteQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 문제 낱개 삭제
	public void deleteQuizElement(SqlMapClient smc, QuizVO quiz) throws SQLException;

	public List<SubjectVO> getSubjectParentList(SqlMapClient smc)  throws SQLException;

	public List<QuizVO> searchQuiz(SqlMapClient smc, SearchPagingVO search) throws SQLException;
	
	// 찜하기
	public void insertMyQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException;
	
	// 찜취소
	public void deleteMyQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException;

	public QuizVO getQuiz(SqlMapClient smc, int quizId) throws SQLException;

	public List<QuizVO> zzimQuiz(SqlMapClient smc, String memId) throws SQLException;
	
}
