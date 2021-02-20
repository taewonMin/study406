package kr.or.ddit.board.service;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.ddit.board.vo.BoardVO;
import kr.or.ddit.command.SearchCriteria;
import kr.or.ddit.quiz.vo.QuizVO;

public interface IBoardService {

	public List<BoardVO> getBoardGroupList(int boardGroup) throws SQLException;
	
}
