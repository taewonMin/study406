package kr.or.ddit.quiz.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.vo.SearchPagingVO;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class QuizSearchListHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "/WEB-INF/views/quiz/list.jsp";
		SearchPagingVO search = new SearchPagingVO();
		int studyNo = Integer.parseInt(req.getParameter("studyNo"));
		int subNo =  Integer.parseInt(req.getParameter("subNo"));
		String quizTag = req.getParameter("quizTag");
		search.setStudyNo(studyNo);
		search.setSubNo(subNo);
		search.setQuizTag(quizTag);
		
		List<QuizVO> quizList = quizService.getQuizSearchList(search);
		req.setAttribute("quizList", quizList);
		return url;
	}
}