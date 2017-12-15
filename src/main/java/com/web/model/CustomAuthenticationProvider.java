package com.web.model;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

@Component 
public class CustomAuthenticationProvider implements AuthenticationProvider { 
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class); 

	@Autowired 
	UserService userService; 
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Override  
	public Authentication authenticate(Authentication authentication) throws AuthenticationException { 
		String username = authentication.getPrincipal().toString(); 
		System.out.println("유저네임은 " + username);

		String password = (String) authentication.getCredentials().toString(); 
		System.out.println("패스워드는 " + password);

		User user = null; 
		Collection<? extends GrantedAuthority> authorities;

		System.out.println("유저서비스.로드유저바이네임 실행 이전");
		
		user = (User) userService.loadUserByUsername(username);

		if(user!=null) {
			
			System.out.println("유저서비스.로드유저바이네임 실행 이후 ㅎㅎ");
			

			//if (user.getPassword().equals(password)) {
			if(passwordEncoder.matches(password, user.getPassword())) {
				
				//if(user.getEmailAuth().equals("N")) {
				
				System.out.println("Authentication Success!!!");


				System.out.println("유저 아이디 비교 : " + username + " / " + user.getUsername() );
				System.out.println("유저 비번 비교 : " + password + " / " + user.getPassword() );

				authorities = user.getAuthorities();
				
				return new UsernamePasswordAuthenticationToken(username, password, authorities);

			} else { //sigh.. 아이디는 비지 않았고, 디비에 있는데 비번이 맞지않을때

				System.out.println("Authentication Failed!!!");

				throw new BadCredentialsException("Bad credentials");

			}
		}else {
			//1.username이 비었을때.
			if(username=="") {
				System.out.println("1111");
				//alert?
			}
			//username이 비지 않았는데 디비에 없어서 튕길때
			if(username!="") {
				System.out.println("2222");
				// alert? 
			}
			//비번이 비었을때.
			if(password=="") {
				System.out.println("3333");
				//alert?
			}
			
			throw new UsernameNotFoundException("User name not found.");

		}

	}



	@Override 
	public boolean supports(Class<?> arg0) { 
		return true; 
	}

}

