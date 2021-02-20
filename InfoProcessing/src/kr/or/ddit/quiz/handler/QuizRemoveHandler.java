package kr.or.ddit.quiz.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;

public class QuizRemoveHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getContextPath() + "/quiz/list.do";
		
		int quizGroup = Integer.parseInt(request.getParameter("quizGroup"));
		
		quizService.remove(quizGroup);
		
		return url;
	}

}
