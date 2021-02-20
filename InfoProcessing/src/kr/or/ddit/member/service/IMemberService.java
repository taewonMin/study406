package kr.or.ddit.member.service;

import java.sql.SQLException;

import kr.or.ddit.member.vo.MemberVO;

public interface IMemberService {
	
	public MemberVO getMember(String memId) throws SQLException;

}
