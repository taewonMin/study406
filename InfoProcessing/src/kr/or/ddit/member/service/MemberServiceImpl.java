package kr.or.ddit.member.service;

import java.sql.SQLException;

import com.ibatis.sqlmap.client.SqlMapClient;

import kr.or.ddit.common.util.LoginException;
import kr.or.ddit.common.util.SqlMapClientFactory;
import kr.or.ddit.member.dao.IMemberDao;
import kr.or.ddit.member.dao.MemberDaoImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MemberServiceImpl implements IMemberService{
	private IMemberDao memberDao;
	private SqlMapClient smc;
	
	private static IMemberService memberService;
	
	private MemberServiceImpl() {
		memberDao = MemberDaoImpl.getInstance();
		smc = SqlMapClientFactory.getInstance();
	}
	
	public static IMemberService getInstance() {
		if(memberService == null) {
			memberService = new MemberServiceImpl();
		}
		return memberService;
	}

	@Override
	public MemberVO getMember(String memId) throws SQLException {
		MemberVO member = memberDao.getMember(smc, memId);
		return member;
	}

	@Override
	public MemberVO login(String memId, String memPass) throws SQLException, LoginException {
		MemberVO member = memberDao.getMember(smc, memId);
		
		if(member == null || !memPass.equals(member.getMemPass())) {
			throw new LoginException();
		}
		
		return member;
	}

}
