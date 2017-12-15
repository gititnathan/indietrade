package com.web.security;


import java.util.Collection;


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.AuthenticationProvider;
import org.springframework.security.authentication.BadCredentialsException;
import org.springframework.security.authentication.DisabledException;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Component;

import com.web.model.UserDBBean;
import com.web.service.LogMapper;

@Component 
public class CustomAuthenticationProvider implements AuthenticationProvider { 
	private static final Logger logger = LoggerFactory.getLogger(CustomAuthenticationProvider.class); 

	@Autowired 
	UserService userService; 
	
	@Autowired
	BCryptPasswordEncoder passwordEncoder;
	
	@Autowired
	private LogMapper logMapper;
	
	@Override  
	public Authentication authenticate(Authentication authentication) throws AuthenticationException { 
		String username = authentication.getPrincipal().toString(); 
		System.out.println("���������� " + username);

		String password = (String) authentication.getCredentials().toString(); 
		System.out.println("�н������ " + password);

		User user = null; 
		Collection<? extends GrantedAuthority> authorities;

		System.out.println("��������.�ε��������̳��� ���� ����");
		
		user = (User) userService.loadUserByUsername(username);

		
		UserDBBean dto = logMapper.getMember_login(username);
		
		
		if(user!=null) {
			
			System.out.println("��������.�ε��������̳��� ���� ���� ����");
			

			//if (user.getPassword().equals(password)) { //�н����尡 �����鼭 �̸������� N�� �ƴҶ�.
			if(passwordEncoder.matches(password, user.getPassword())) {
				
				//if(user.getEmailAuth().equals("N")) {
				if(dto.getEmailauth().equals("Y")) {
				
				System.out.println("Authentication Success!!!");


				System.out.println("���� ���̵� �� : " + username + " / " + user.getUsername() );
				System.out.println("���� ��� �� : " + password + " / " + user.getPassword() );

				authorities = user.getAuthorities();
				
				return new UsernamePasswordAuthenticationToken(username, password, authorities);
				
				}else { //���̵𵵸°�, ����� �´µ� �̸��� ������ �ȵ�������
					//System.out.println("aosjdioshfoweugfgsuguir���������ʾ֤��ӷ��������");
					
					throw new DisabledException("Email Not Authenticated.");
				}
				
			} else { //sigh.. ���̵�� ���� �ʾҰ�, ��� �ִµ� ����� ����������

				System.out.println("Authentication Failed!!!");

				throw new BadCredentialsException("Wrong Password.");

			}
		}else {
			//1.username�� �������.
//			if(username=="") {
//				System.out.println("1111");
//			
//			}
//			//username�� ���� �ʾҴµ� ��� ��� ƨ�涧
//			if(username!="") {
//				System.out.println("2222");
//				// alert? 
//				//throw new BadCredentialsException("User name not found");
//			}
//			//����� �������.
//			if(password=="") {
//				System.out.println("3333");
//				//alert?
//			}
			
			throw new UsernameNotFoundException("User name not found OR either username or password is empty.");
			//return null;
		}

	}



	@Override 
	public boolean supports(Class<?> arg0) { 
		return true; 
	}

}

