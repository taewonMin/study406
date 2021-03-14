package kr.or.ddit.quiz.handler;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.util.JsonResolver;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;
import kr.or.ddit.quiz.vo.SubjectVO;

public class SubjectDetailListHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String subParentCode = req.getParameter("subParentCode");
		int studyNo = Integer.parseInt(req.getParameter("studyNo"));
		int quizGroup = Integer.parseInt(req.getParameter("quizGroup"));
		int quizNo = Integer.parseInt(req.getParameter("quizNo"));
		
		QuizVO quiz = new QuizVO();
		quiz.setStudyNo(studyNo);
		quiz.setQuizGroup(quizGroup);
		quiz.setQuizNo(quizNo);
		
		try {
			List<SubjectVO> subList = quizService.getSubject(subParentCode);
			
			String subCode = quizService.getSubjectCode(quiz);
			
			Map<String, Object> dataMap = new HashMap<String,Object>();
			
			dataMap.put("subList", subList);
			dataMap.put("subCode", subCode);
			
			JsonResolver.view(resp, dataMap);
			
		}catch(SQLException e) {
			resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return null;
	}

}
