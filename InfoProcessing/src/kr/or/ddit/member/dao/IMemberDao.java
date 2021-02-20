package kr.or.ddit.member.dao;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberDao {

	public MemberVO getMember(SqlMapClient smc, String memId) throws SQLException;
	
}
