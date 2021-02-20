package kr.or.ddit.common.handler;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
	
/**
 * 맵핑되지 않는 주소가 요청될 때, 에러페이지를 로드시킬 핸들러
 */
public class NullHandler implements CommandHandler{

	@Override
	public boolean isRedirect(HttpServletRequest req) {
		
		return false;
	}

	@Override
	public String process(HttpServletRequest req, HttpServletResponse resp) throws Exception {
//		resp.sendError(404); // 인자값으로 상태유형을 넣는다...
		resp.sendError(HttpServletResponse.SC_NOT_FOUND); // HttpServletResponse 객체 안에 오류코드를 상수화 시켰다.
		return null;
	}

}
