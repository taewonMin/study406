package kr.or.ddit.quiz.handler;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

public class QuizInsertHandler implements CommandHandler{

	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("POST")) {
			return true;
		}
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		if(req.getMethod().equals("GET")) {
			String url = "/WEB-INF/views/quiz/insert.jsp";
			
			return url;
		}else if(req.getMethod().equals("POST")) {
			
			JSONArray jsonArray = JSONArray.fromObject(req.getParameter("quizList"));
			
			try {
				int quizGroup = quizService.createQuizGroupValue();
				
				for(int i=0; i<jsonArray.size(); i++) {
					JSONObject obj = (JSONObject)jsonArray.get(i);
					
					QuizVO quiz = new QuizVO();
					quiz.setQuizGroup(quizGroup);
					quiz.setQuizNo(obj.getInt("quizNo"));
					quiz.setQuizTitle(obj.getString("quizTitle"));
					quiz.setQuizProb(obj.getString("quizProb"));
					quiz.setQuizAnswer(obj.getString("quizAnswer"));
					quiz.setSubNo(obj.getString("subNo"));
					quiz.setMemId(obj.getString("memId"));
					String quizTag = obj.getString("quizTag");
					quiz.setQuizTag(quizTag==null ? " " : quizTag);
					quiz.setStudyNo(obj.getInt("studyNo"));
					
					quizService.regist(quiz);
				}
			}catch(SQLException e) {
				resp.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}
		}
		return null;
	}

}
