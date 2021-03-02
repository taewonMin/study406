package kr.or.ddit.member.handler;

import java.sql.SQLException;

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

public class BoardZzimHandler implements CommandHandler {

	private IBoardService boardService = BoardServiceImpl.getInstance();
	
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo"));
		String memId= ((MemberVO)request.getSession().getAttribute("loginUser")).getMemId();
		
		BoardVO board = new BoardVO();
		board.setMemId(memId);
		board.setBoardNo(boardNo);
		
		String zzimChk = request.getParameter("zzimChk");
		
		try {
			
			if(zzimChk.equals("true")) {
				boardService.zzimDo(board);
			}else {
				boardService.zzimCancel(board);
			}
		}catch(SQLException e) {
			response.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
			e.printStackTrace();
		}
		
		return null;
	}

}
