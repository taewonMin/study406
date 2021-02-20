package kr.or.ddit.board.handler;

import java.util.Collections;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.common.handler.CommandHandler;


public class BoardListHandler implements CommandHandler{

	IBoardService boardService = BoardServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = "/WEB-INF/views/board/list.jsp";
		
		SearchCriteria cri = new SearchCriteria();
		cri.setKeyword(request.getParameter("keyword"));
		cri.setPage(request.getParameter("page"));
		cri.setPerPageNum(request.getParameter("perPageNum"));
		cri.setSearchType(request.getParameter("searchType"));
		String boardGroup = request.getParameter("boardGroup");
		
		List<BoardVO> boardList = Collections.EMPTY_LIST;
		
		request.setAttribute("boardList", boardList);
		
		return url;
	}

}
