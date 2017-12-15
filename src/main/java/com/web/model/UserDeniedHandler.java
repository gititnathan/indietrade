package com.web.model;

import java.io.IOException;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.access.AccessDeniedException;
import org.springframework.security.web.access.AccessDeniedHandler;

public class UserDeniedHandler implements AccessDeniedHandler {
	@Override
	public void handle(HttpServletRequest req, HttpServletResponse resp, AccessDeniedException arg2)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		req.setAttribute("errMsg",arg2.getMessage());
		req.getRequestDispatcher("/WEB-INF/views/user/denied.jsp").forward(req, resp);
		
	}

}
