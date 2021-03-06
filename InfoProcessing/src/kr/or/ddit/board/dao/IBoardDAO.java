package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.vo.SearchPagingVO;

public interface IBoardDAO {

	public List<BoardVO> selectBoardList(SqlMapClient smc, SearchPagingVO paging) throws SQLException;

	public void insertBoard(SqlMapClient smc, BoardVO board) throws SQLException;

	public int getBoardListCnt(SqlMapClient smc, SearchPagingVO paging) throws SQLException;

	public int getBoardNextNo(SqlMapClient smc) throws SQLException;

	public BoardVO getBoard(SqlMapClient smc, int boardNo) throws SQLException;

	public void updateBoard(SqlMapClient smc, BoardVO board) throws SQLException;

	public void removeBoard(SqlMapClient smc, int boardNo)  throws SQLException;

	public String getSubjectName(SqlMapClient smc, String boardGroup)  throws SQLException;

	public List<BoardVO> selectBoardSearchList(SqlMapClient smc, SearchPagingVO search) throws SQLException;

	public List<BoardVO> zzimBoardList(SqlMapClient smc, String memId) throws SQLException;

	public void insertMyBoard(SqlMapClient smc, BoardVO board) throws SQLException;

	public void deleteMyBoard(SqlMapClient smc, BoardVO board) throws SQLException;
	
}
