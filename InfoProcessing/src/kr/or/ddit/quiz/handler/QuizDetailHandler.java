package kr.or.ddit.quiz.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class QuizDetailHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "/WEB-INF/views/quiz/detail.jsp";
		
		int studyNo = Integer.parseInt(req.getParameter("studyNo"));
		int quizGroup = Integer.parseInt(req.getParameter("quizGroup"));
		String memId = ((MemberVO)req.getSession().getAttribute("loginUser")).getMemId();
		String[] quizSubCode = {"P01","P02","P03","P04","P05"};
		
		QuizVO quiz = new QuizVO();
		quiz.setStudyNo(studyNo);
		quiz.setQuizGroup(quizGroup);
		quiz.setMemId(memId);
		quiz.setQuizSubCode(quizSubCode);
		
		List<QuizVO> quizList = quizService.getQuizList(quiz);

		quizService.increaseViewcnt(quizGroup);
		
		req.setAttribute("quizList", quizList);
		return url;
	}

}
