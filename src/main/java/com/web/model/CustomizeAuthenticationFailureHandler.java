package com.web.model;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.web.authentication.AuthenticationFailureHandler;

public class CustomizeAuthenticationFailureHandler implements AuthenticationFailureHandler{

	private static final Logger logger = LoggerFactory.getLogger(CustomizeAuthenticationFailureHandler.class);

	@Override
	public void onAuthenticationFailure(HttpServletRequest req, HttpServletResponse resp, AuthenticationException arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
//		PrintWriter out = resp.getWriter();
//		out.print("<script>alert('응 인증 실패~')</script>");
//		out.flush();
//		out.close();
		
		//HttpSession session = req.getSession();
		
		System.out.println("실패시 여기 오냐?");
		
		//alert? X 네이버 방식.
//		String defaultAuthority = "ROLE_ANONYMOUS";
//		
//		
//		HttpSession session = req.getSession();
//		
//		if(session.getAttribute("authorities") == null) {
//			session.setAttribute("authorities", defaultAuthority);
//			
//			
//		}
		
		
		
		
		//session.setAttribute("msg", msg);
		
		resp.sendRedirect(req.getContextPath() + "/user_login_failure"); 
		 
	}

}
