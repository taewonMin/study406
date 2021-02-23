package kr.or.ddit.board.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.handler.CommandHandler;


public class BoardRemoveHandler implements CommandHandler{

	IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String url = null;
		
		int boardNo = Integer.parseInt(request.getParameter("boardNo")+"");
		
		BoardVO board = boardService.getBoard(boardNo);
		
		boardService.removeBoard(boardNo);
		
		url = request.getContextPath()+"/board/list.do?boardGroup="+board.getBoardGroup();
		
		return url;
	}

}
