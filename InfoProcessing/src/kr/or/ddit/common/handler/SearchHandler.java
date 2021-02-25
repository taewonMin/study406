package kr.or.ddit.common.handler;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.board.service.BoardServiceImpl;
import kr.or.ddit.board.service.IBoardService;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.util.JsonResolver;
import kr.or.ddit.common.vo.SearchPagingVO;
import kr.or.ddit.quiz.service.IQuizService;
import kr.or.ddit.quiz.service.QuizServiceImpl;
import kr.or.ddit.quiz.vo.QuizVO;

public class SearchHandler implements CommandHandler {

	private IBoardService boardService = BoardServiceImpl.getInstance();
	private IQuizService quizService = QuizServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url=null;
		String keyword =request.getParameter("keyword");
		String boardGroup =request.getParameter("boardGroup");
		String kind =request.getParameter("kind");
		String searchType =request.getParameter("searchType");
		SearchPagingVO search = new SearchPagingVO();
		search.setKeyword(keyword);
		search.setBoardGroup(boardGroup);
		search.setSearchType(searchType);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		if(kind.equals("게시글")) {
			List<BoardVO> boardList = boardService.getBoardList(search);
			dataMap.put("boardList", boardList);
		}else {
			List<QuizVO> quizList = quizService.getQuizSearchList(search);
			dataMap.put("quizList", quizList);
		}
		
		
		JsonResolver.view(response, dataMap);
		
		return url;
	}

}
