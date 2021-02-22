package kr.or.ddit.board.service;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.dao.BoardDAOImpl;
import kr.or.ddit.board.dao.IBoardDAO;
import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.util.SqlMapClientFactory;
import kr.or.ddit.common.vo.SearchPagingVO;

public class BoardServiceImpl implements IBoardService{
	
	private static IBoardService boardService;
	private IBoardDAO boardDao;
	private SqlMapClient smc;
	
	private BoardServiceImpl() {
		boardDao = BoardDAOImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IBoardService getInstance() {
		if(boardService == null) {
			boardService = new BoardServiceImpl();
		}
		return boardService;
	}

	@Override
	public List<BoardVO> getBoardGroupList(SearchPagingVO paging) throws SQLException {
		List<BoardVO> boardList = boardDao.selectBoardList(smc, paging);
		return boardList;
	}

	@Override
	public void insertBoard(BoardVO board) throws SQLException {
		int boardNo = boardDao.getBoardNextNo(smc);
		board.setBoardNo(boardNo);
		boardDao.insertBoard(smc,board);
	}

	@Override
	public int getBoardListCnt(SearchPagingVO paging) throws SQLException {
		int cnt = boardDao.getBoardListCnt(smc, paging);
		return cnt;
	}


	
}
