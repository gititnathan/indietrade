package com.web.security;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service; 

import com.web.model.UserDBBean;
import com.web.service.LogMapper;

@Service
public class UserService implements UserDetailsService{
	
	private static final Logger logger = LoggerFactory.getLogger(UserService.class);

	@Autowired
	private LogMapper logMapper;
	
	@Override
	public UserDetails loadUserByUsername(final String username) throws UsernameNotFoundException {
		
		logger.info("username : " + username);
		
		
		// ȸ�� ���� dao (mapper) ���� �����͸� �о� ��.
		UserDBBean dto = logMapper.getMember_username(username);

		User user = null;
		
		if(dto!=null) {
			System.out.println("00 check came UserService");
			
			
			user = new User();
			user.setUsername(username);
			user.setPassword(dto.getPasswd());
			
			Role role = new Role();
			if(dto.getAuthority().equals("admin")) {
				role.setName("ROLE_ADMIN");
			}else if(dto.getAuthority().equals("artist")) {
				role.setName("ROLE_ARTIST");
			}else if(dto.getAuthority().equals("user")) {
				role.setName("ROLE_USER");
			}
			
			List<Role> roles = new ArrayList<Role>();
			roles.add(role);
			user.setAuthorities(roles);
		
			
			////
			user.setEmailAuth(dto.getEmailauth());
			////
			
			
			
		}
		
		
		return user;
		// test ���� ��ȣȭ��. 
		//String password = "aabcb987e4b425751e210413562e78f776de6285";

		
		
//		user.setUsername(username);
		//user.setPassword(password);
		
//		Role role = new Role(); 
//		role.setName("ROLE_USER");
		
//		List<Role> roles = new ArrayList<Role>(); 
//		roles.add(role); 
//		user.setAuthorities(roles);
		
		// ���� �����Ͱ� ���� ��� �ͼ��� 
		// if (user == null) throw new UsernameNotFoundException("������ ������ ã�� �� �����ϴ�."); 
		
		

	}
}
