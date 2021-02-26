package kr.or.ddit.common.handler;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class MainZzimHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int quizId = Integer.parseInt(request.getParameter("quizId"));
		String memId= ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		
		QuizVO quiz = new QuizVO();
		quiz.setMemId(memId);
		quiz.setQuizId(quizId);
		
		String zzimChk = request.getParameter("zzimChk");
		try {
			if(zzimChk.equals("true")) {
				quizService.zzimDo(quiz);
			}else {
				quizService.zzimCancel(quiz);
			}
		}catch(SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return null;
	}

}
