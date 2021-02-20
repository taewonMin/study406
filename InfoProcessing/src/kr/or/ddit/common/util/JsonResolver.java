package kr.or.ddit.common.util;

import java.io.PrintWriter;

import javax.servlet.http.HttpServletResponse;

import com.fasterxml.jackson.databind.ObjectMapper;

public class JsonResolver {

	public static void view(HttpServletResponse response, Object target) throws Exception {
		ObjectMapper mapper = new ObjectMapper();

		response.setContentType("application/json;charset=utf-8");
		PrintWriter out = response.getWriter();

		out.println(mapper.writeValueAsString(target));

		out.close();
	}
	
	
	
}
