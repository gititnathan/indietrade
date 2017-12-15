package com.web.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.AlbumDBBean;


@Service
public class AlbumMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<AlbumDBBean> listAlbum(){
		//sqlSession
		//selectList, selectOne, insert, update, delete
		return sqlSession.selectList("listAlbum");
	}

	public int insertAlbum(AlbumDBBean dto) {
		return sqlSession.insert("insertAlbum", dto);
	}

	public AlbumDBBean getAlbum(int num, String mode) {
		if(mode.equals("content")) {
			readcount(num);
		}
		return sqlSession.selectOne("getAlbum", num);
	}

	public int deleteAlbum(int num) {
		return sqlSession.delete("deleteAlbum", num);
	}
	
	public void readcount(int num) {
		sqlSession.update("readcount", num);
	}

	public int updateAlbum(AlbumDBBean dto) {
		return sqlSession.update("updateAlbum", dto);
	}
	
}