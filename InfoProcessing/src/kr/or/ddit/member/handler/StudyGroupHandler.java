package kr.or.ddit.member.handler;

import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.common.util.JsonResolver;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;

public class StudyGroupHandler implements CommandHandler {

	private IMemberService ims = MemberServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		
		try {
			Map<String, Object> studyGroup = ims.getStudyGroup();
			JsonResolver.view(resp, studyGroup);
		}catch(SQLException e) {
			e.printStackTrace();
		}
		
		return null;
	}

}
