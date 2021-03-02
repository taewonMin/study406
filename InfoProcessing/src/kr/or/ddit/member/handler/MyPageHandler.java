package kr.or.ddit.member.handler;

import java.sql.SQLException;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import kr.or.ddit.common.handler.CommandHandler;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class MyPageHandler implements CommandHandler {

	private IMemberService ims = MemberServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest req) {
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
		String url = "/WEB-INF/views/common/myPage.jsp";
		
		String memId = ((MemberVO)req.getSession().getAttribute("loginUser")).getMemId();
		
		try {
			MemberVO member = ims.getMember(memId);
			
		}catch(SQLException e) {
		
			e.printStackTrace();
		
		}
		
		// 찜목록 리스트 출력
		req.setAttribute("boardList", "");
		req.setAttribute("quizList", "");
		
		return url;
		
	}
}
