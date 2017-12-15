package com.web.model;

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
	     
	     System.out.println("authuser : " + authUser);
	     
	     //세션0. 유저 이메일 인증 유무 저장
	     session.setAttribute("isemailauth", dto.getEmailauth());
	     
	     //세션0.1 유저 이메일 저장
	     //session.setAttribute("email", dto.getEmail());
	     
	    //세션1. 유저아이디 저장. 
	    session.setAttribute("authuser", authUser);

		//System.out.println("리스기릿1" + auth.getPrincipal());//정상 출력.
		//System.out.println("리스기릿2" + auth.getCredentials()); 패스워드는 안받아짐 (보안상?). 애초에 쓸데도 없음. 
		//System.out.println("리스기릿3" + auth.getAuthorities()); //이렇게 받으면 주소값 나옴.	
		
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities(); 

		Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
		while (iter.hasNext()) { 
			GrantedAuthority auth2 = iter.next(); 
			System.out.println(auth2.getAuthority());
		    //세션2. 유저 권한 저장.
			session.setAttribute("authorities", auth2.getAuthority());
	        
		}
		
		resp.sendRedirect(req.getContextPath()+"/user_login_success");
	}

	



}
