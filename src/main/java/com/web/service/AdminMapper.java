package com.web.service;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.web.model.CategoryDBBean;



@Service
public class AdminMapper {

	@Autowired
	private SqlSession sqlSession;
	
	//�μ�Ʈ
	public int insertCategory(CategoryDBBean dto) {
		// TODO Auto-generated method stub
		return sqlSession.insert("insertCategory", dto);
	}
	
	//search - ��ü�˻�
	public List search(String searchString) {
		return sqlSession.selectList("searchAll");
	}
	
	//����Ʈ
//	public List<ArtistDBBean> listAllArtist() {
//		return sqlSession.selectList("listAllArtist");
//	}
//	public List<FanDBBean> listAllFan() {
//		return sqlSession.selectList("listAllFan");
//	}
//	public List<AlbumDBBean> listAlbum() {
//		return sqlSession.selectList("listAlbum");
//	}
	public List<CategoryDBBean> listCategory() {
		return sqlSession.selectList("listCategory");
	}
//	
//	//��
//	public ArtistDBBean getArtist(int num) {
////		if (mode.equals("content")) {
////			readCount(num);
////		}
//		ArtistDBBean dto = null;
//		dto = (ArtistDBBean)sqlSession.selectOne("getArtist", num);
//		return dto;
//
//	}
//	public FanDBBean getFan(int num) {
////		if (mode.equals("content")) {
////			readCount(num);
////		}
//		FanDBBean dto = null;
//		dto = (FanDBBean)sqlSession.selectOne("getFan", num);
//		return dto;
//
//	}
//	public AlbumDBBean getAlbum(int num) {
////		if (mode.equals("content")) {
////			readCount(num);
////		}
//		AlbumDBBean dto = null;
//		dto = (AlbumDBBean)sqlSession.selectOne("getAlbum", num);
//		return dto;
//
//	}
	public CategoryDBBean getCategory(int num) {
//		if (mode.equals("content")) {
//			readCount(num);
//		}
		CategoryDBBean dto = null;
		dto = (CategoryDBBean)sqlSession.selectOne("getCategory", num);
		return dto;

	}
//	
//	
//	//������Ʈ
//	public int updateArtist(ArtistDBBean dto) {
//		//ArtistDBBean dto2 = getArtist(dto.getNo());
//		
//		return sqlSession.update("updateArtist", dto);
//
//	}
//	public int updateFan(FanDBBean dto) {
//		//BoardDBBean dto2 = getBoard(dto.getNo());
//	
//		return sqlSession.update("updateFan", dto);	
//	}
//	public int updateAlbum(AlbumDBBean dto) {
//		//AlbumDBBean dto2 = getAlbum(dto.getNum());
//		
//		return sqlSession.update("updateAlbum", dto);
//
//	}
	public int updateCategory(CategoryDBBean dto) {
		//AlbumDBBean dto2 = getAlbum(dto.getNum());
		
		return sqlSession.update("updateCategory", dto);

	}
//	
//	//����Ʈ
//	public int deleteArtist(int no) {
//		ArtistDBBean dto = getArtist(no);
//
//		return sqlSession.delete("deleteArtist", no);
//
//	}
//	public int deleteFan(int no) {
//		FanDBBean dto = getFan(no);
//
//		return sqlSession.delete("deleteFan", no);
//
//	}
//	public int deleteAlbum(int no) {
//		AlbumDBBean dto = getAlbum(no);
//
//		return sqlSession.delete("deleteAlbum", no);
//
//	}
	public int deleteCategory(int no) {
		CategoryDBBean dto = getCategory(no);

		return sqlSession.delete("deleteCategory", no);

	}

	
	//��
//	public int banArtist(int sno, String ip, int duration) {
//		// TODO Auto-generated method stub
//		ArtistDBBean dto = getArtist(sno);
//		//ip ��� ..
//		//�ð� ����.. (�󸶵��� ������)
//		return 0;
//	}
//
//	public int banFan(int sno, String ip, int duration) {
//		// TODO Auto-generated method stub
//		FanDBBean dto = getFan(sno);
//		
//		//ip ��� ..
//		//�ð� ����.. (�󸶵��� ������)
//		return 0;
//	}
	
	
	
	
	

}
