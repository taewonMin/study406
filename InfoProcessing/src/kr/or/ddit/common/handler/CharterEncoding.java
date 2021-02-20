package kr.or.ddit.common.handler;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;

public class CharterEncoding implements Filter {
	private String encoding; // 인코딩 정보

	@Override
	public void destroy() {

	}

	@Override
	public void init(FilterConfig config) throws ServletException {
		if (config.getInitParameter("encoding") == null) {
			encoding = "UTF-8";
		} else {
			encoding = config.getInitParameter("encoding");
		}
	}

	@Override
	public void doFilter(ServletRequest req, ServletResponse resp, FilterChain fc)
			throws IOException, ServletException {
		System.out.println("request 인코딩 설정 : " + encoding); // 인코딩 설정 전
		req.setCharacterEncoding(encoding);
		resp.setCharacterEncoding(encoding);

		fc.doFilter(req, resp);
	}
}
