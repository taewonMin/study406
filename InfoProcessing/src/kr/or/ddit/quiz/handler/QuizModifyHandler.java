package kr.or.ddit.quiz.handler;

import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;
import net.sf.json.JSONArray;
import net.sf.json.JSONObject;

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
		
		int quizGroup = Integer.parseInt(request.getParameter("quizGroup"));
		int studyNo = Integer.parseInt(request.getParameter("studyNo"));
		
		if(request.getMethod().equals("GET")) {
			
			String url="/WEB-INF/views/quiz/modify.jsp";
			
			QuizVO quiz = new QuizVO();
			quiz.setStudyNo(studyNo);
			quiz.setQuizGroup(quizGroup);
			
			List<QuizVO> quizList = quizService.getQuizList(quiz);
			
			request.setAttribute("quizList", quizList);
			
			return url;
		}else if(request.getMethod().equals("POST")) {
			
			JSONArray jsonArray = JSONArray.fromObject(request.getParameter("quizList"));
			try {
				
				QuizVO quiz = new QuizVO();
				quiz.setStudyNo(studyNo);
				quiz.setQuizGroup(quizGroup);
				
				quizService.remove(quiz);
				
				for(int i=0; i<jsonArray.size(); i++) {
					JSONObject obj = (JSONObject)jsonArray.get(i);
					
					quiz.setQuizNo(obj.getInt("quizNo"));
					quiz.setQuizTitle(obj.getString("quizTitle"));
					quiz.setQuizProb(obj.getString("quizProb"));
					quiz.setQuizAnswer(obj.getString("quizAnswer"));
					quiz.setSubNo(obj.getString("subNo"));
					quiz.setMemId(obj.getString("memId"));
					String quizTag = obj.getString("quizTag");
					quiz.setQuizTag(quizTag==null ? "" : quizTag);
					
					quizService.regist(quiz);
				}
			}catch(SQLException e) {
				response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
				e.printStackTrace();
			}
		}
		return null;
	}

}
