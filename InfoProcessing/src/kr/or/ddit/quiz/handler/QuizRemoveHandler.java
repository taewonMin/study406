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
		String removeEl = request.getParameter("removeEl");
		
		QuizVO quiz = new QuizVO();
		quiz.setStudyNo(studyNo);
		quiz.setQuizGroup(quizGroup);
		
		String url = request.getContextPath() + "/quiz/list.do?studyNo="+studyNo;
		
		if("ok".equals(removeEl)) {	// 문제 낱개 삭제
			quiz.setQuizNo(Integer.parseInt(request.getParameter("quizNo")));
			quizService.removeEl(quiz);
			url = null;
		}else {	// 전체 삭제
			quizService.remove(quiz);
		}
		
		return url;
	}

}
