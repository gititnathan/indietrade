package com.web.indietrade;

import java.util.List;


import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.annotation.Secured;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.CategoryDBBean;
import com.web.service.AdminMapper;

@Secured("ROLE_ADMIN")
@Controller
public class AdminController {

	@Autowired
	private AdminMapper adminMapper;
	
	// Index

	@RequestMapping(value="/admin_main")
	public String indexAdmin(HttpServletRequest req, Authentication auth) throws Exception {
		//String currentUser = SecurityContextHolder.getContext().getAuthentication().getName();
		
		//System.out.println("auth 는 " + auth);
		
		//System.out.println("auth 는 " + auth.getAuthorities());
		
		//System.out.println( "currentUser 는 = " + currentUser);
		
		
		return "admin/main";
	}
	
	// Index
//	@RequestMapping(value="/admin_mainhome_index") 
//	public String indexAdmin_MainHome() throws Exception {
//		return "admin/mainhome/index";
//	}
	@RequestMapping(value="/admin_category_index")
	public String indexAdmin_Category() throws Exception {
		return "admin/mainhome/category/index";
	}
	
	//CREATE
	//insertMusicCategory and what about form ?
	@RequestMapping(value="/admin_insertCategory", method=RequestMethod.GET)
	public String insertCategory() throws Exception {
	
		return "admin/mainhome/category/insert_category";
	}

	@RequestMapping(value="/admin_insertCategory", method=RequestMethod.POST)
	public ModelAndView insertProCategory(HttpServletRequest arg0,
			@ModelAttribute CategoryDBBean dto, BindingResult result) throws Exception {
		if (result.hasErrors()) {
			System.out.println("dto.getNo().. " + dto.getNum());
		}

		int res = adminMapper.insertCategory(dto); 			
		return new ModelAndView("redirect:admin_listCategory");
	}


//	//READ
//	@RequestMapping(value="/admin_listAllArtist")
//	public ModelAndView listAllArtist() throws Exception {
//		List<ArtistDBBean> list = null;
//		list = adminMapper.listAllArtist();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("admin/listAllArtist");
//		mav.addObject("artistList", list);
//		
//		return mav;
//	}
//	@RequestMapping(value="/admin_listAllFan")
//	public ModelAndView listAllFan() throws Exception {
//		List<FanDBBean> list = null;
//		list = adminMapper.listAllFan();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("admin/listAllFan");
//		mav.addObject("artistList", list);
//		
//		return mav;
//	}
//	@RequestMapping(value="/admin_listAlbum")
//	public ModelAndView listAlbum() throws Exception {
//		List<AlbumDBBean> list = null;
//		list = adminMapper.listAlbum();
//		ModelAndView mav = new ModelAndView();
//		mav.setViewName("admin/listAllArtist");
//		mav.addObject("artistList", list);
//		
//		return mav;
//	}	
	@RequestMapping(value="/admin_listCategory")
	public ModelAndView listCategory() throws Exception {
		List<CategoryDBBean> list = null;
		list = adminMapper.listCategory();
		ModelAndView mav = new ModelAndView();
		mav.setViewName("admin/mainhome/category/list_category");
		mav.addObject("categoryList", list);
		
		return mav;
	}


