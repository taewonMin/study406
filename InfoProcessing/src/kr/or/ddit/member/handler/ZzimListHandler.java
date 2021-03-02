package kr.or.ddit.member.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.member.vo.MemberVO;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class ZzimListHandler implements CommandHandler {

	private IQuizService quizService = QuizServiceImpl.getInstance();
	private IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "/WEB-INF/views/member/zzimList.jsp";
		
		String memId= ((MemberVO)req.getSession().getAttribute("loginUser")).getMemId();
		
		List<QuizVO> quizList = quizService.getZzimQuiz(memId);
		List<BoardVO> boardList = boardService.getZzimBoard(memId);
		req.setAttribute("quizList", quizList);
		req.setAttribute("boardList", boardList);
		
		return url;
	}
}
