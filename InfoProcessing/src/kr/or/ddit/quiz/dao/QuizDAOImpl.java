package kr.or.ddit.quiz.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.quiz.vo.QuizVO;
import kr.or.ddit.quiz.vo.SubjectVO;

public class QuizDAOImpl implements IQuizDAO {

	private static IQuizDAO quizDao;
	
	private QuizDAOImpl() {
	}
	
	public static IQuizDAO getInstance() {
		if(quizDao == null) {
			quizDao = new QuizDAOImpl();
		}
		return quizDao;
	}
	
	@Override
	public List<QuizVO> selectQuizGroupList(SqlMapClient smc,int studyNo) throws SQLException {
		List<QuizVO> quizList = smc.queryForList("quiz.selectQuizGroupList",studyNo);
		return quizList;
	}
	
	@Override
	public List<QuizVO> selectQuizList(SqlMapClient smc, int quizGroup) throws SQLException {
		List<QuizVO> quizList = smc.queryForList("quiz.selectQuizList", quizGroup);
		return quizList;
	}
	
	@Override
	public List<SubjectVO> getSubject(SqlMapClient smc, String subParentCode) throws SQLException {
		List<SubjectVO> subList = smc.queryForList("quiz.getSubject",subParentCode);
		return subList;
	}

	@Override
	public void insertQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException {
		smc.insert("quiz.insertQuiz", quiz);
	}

	@Override
	public int createQuizId(SqlMapClient smc) throws SQLException {
		int cnt = (int) smc.queryForObject("quiz.createQuizId");
		return cnt;
	}
	
	@Override
	public int createQuizGroupValue(SqlMapClient smc) throws SQLException {
		int cnt = (int) smc.queryForObject("quiz.createQuizGroupValue");
		return cnt;
	}

	@Override
	public void updateQuizViewcnt(SqlMapClient smc, int quizGroup) throws SQLException {
		smc.update("quiz.updateQuizViewcnt", quizGroup);
	}

	@Override
	public void updateQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException {
		smc.update("quiz.updateQuiz", quiz);
	}
	
	@Override
	public boolean updateCheck(SqlMapClient smc, QuizVO quiz) throws SQLException {
		
		boolean result = false;
		
		int cnt = (int) smc.queryForObject("quiz.updateCheck",quiz);
		
		if(cnt > 0) {
			result = true;
		}
		return result;
	}
	
	@Override
	public void deleteQuiz(SqlMapClient smc, int quizGroup) throws SQLException {
		smc.delete("quiz.deleteQuiz", quizGroup);
	}

}
