package kr.or.ddit.quiz.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.common.util.SqlMapClientFactory;
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
	public List<QuizVO> getQuizGroupList() throws SQLException {
		List<QuizVO> quizList = quizDao.selectQuizGroupList(smc);
		return quizList;
	}
	
	@Override
	public List<QuizVO> getQuizList(int quizGroup) throws SQLException {
		List<QuizVO> quizList = quizDao.selectQuizList(smc, quizGroup);
		return quizList;
	}
	
	@Override
	public List<SubjectVO> getSubject(String subParentCode) throws SQLException {
		List<SubjectVO> subList = quizDao.getSubject(smc, subParentCode);
		return subList;
	}

	@Override
	public void regist(QuizVO quiz) throws SQLException {
		
		int quizId = quizDao.createQuizId(smc);
		quiz.setQuizId(quizId);
		
		quizDao.insertQuiz(smc, quiz);
	}

	@Override
	public int createQuizGroupValue() throws SQLException {
		int cnt = quizDao.createQuizGroupValue(smc);
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
	public boolean modifyCheck(QuizVO quiz) throws SQLException {
		return quizDao.updateCheck(smc,quiz);
	}
	
	@Override
	public void remove(int quizGroup) throws SQLException {
		quizDao.deleteQuiz(smc, quizGroup);
	}

}
