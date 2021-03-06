package kr.or.ddit.member.dao;

import java.sql.SQLException;
import java.util.Map;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.member.vo.MemberVO;

public class MemberDaoImpl implements IMemberDao{
	
	private static IMemberDao memberDao;

	private MemberDaoImpl() {
		
	}
	
	public static IMemberDao getInstance() {
		if(memberDao==null) {
			memberDao = new MemberDaoImpl();
		}
		return memberDao;
	}

	@Override
	public MemberVO getMember(SqlMapClient smc, String memId) throws SQLException {
		MemberVO member = (MemberVO) smc.queryForObject("member.getMember", memId);
		return member;
	}

	@Override
	public Map<String, Object> getStudyGroup(SqlMapClient smc) throws SQLException {
		
		 Map<String, Object> studyGroup = (Map<String, Object>)smc.queryForObject("member.getStudyGroup");
		 
		return studyGroup;
	}


}
