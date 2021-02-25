package kr.or.ddit.board.service;
import java.sql.SQLException;
import java.util.List;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.common.vo.SearchPagingVO;

public interface IBoardService {

	public List<BoardVO> getBoardGroupList(SearchPagingVO paging) throws SQLException;

	public void insertBoard(BoardVO board) throws SQLException;

	public int getBoardListCnt(SearchPagingVO paging) throws SQLException;

	public BoardVO getBoard(int boardNo) throws SQLException;

	public void updateBoard(BoardVO board) throws SQLException;

	public void removeBoard(int boardNo) throws SQLException;

	public String getSubjectName(String boardGroup) throws SQLException;

	public List<BoardVO> getBoardList(SearchPagingVO search) throws SQLException;
}
