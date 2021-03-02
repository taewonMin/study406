package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.vo.SearchPagingVO;
import kr.or.ddit.quiz.dao.IQuizDAO;
import kr.or.ddit.quiz.dao.QuizDAOImpl;


public class BoardDAOImpl implements IBoardDAO{
	private static IBoardDAO boardDao;
	private BoardDAOImpl() {
	}
	public static IBoardDAO getInstance() {
		if(boardDao == null) {
			boardDao = new BoardDAOImpl();
		}
		return boardDao;
	}

	@Override
	public List<BoardVO> selectBoardList(SqlMapClient smc, SearchPagingVO paging) throws SQLException {
		List<BoardVO> boardList = smc.queryForList("board.selectBoardList",paging);
		return boardList;
	}
	@Override
	public void insertBoard(SqlMapClient smc, BoardVO board) throws SQLException {
		smc.insert("board.insertBoard", board);
	}
	
	@Override
	public int getBoardListCnt(SqlMapClient smc, SearchPagingVO paging) throws SQLException {
		
		int cnt = Integer.parseInt(smc.queryForObject("board.getBoardListCnt",paging)+"");
		
		return cnt;
	}
	@Override
	public int getBoardNextNo(SqlMapClient smc) throws SQLException {
		int boardNo = smc.queryForObject("board.getBoardNextNo") == null ? 0 : Integer.parseInt(""+smc.queryForObject("board.getBoardNextNo")) +1 ;
		return boardNo;
	}
	@Override
	public BoardVO getBoard(SqlMapClient smc, int boardNo) throws SQLException {
		
		BoardVO board = (BoardVO)smc.queryForObject("board.getBoard", boardNo);
		
		return board;
	}
	@Override
	public void updateBoard(SqlMapClient smc, BoardVO board) throws SQLException {
		smc.update("board.modifyBoard",board);
	}
	
	@Override
	public void removeBoard(SqlMapClient smc, int boardNo) throws SQLException {
		smc.delete("board.deleteAllMyBoard",boardNo);
		smc.delete("board.removeBoard",boardNo);
	}
	
	@Override
	public String getSubjectName(SqlMapClient smc, String boardGroup) throws SQLException {
		String subjectName = smc.queryForObject("board.getSubjectName",boardGroup)+"";
		return subjectName;
	}
	
	@Override
	public List<BoardVO> selectBoardSearchList(SqlMapClient smc, SearchPagingVO search) throws SQLException {
		List<BoardVO> boardList = smc.queryForList("board.selectBoardSearchList",search);
		return boardList;
	}
	
	@Override
	public List<BoardVO> zzimBoardList(SqlMapClient smc, String memId) throws SQLException {
		List<BoardVO> boardList = smc.queryForList("board.zzimBoard",memId);
		return boardList;
	}
	@Override
	public void insertMyBoard(SqlMapClient smc, BoardVO board) throws SQLException {
		smc.insert("board.insertMyBoard",board);		
	}
	@Override
	public void deleteMyBoard(SqlMapClient smc, BoardVO board) throws SQLException {
		smc.delete("board.deleteMyBoard",board);		
	}

}
