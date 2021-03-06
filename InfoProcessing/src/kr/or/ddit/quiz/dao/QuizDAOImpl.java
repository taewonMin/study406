package kr.or.ddit.quiz.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.common.vo.SearchPagingVO;
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
	public List<QuizVO> selectQuizList(SqlMapClient smc, QuizVO quiz) throws SQLException {
		List<QuizVO> quizList = smc.queryForList("quiz.selectQuizList", quiz);
		return quizList;
	}
	
	@Override
	public List<SubjectVO> getSubject(SqlMapClient smc, String subParentCode) throws SQLException {
		List<SubjectVO> subList = smc.queryForList("quiz.getSubject",subParentCode);
		return subList;
	}

	@Override
	public String getSubjectCode(SqlMapClient smc, QuizVO quiz) throws SQLException {
		String subCode = (String) smc.queryForObject("quiz.getSubjectCode",quiz);
		return subCode;
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
	public int createQuizGroupValue(SqlMapClient smc, int studyNo) throws SQLException {
		int cnt = (int) smc.queryForObject("quiz.createQuizGroupValue", studyNo);
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
	public void deleteQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException {
		smc.delete("quiz.deleteQuiz", quiz);
	}
	
	@Override
	public void deleteQuizElement(SqlMapClient smc, QuizVO quiz) throws SQLException {
		smc.delete("quiz.deleteQuizElement", quiz);
	}

	@Override
	public List<SubjectVO> getSubjectParentList(SqlMapClient smc) throws SQLException {
		List<SubjectVO> subList = smc.queryForList("quiz.selectSubjectParentList");
		return subList;
	}

	@Override
	public List<QuizVO> searchQuiz(SqlMapClient smc, SearchPagingVO search) throws SQLException {
		List<QuizVO> quizList = smc.queryForList("quiz.searchQuiz",search);
		return quizList;
	}

	@Override
	public int selectQuizCnt(SqlMapClient smc, QuizVO quiz) throws SQLException {
		int cnt = (int) smc.queryForObject("quiz.selectQuizCnt", quiz);
		return cnt;
	}
	
	@Override
	public void insertMyQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException {
		smc.insert("quiz.insertMyQuiz",quiz);
	}

	@Override
	public void deleteMyQuiz(SqlMapClient smc, QuizVO quiz) throws SQLException {
		smc.delete("quiz.deleteMyQuiz",quiz);
	}

	@Override
	public QuizVO getQuiz(SqlMapClient smc, int quizId) throws SQLException {
		QuizVO quiz = (QuizVO)smc.queryForObject("quiz.getQuiz",quizId);
		return quiz;
	}

	@Override
	public List<QuizVO> zzimQuiz(SqlMapClient smc, String memId) throws SQLException {
		List<QuizVO> quizList = smc.queryForList("quiz.zzimQuiz",memId);
		return quizList;
	}

}
