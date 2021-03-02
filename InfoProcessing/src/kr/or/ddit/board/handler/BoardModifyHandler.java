package kr.or.ddit.board.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.handler.CommandHandler;


public class BoardModifyHandler implements CommandHandler{

	IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		if(request.getMethod().equals("POST")) return true;
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		int boardNo = Integer.parseInt(request.getParameter("boardNo")+"");
		
		String url = "/WEB-INF/views/board/modify.jsp";
		
		request.setAttribute("board", boardService.getBoard(boardNo));
		
		if(request.getMethod().equals("POST")) {
			String boardContent = request.getParameter("boardContent");
			String boardTitle = request.getParameter("boardTitle");
			String boardTag = request.getParameter("boardTag");
			BoardVO board = boardService.getBoard(boardNo);
			board.setBoardContent(boardContent);
			board.setBoardTitle(boardTitle);
			board.setBoardTag(boardTag);
			boardService.updateBoard(board);
			url = request.getContextPath()+"/board/detail.do?boardNo="+boardNo+"&from=modify";
		}
		
		return url;
	}

}
