package kr.or.ddit.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class SearchFormHandler implements CommandHandler {

	@Override
	public boolean isRedirect(HttpServletRequest request) {
		return false;
	}

	@Override
	public String process(HttpServletRequest request, HttpServletResponse response) throws Exception {
		String url="/WEB-INF/views/common/searchForm.jsp";
		
		return url;
	}

}
