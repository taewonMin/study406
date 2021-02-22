package kr.or.ddit.board.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.handler.CommandHandler;

public class BoardInsertHandler implements CommandHandler {

	IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		if(req.getMethod().equals("POST")) {
			return true;
		}
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		String url = "/views/board/list.do";
		
		if(req.getMethod().equals("GET")) {
			url = "/WEB-INF/views/board/registForm.jsp";
		}else {
			String boardGroup = req.getParameter("boardGroup");
			String boardTitle = req.getParameter("boardTitle");
			String memId = req.getParameter("memId");
			String boardContent = req.getParameter("boardContent");
			BoardVO board = new BoardVO();
			board.setBoardGroup(boardGroup);
			board.setBoardTitle(boardTitle);
			board.setMemId(memId);
			board.setBoardContent(boardContent);
			board.setBoardCnt(0);
			boardService.insertBoard(board);
		}
		
		return url;
	}

}
