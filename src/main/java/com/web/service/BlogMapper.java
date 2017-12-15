package com.web.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.stereotype.Service;

import com.web.model.BlogDBBean;
import com.web.model.CategoryDBBean;



@Service
public class BlogMapper {

	@Autowired
	private SqlSession sqlSession;


	public BlogDBBean getallblog() {
	
		return (BlogDBBean) sqlSession.selectList("getallblog");
	}
	public BlogDBBean getblog(String name) {
		
		return sqlSession.selectOne("getblog",name);
	}
	public int blog_pagemainimgnameUp(BlogDBBean dto) {
		return sqlSession.update("blog_pagemainimgnameUp",dto);
	}


}
