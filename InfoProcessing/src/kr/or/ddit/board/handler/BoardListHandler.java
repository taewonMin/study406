package kr.or.ddit.board.handler;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.vo.SearchPagingVO;


public class BoardListHandler implements CommandHandler{

	IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/WEB-INF/views/board/list.jsp";
		int pageNo = request.getParameter("pageNo") == null ? 1 : Integer.parseInt(request.getParameter("pageNo"));
		String boardGroup = request.getParameter("boardGroup");
		String searchType = request.getParameter("searchType");
		String keyword =request.getParameter("keyword");
		
		SearchPagingVO paging = new SearchPagingVO();
		paging.setBoardGroup(boardGroup);
		paging.setCurrentPageNo(pageNo);
		paging.setSearchType(searchType);
		paging.setKeyword(keyword);
		paging.setTotalCount(boardService.getBoardListCnt(paging));
		
		boardService.getBoardGroupList(paging);
		List<BoardVO> boardList = boardService.getBoardGroupList(paging);
		request.setAttribute("boardList", boardList);
		
		return url;
	}
}
