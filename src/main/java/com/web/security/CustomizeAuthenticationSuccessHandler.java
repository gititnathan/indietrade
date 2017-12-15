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
//	    	 System.out.println("≈¨∏Ø ");
//	    	 System.out.println("§∑§∑§∑§ª√ﬂ±PûÅØÉ§∫§µ " + dto.isUseCookie());
//	     }
	     
	     System.out.println("authuser : " + authUser);
	     
	     //ººº«0. ¿Ø¿˙ ¿Ã∏ﬁ¿œ ¿Œ¡ı ¿Øπ´ ¿˙¿Â
	     session.setAttribute("isemailauth", dto.getEmailauth());
	     
	     System.out.println("TQTQT" + session.getAttribute("isemailauth"));
	     
	     //ººº«0.1 ¿Ø¿˙ ¿Ã∏ﬁ¿œ ¿˙¿Â
	     //session.setAttribute("email", dto.getEmail());
	     
	    //ººº«1. ¿Ø¿˙æ∆¿Ãµ ¿˙¿Â. 
	    session.setAttribute("authuser", authUser);

		//System.out.println("∏ÆΩ∫±‚∏¥1" + auth.getPrincipal());//¡§ªÛ √‚∑¬.
		//System.out.println("∏ÆΩ∫±‚∏¥2" + auth.getCredentials()); ∆–Ω∫øˆµÂ¥¬ æ»πﬁæ∆¡¸ (∫∏æ»ªÛ?). æ÷√ ø° æµµ•µµ æ¯¿Ω. 
		//System.out.println("∏ÆΩ∫±‚∏¥3" + auth.getAuthorities()); //¿Ã∑∏∞‘ πﬁ¿∏∏È ¡÷º“∞™ ≥™ø».
		
		
		
		Collection<? extends GrantedAuthority> authorities = auth.getAuthorities(); 

		Iterator<? extends GrantedAuthority> iter = authorities.iterator(); 
		while (iter.hasNext()) { 
			GrantedAuthority auth2 = iter.next(); 
			System.out.println(auth2.getAuthority());
		    //ººº«2. ¿Ø¿˙ ±««— ¿˙¿Â.
			session.setAttribute("authorities", auth2.getAuthority());
	        
		}
		
		resp.sendRedirect(req.getContextPath()+"/user_login_success");
	}

	



}
