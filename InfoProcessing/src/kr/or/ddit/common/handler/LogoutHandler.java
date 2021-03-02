package kr.or.ddit.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class LogoutHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return true;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url = request.getContextPath() + "/common/loginForm.do";
		
		request.getSession().invalidate();
		
		return url;
	}

}
