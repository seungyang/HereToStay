package com.madvirus.async;

import java.io.IOException;

import javax.servlet.AsyncContext;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
 

// 비동기 지원 서블릿 예시
@SuppressWarnings("serial")
@WebServlet(urlPatterns = "/hello", asyncSupported = true) // true = 비동기 선언
public class AsyncHelloWorldServlet extends HttpServlet {

	private Logger logger = Logger.getLogger(getClass());
	
	@Override
	protected void doGet(HttpServletRequest req, HttpServletResponse res)
			throws ServletException, IOException {
		final AsyncContext asyncContext = req.startAsync();		// 비동가 처리 객체
		
		new Thread(new Runnable() {		// 비동기로 응답을 처리할 쓰레드 생성, 실행
			
			@Override
			public void run() {
				try {
					Thread.sleep(5000);		// 5초간 실행 중지
				} catch (InterruptedException e) {
				}
				HttpServletResponse response = (HttpServletResponse) asyncContext.getResponse();	// 응답 전송
				response.setContentType("text/plain");
				response.setCharacterEncoding("UTF-8");
				
				try {
					response.getWriter().println("HELLO");
				} catch (IOException e) {
					e.printStackTrace();
				}
				logger.info("complete response");
				asyncContext.complete();	// 연결 종료
			}
		}).start();
		
		logger.info("doGet return");
	}

}
