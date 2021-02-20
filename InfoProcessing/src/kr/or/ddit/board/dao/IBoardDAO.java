package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.List;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;

public interface IBoardDAO {

	public List<BoardVO> selectBoardList(SqlMapClient smc, int boardGroup) throws SQLException;

	
}
