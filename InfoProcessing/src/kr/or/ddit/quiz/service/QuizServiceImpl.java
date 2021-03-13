package kr.or.ddit.quiz.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.common.util.SqlMapClientFactory;
import kr.or.ddit.common.vo.SearchPagingVO;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.quiz.dao.IQuizDAO;
import kr.or.ddit.quiz.dao.QuizDAOImpl;
import kr.or.ddit.quiz.vo.QuizVO;
import kr.or.ddit.quiz.vo.SubjectVO;

public class QuizServiceImpl implements IQuizService {

	private static IQuizService quizService;
	private IQuizDAO quizDao;
	private IMemberDao memberDao;
	private SqlMapClient smc;
	
	private QuizServiceImpl() {
		quizDao = QuizDAOImpl.getInstance();
		memberDao = MemberDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IQuizService getInstance() {
		if(quizService == null) {
			quizService = new QuizServiceImpl();
		}
		return quizService;
	}
	
	@Override
	public List<QuizVO> getQuizGroupList(int studyNo) throws SQLException {
		List<QuizVO> quizList = quizDao.selectQuizGroupList(smc,studyNo);
		return quizList;
	}
	
	@Override
	public List<QuizVO> getQuizList(QuizVO quiz) throws SQLException {
		List<QuizVO> quizList = quizDao.selectQuizList(smc, quiz);
		return quizList;
	}
	
	@Override
	public List<SubjectVO> getSubject(String subParentCode) throws SQLException {
		List<SubjectVO> subList = quizDao.getSubject(smc, subParentCode);
		return subList;
	}
	
	@Override
	public int getQuizCnt(QuizVO quiz) throws SQLException {
		int cnt = quizDao.selectQuizCnt(smc, quiz);
		return cnt;
	}
	
	@Override
	public void regist(QuizVO quiz) throws SQLException {
		
		int quizId = quizDao.createQuizId(smc);
		quiz.setQuizId(quizId);
		
		quizDao.insertQuiz(smc, quiz);
	}

	@Override
	public int createQuizGroupValue(int studyNo) throws SQLException {
		int cnt = quizDao.createQuizGroupValue(smc,studyNo);
		return cnt;
	}

	@Override
	public void increaseViewcnt(int quizGroup) throws SQLException {
		quizDao.updateQuizViewcnt(smc, quizGroup);
	}

	@Override
	public void modify(QuizVO quiz) throws SQLException {
		quizDao.updateQuiz(smc, quiz);
	}
	
	@Override
	public void remove(QuizVO quiz) throws SQLException {
		quizDao.deleteQuiz(smc, quiz);
	}
	
	@Override
	public void removeEl(QuizVO quiz) throws SQLException {
		quizDao.deleteQuizElement(smc, quiz);
	}

	@Override
	public List<SubjectVO> getSubjectParentList() throws SQLException {
		List<SubjectVO> subList = quizDao.getSubjectParentList(smc);
		return subList;
	}

	@Override
	public List<QuizVO> getQuizSearchList(SearchPagingVO search) throws SQLException {
		List<QuizVO> quizList = quizDao.searchQuiz(smc, search);
		return quizList;
	}

	@Override
	public void zzimDo(QuizVO quiz) throws SQLException {
		quizDao.insertMyQuiz(smc, quiz);
	}

	@Override
	public void zzimCancel(QuizVO quiz) throws SQLException {
		quizDao.deleteMyQuiz(smc, quiz);
	}

	@Override
	public QuizVO getQuiz(int quizId) throws SQLException {
		QuizVO quiz = quizDao.getQuiz(smc,quizId);
		return quiz;
	}

	@Override
	public List<QuizVO> getZzimQuiz(String memId) throws SQLException {
		List<QuizVO> quizList = quizDao.zzimQuiz(smc, memId);
		return quizList;
	}

}
