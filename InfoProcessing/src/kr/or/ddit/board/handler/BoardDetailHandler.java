package kr.or.ddit.board.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.handler.CommandHandler;


public class BoardDetailHandler implements CommandHandler{

	IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/WEB-INF/views/board/detail.jsp";
		int boardNo = Integer.parseInt(request.getParameter("boardNo")+"");
		
		BoardVO board = boardService.getBoard(boardNo);
		request.setAttribute("board", board);
		
		if(request.getParameter("from") == null) {
			board.setBoardCnt(board.getBoardCnt()+1);
			boardService.updateBoard(board);
		}
		
		return url;
	}
}
