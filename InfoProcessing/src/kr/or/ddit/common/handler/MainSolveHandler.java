package kr.or.ddit.common.handler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class MainSolveHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/WEB-INF/views/common/solveProb.jsp";
		
		QuizVO quiz = new QuizVO();
		
		String[] quizSubCode = request.getParameterValues("quizSubCode");
		int quizType = Integer.parseInt(request.getParameter("quizType"));
		int studyNo = quizType == 0 ? 0 : Integer.parseInt(request.getParameter("studyNo"));
		int quizGroup = quizType == 0 ? Integer.parseInt(request.getParameter("preProbGroup")) : Integer.parseInt(request.getParameter("testProbGroup")); 
		
		quiz.setQuizSubCode(quizSubCode);
		quiz.setStudyNo(studyNo);
		quiz.setQuizGroup(quizGroup);
		
		try {
			List<QuizVO> quizList = quizService.getQuizSolveList(quiz);
			
			request.setAttribute("quizList", quizList);
		}catch(SQLException e) {
			e.printStackTrace();
			url=null;
		}
		
		return url;
	}

}
