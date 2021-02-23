package kr.or.ddit.quiz.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class QuizRemoveHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		int quizGroup = Integer.parseInt(request.getParameter("quizGroup"));
		
		QuizVO quiz = new QuizVO();
		quiz.setStudyNo(studyNo);
		quiz.setQuizGroup(quizGroup);
		
		quizService.remove(quiz);
		
		String url = request.getContextPath() + "/quiz/list.do?studyNo="+studyNo;
		
		return url;
	}

}
