package kr.or.ddit.quiz.handler;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class QuizSelectHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "/WEB-INF/views/quiz/detail.jsp";
		
		int quizId = Integer.parseInt(req.getParameter("quizId"));
		QuizVO quiz = quizService.getQuiz(quizId);
		List<QuizVO> quizList = new ArrayList<>();
		quizList.add(quiz);
		req.setAttribute("quizList", quizList);
		
		return url;
	}

}
