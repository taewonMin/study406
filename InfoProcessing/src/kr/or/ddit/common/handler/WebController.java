package kr.or.ddit.common.handler;

import java.io.FileReader;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;
import java.util.Properties;
import java.util.Set;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class WebController extends HttpServlet {

	@Override
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		processCommand(request, response);
	}

	@Override
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
			processCommand(request, response);
	}

	private Map<String, CommandHandler> cmdHandlerMap = new HashMap<String, CommandHandler>();
	private static final int MAX_THRESHOLD = 1024 * 1024 * 3;
	private static final long MAX_FILE_SIZE = 1024 * 1024 * 40;
	private static final long MAX_REQUEST_SIZE = 1024 * 1024 * 40;

	@Override
	public void init(ServletConfig config) throws ServletException {
		String configFilePath = config.getInitParameter("handler-config"); 
		Properties handlerProp = new Properties(); 

		String configFileRealPath = config.getServletContext().getRealPath(configFilePath); 
		FileReader fr;
		try {
			fr = new FileReader(configFileRealPath);

			handlerProp.load(fr); 
		} catch (IOException e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

		for (Object key : handlerProp.keySet()) {
			String reqUrl = (String) key; 

			try {
				Class<?> klass = Class.forName(handlerProp.getProperty(reqUrl));
				CommandHandler handlerInstance = (CommandHandler) klass.newInstance();
				cmdHandlerMap.put(reqUrl, handlerInstance);
			} catch (Exception e) {
				e.printStackTrace();
				throw new ServletException(e);
			}
		}
		Set<Map.Entry<String, CommandHandler>> entrySet = cmdHandlerMap.entrySet(); 
		for (Map.Entry<String, CommandHandler> entry : entrySet) {
			System.out.print(entry.getKey() + " => ");
			System.out.println(entry.getValue());
		}
	}

	private void processCommand(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
		String reqURI = request.getRequestURI();

		if (reqURI.indexOf(request.getContextPath()) == 0) { 
			reqURI = reqURI.substring(request.getContextPath().length()); 
		}

		System.out.println("reqURI : " + reqURI);

		CommandHandler handler = cmdHandlerMap.get(reqURI); 

		if (handler == null) {
			handler = new NullHandler();
		}

		String viewPage = ""; 
		try {
			viewPage = handler.process(request, response);
		} catch (Exception e) {
			e.printStackTrace();
			throw new ServletException(e);
		}

		System.out.println("viewPage : " + viewPage);

		if (viewPage != null) { 
			if (handler.isRedirect(request)) {
				response.sendRedirect(viewPage); 
			} else {
				RequestDispatcher dispatcher = request.getRequestDispatcher(viewPage);
				dispatcher.forward(request, response);
			}
		}
	}
}