package kr.or.ddit.quiz.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class QuizModifyHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		if(request.getMethod().equals("POST")) {
			return true;
		}
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url="";
		
		int quizGroup = Integer.parseInt(request.getParameter("quizGroup"));
		
		if(request.getMethod().equals("GET")) {
			
			url="/WEB-INF/views/quiz/modify.jsp";
			
			List<QuizVO> quizList = quizService.getQuizList(quizGroup);
			
			request.setAttribute("quizList", quizList);
			
		}else if(request.getMethod().equals("POST")) {
			
			url = request.getContextPath()+"/quiz/detail.do?quizGroup="+quizGroup;
			
		}
		return url;
	}

}
