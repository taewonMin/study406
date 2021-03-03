package kr.or.ddit.common.handler;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.vo.MemberVO;
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
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		int quizGroup = Integer.parseInt(request.getParameter("testProbGroup")); 
		
		quiz.setQuizSubCode(quizSubCode);
		quiz.setStudyNo(studyNo);
		quiz.setQuizGroup(quizGroup);
		
		String memId = ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		quiz.setMemId(memId);
		
		try {
			List<QuizVO> quizList = quizService.getQuizList(quiz);
			
			request.setAttribute("quizList", quizList);
			
			// quizNum : 0 -> 한꺼번에 풀기
			// quizNum : 1 -> 한 문제씩 풀기
			request.setAttribute("quizNum", Integer.parseInt(request.getParameter("quizNum")));
			// quizAnswer : 0 -> 다 풀고 정답보기
			// quizAnswer : 1 -> 정답보면서 풀기
			request.setAttribute("quizAnswer", Integer.parseInt(request.getParameter("quizAnswer")));
		}catch(SQLException e) {
			e.printStackTrace();
			url=null;
		}
		
		return url;
	}

}
