package com.web.service;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.UserDBBean;

@Service
public class LogMapper {
	
	@Autowired
	private SqlSession sqlSession;
	
	public int insertUser(UserDBBean dto) {
		return sqlSession.insert("insertUser", dto);
	}
	

	public int checkId(UserDBBean dto) {
		// TODO Auto-generated method stub
		int isIdExist = sqlSession.selectOne("checkId", dto);
		System.out.println("isIdExist : " + isIdExist); //1 or 0
		
		return isIdExist;
		
	}
	public int checkEmail(UserDBBean dto) {
		// TODO Auto-generated method stub
		int isEmailExist = sqlSession.selectOne("checkEmail", dto);
		System.out.println("isEmailExist : " + isEmailExist); //1 or 0
		
		return isEmailExist;
		
	}
	public int checkPhone(UserDBBean dto) {
		// TODO Auto-generated method stub
		int isPhoneExist = sqlSession.selectOne("checkPhone", dto);
		System.out.println("isPhoneExist : " + isPhoneExist); //1 or 0
		
		return isPhoneExist;
		
	}
	
	public int checkNBE(UserDBBean dto) { 
		// TODO Auto-generated method stub
		int isNBE = sqlSession.selectOne("checkNBE", dto);
		System.out.println("isNBE : " + isNBE); //1 or 0
		
		return isNBE;
		
	}
	
	public int checkIE(UserDBBean dto) {
		// TODO Auto-generated method stub
		int isIE = sqlSession.selectOne("checkIE", dto);
		System.out.println("isIE : " + isIE); //1 or 0
		
		return isIE;
		
	}
	
	
	public int updatePassword (UserDBBean dto) {
		int isPwChanged = sqlSession.update("updatePassword", dto);
		
		return isPwChanged;
	}
	
	public int updateEmailAuth (UserDBBean dto) {
		int isEmailAuthUpdated = sqlSession.update("updateEmailAuth", dto);
		
		return isEmailAuthUpdated;
	}
	
	public UserDBBean getMember (String email) {
		UserDBBean dto = null;
		dto = (UserDBBean)sqlSession.selectOne("getMember", email);
		
		return dto;
	}
	
	public UserDBBean getMember_username (String username) {
		UserDBBean dto = null;
		dto = (UserDBBean)sqlSession.selectOne("getMember_username", username);
		
		return dto;
	}
	
	
	

	public void logoutCheck(HttpSession session) {
		// TODO Auto-generated method stub
		
	}

	public boolean loginCheck(UserDBBean dto, HttpSession session) {
		 String name = sqlSession.selectOne("loginCheck", dto);
		 System.out.println("name : " + name); //name or null
	       return (name == null) ? false : true;
	}

	public UserDBBean getMember_login(String id) {
		UserDBBean dto = null;
		System.out.println("id   하.. " + id);
		
		
		if(id=="") {
			id=null;
			
		}
		
		System.out.println("id   하.. " + id);
		
		
		
		dto = (UserDBBean)sqlSession.selectOne("getMember_login", id);
		
		return dto;
	}

	

	
	  
}
