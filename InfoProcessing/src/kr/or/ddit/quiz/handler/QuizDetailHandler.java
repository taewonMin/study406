package kr.or.ddit.quiz.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
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
		
		String quizGroup = req.getParameter("quizGroup");
		
		List<QuizVO> quizList = quizService.getQuizList(Integer.parseInt(quizGroup));

		quizService.increaseViewcnt(Integer.parseInt(quizGroup));
		
		req.setAttribute("quizList", quizList);
		
		return url;
	}

}