	//UPDATE
//	@RequestMapping(value="/admin_updateArtist", method=RequestMethod.GET)
//	public ModelAndView updateArtist(HttpServletRequest arg0, @RequestParam String no,
//			HttpServletResponse arg1) throws Exception {
//
//		int sno = Integer.parseInt(no);
//		ArtistDBBean dto = adminMapper.getArtist(sno);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("getArtist", dto);
//		mav.setViewName("artist/artist_edit");
//		return mav; 	
//	}
//	@RequestMapping(value="/admin_updateArtist", method=RequestMethod.POST)
//	public ModelAndView updateProArtist(HttpServletRequest arg0,
//			@ModelAttribute ArtistDBBean dto, BindingResult result) throws Exception {
//		if (result.hasErrors()) {	
//			System.out.println("���� ����, �Ѿ�� dto.getNo() ����.. " + dto.getNo());
//		}
//		
//		int res = adminMapper.updateArtist(dto);
//		
//		return new ModelAndView("redirect:admin_listAllArtist");
//	}
//	@RequestMapping(value="/admin_updateFan", method=RequestMethod.GET)
//	public ModelAndView updateFan(HttpServletRequest arg0, @RequestParam String no,
//			HttpServletResponse arg1) throws Exception {
//
//		int sno = Integer.parseInt(no);
//		FanDBBean dto = adminMapper.getFan(sno);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("getFan", dto);
//		mav.setViewName("fan/fan_edit");
//		return mav; 	
//	}
//	@RequestMapping(value="/admin_updateFan", method=RequestMethod.POST)
//	public ModelAndView updateProFan(HttpServletRequest arg0,
//			@ModelAttribute FanDBBean dto, BindingResult result) throws Exception {
//		if (result.hasErrors()) {	
//			System.out.println("���� ����, �Ѿ�� dto.getNo() ����.. " + dto.getNo());
//		}
//
//		int res = adminMapper.updateFan(dto);
//
//		return new ModelAndView("redirect:admin_listAllFan");
//	}
//	@RequestMapping(value="/admin_updateAlbum", method=RequestMethod.GET)
//	public ModelAndView updateAlbum(HttpServletRequest arg0, @RequestParam String no,
//			HttpServletResponse arg1) throws Exception {
//
//		int sno = Integer.parseInt(no);
//		AlbumDBBean dto = adminMapper.getAlbum(sno);
//		ModelAndView mav = new ModelAndView();
//		mav.addObject("getArtist", dto);
//		mav.setViewName("artist/artist_edit");
//		return mav; 	
//	}
//	@RequestMapping(value="/admin_updateAlbum", method=RequestMethod.POST)
//	public ModelAndView updateProAlbum(HttpServletRequest arg0,
//			@ModelAttribute AlbumDBBean dto, BindingResult result) throws Exception {
//		if (result.hasErrors()) {	
//			System.out.println("���� ����, �Ѿ�� dto.getNo() ����.. " + dto.getNum());
//		}
//
//		int res = adminMapper.updateAlbum(dto); 
//
//		return new ModelAndView("redirect:admin_listAlbum");
//	}
	@RequestMapping(value="/admin_updateCategory", method=RequestMethod.GET)
	public ModelAndView updateCategory(HttpServletRequest arg0, @RequestParam String num,
			HttpServletResponse arg1) throws Exception {

		int snum = Integer.parseInt(num);
		CategoryDBBean dto = adminMapper.getCategory(snum);
		ModelAndView mav = new ModelAndView();
		mav.addObject("getCategory", dto);
		mav.setViewName("admin/mainhome/category/edit_category");
		return mav; 	
	}
	@RequestMapping(value="/admin_updateCategory", method=RequestMethod.POST)
	public ModelAndView updateProCategory(HttpServletRequest arg0,
			@ModelAttribute CategoryDBBean dto, BindingResult result) throws Exception {
		if (result.hasErrors()) {	
			System.out.println("���� ����, �Ѿ�� dto.getNo() ����.. " + dto.getNum());
		}

		int res = adminMapper.updateCategory(dto); 

		return new ModelAndView("redirect:admin_listCategory");
	}
	


	//DELETE
//	@RequestMapping(value="/admin_deleteArtist")
//	public ModelAndView deleteArtist(@RequestParam String no) throws Exception {
//		int sno = Integer.parseInt(no);
//
//		int res = adminMapper.deleteArtist(sno);
//
//		return new ModelAndView("redirect:admin_listAllArtist");
//	}	
//	@RequestMapping(value="/admin_deleteFan")
//	public ModelAndView deleteFan(@RequestParam String no) throws Exception {
//		int sno = Integer.parseInt(no);
//
//		int res = adminMapper.deleteFan(sno);
//
//		return new ModelAndView("redirect:admin_listAllFan");
//	}
//	@RequestMapping(value="/admin_deleteAlbum")
//	public ModelAndView deleteAlbum(@RequestParam String no) throws Exception {
//		int sno = Integer.parseInt(no);
//
//		int res = adminMapper.deleteAlbum(sno);
//		//listArtist = ��Ƽ��Ʈ �������� (�ٹ���� ��Ȳ, �̸�, ���� ��..) ����
//		return new ModelAndView("redirect:admin_listArtist");
//	}
	@RequestMapping(value="/admin_deleteCategory")
	public ModelAndView deleteCategory(@RequestParam String num) throws Exception {
		int snum = Integer.parseInt(num);

		int res = adminMapper.deleteCategory(snum);
		//listArtist = ��Ƽ��Ʈ �������� (�ٹ���� ��Ȳ, �̸�, ���� ��..) ����
		return new ModelAndView("redirect:admin_listCategory");
	}

	//BAN
//	@RequestMapping(value="/admin_banArtist")
//	public ModelAndView deleteArtist(@RequestParam String no, @RequestParam String ip, @RequestParam int duration) throws Exception {
//		int sno = Integer.parseInt(no);
//
//		int res = adminMapper.banArtist(sno, ip, duration);
//
//		return new ModelAndView("redirect:admin_listAllBannedArtist");
//	}
//
//	@RequestMapping(value="/admin_banFan")
//	public ModelAndView deleteFan(@RequestParam String no, @RequestParam String ip, @RequestParam int duration) throws Exception {
//		int sno = Integer.parseInt(no);
//
//		int res = adminMapper.banFan(sno, ip, duration);
//
//		return new ModelAndView("redirect:admin_listAllBannedFan");
//	}

















}
