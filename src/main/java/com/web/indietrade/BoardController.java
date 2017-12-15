package com.web.indietrade;

import java.io.File;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.AlbumDBBean;
import com.web.model.BoardDBBean;
import com.web.service.BoardMapper;

@Controller
public class BoardController {
	@Autowired
	private BoardMapper boardMapper;
	
	@RequestMapping(value="/board_list")
	public ModelAndView album_list() {
		List<BoardDBBean> list = boardMapper.listBoard();
		ModelAndView mav = new ModelAndView();
		mav.addObject("boardList", list);
		mav.setViewName("board_list");
		return mav;
			}
	
	@RequestMapping(value="/indie_write", method=RequestMethod.GET)
	public String writeFormAlbum() throws Exception {
		return "writeForm2";
		}
	@RequestMapping(value="/indie_write", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest arg0,
			@ModelAttribute BoardDBBean dto, BindingResult result) throws Exception {
		
		System.out.println(dto.getAlbumName() + "1");
		System.out.println(dto.getArtistName()+ "3");
		System.out.println(dto.getMvlink()+ "4"); 
		
		int res = boardMapper.insertBoard(dto);
		return new ModelAndView("redirect:board_list");
		}
}
