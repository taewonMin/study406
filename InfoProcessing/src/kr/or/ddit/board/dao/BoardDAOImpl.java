package kr.or.ddit.board.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.board.vo.BoardVO;
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
	public List<BoardVO> selectBoardList(SqlMapClient smc, int boardGroup) throws SQLException {
		List<BoardVO> boardList = smc.queryForList("");
		return boardList;
	}

}
