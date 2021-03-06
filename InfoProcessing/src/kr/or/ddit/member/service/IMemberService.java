package kr.or.ddit.member.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.ddit.common.util.LoginException;
import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	
	public MemberVO getMember(String memId) throws SQLException;

	// 로그인
	public MemberVO login(String memId, String memPass) throws SQLException, LoginException;

	public Map<String, Object> getStudyGroup() throws SQLException;
}
