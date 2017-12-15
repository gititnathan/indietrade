package com.web.security;

import java.io.IOException;
import java.util.Collection;
import java.util.Iterator;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.web.authentication.AuthenticationSuccessHandler;

import com.web.model.UserDBBean;
import com.web.service.LogMapper;

public class CustomizeAuthenticationSuccessHandler implements AuthenticationSuccessHandler {

	private static final Logger logger = LoggerFactory.getLogger(CustomizeAuthenticationSuccessHandler.class);
	
	@Autowired
	private LogMapper logMapper;
	
	@Override
	public void onAuthenticationSuccess(HttpServletRequest req, HttpServletResponse resp, Authentication auth)
			throws IOException, ServletException {
		// TODO Auto-generated method stub
		
		 HttpSession session = req.getSession();
	     String authUser = (String) auth.getPrincipal();
	    		 			//OR (String) SecurityContextHolder.getContext().getAuthentication().getPrincipal();
		
	     
	     
	     
	     UserDBBean dto = logMapper.getMember_login(authUser);
	     
//	     if(req.getParameter("remember").equals("remember")) {
//	    	 dto.setUseCookie(true);
//	    	 System.out.println("Ŭ�� ");
//	    	 System.out.println("���������߱P�������� " + dto.isUseCookie());
//	     }
	     
	     System.out.println("authuser : " + authUser);
	     
	     //����0. ���� �̸��� ���� ���� ����
	     session.setAttribute("isemailauth", dto.getEmailauth());
	     
	     System.out.println("TQTQT" + session.getAttribute("isemailauth"));
	     
	     //����0.1 ���� �̸��� ����
	     //session.setAttribute("email", dto.getEmail());
	     
	    //����1. �������̵� ����. 
	    session.setAttribute("authuser", authUser);

		//System.out.println("�����⸴1" + auth.getPrincipal());//���� ���.
		//System.out.println("�����⸴2" + auth.getCredentials()); �н������ �ȹ޾��� (���Ȼ�?). ���ʿ� ������ ����. 
		//System.out.println("�����⸴3" + auth.getAuthorities()); //�̷��� ������ �ּҰ� ����.
		
		
		
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities(); 

		Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
		while (iter.hasNext()) { 
			GrantedAuthority auth2 = iter.next(); 
			System.out.println(auth2.getAuthority());
		    //����2. ���� ���� ����.
			session.setAttribute("authorities", auth2.getAuthority());
	        
		}
		
		resp.sendRedirect(req.getContextPath()+"/user_login_success");
	}

	



}
