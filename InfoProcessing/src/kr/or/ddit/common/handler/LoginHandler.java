package kr.or.ddit.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import kr.or.ddit.common.util.LoginException;
import kr.or.ddit.member.service.IMemberService;
import kr.or.ddit.member.service.MemberServiceImpl;
import kr.or.ddit.member.vo.MemberVO;

public class LoginHandler implements CommandHandler {

	private IMemberService memberService = MemberServiceImpl.getInstance();
	
	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getContextPath() + "/main.do";
		
		// 로그인처리
		String memId = request.getParameter("memId");
		String memPass = request.getParameter("memPass");
		
		HttpSession session = request.getSession();
		
		try {
			MemberVO member = memberService.login(memId, memPass);
			// 로그인 성공
			session.setAttribute("loginUser", member);
			
		}catch(LoginException e) {
			url=request.getContextPath() + "/common/loginForm.do";
			session.setAttribute("msg", e.getMessage());
		}
		
		return url;
	}

}
