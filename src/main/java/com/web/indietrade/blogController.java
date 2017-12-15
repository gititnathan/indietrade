package com.web.indietrade;

import java.io.File;
import java.text.DateFormat;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.BlogDBBean;
import com.web.service.BlogMapper;
@Controller
public class blogController {
	@Autowired
	private BlogMapper blogMapper;
	@RequestMapping(value="/blog_main")
	public ModelAndView blog_main(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		List<BlogDBBean> list = null;
//		list = (List<BlogDBBean>) blogMapper.getallblog();
		
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/blogmain");
		mav.addObject("bloglist", list);
		return mav;
	}
	@RequestMapping(value="/sns" ,method = RequestMethod.GET)
	public ModelAndView sns(HttpServletRequest req , HttpServletResponse resp, Locale locale) throws Exception {
		String name =req.getParameter("name");
		if(name.equals("")||name==null)return new ModelAndView("redirect:blog_main");
		BlogDBBean dto = null;
		dto = blogMapper.getblog(name);
		Date date = new Date();
		DateFormat dateFormat = DateFormat.getDateTimeInstance(DateFormat.LONG, DateFormat.LONG, locale);
		String formattedDate = dateFormat.format(date);
		ModelAndView mav = new ModelAndView();
		req.setAttribute("serverTime", formattedDate );
		mav.setViewName("blog/snsPageView");
		mav.addObject("dto", dto);
		return mav;
	}
	
	
	@RequestMapping(value="/sns_update" ,method = RequestMethod.GET)
	public ModelAndView update(HttpServletRequest req , HttpServletResponse resp) throws Exception {
		String name =req.getParameter("name");
		if(name.equals("")||name==null)return new ModelAndView("redirect:blog_main");
		BlogDBBean dto = null;
		dto = blogMapper.getblog(name);
		ModelAndView mav = new ModelAndView();
		mav.setViewName("blog/snsPageViewUpdate");
		mav.addObject("dto", dto);
		return mav;
	}
	
	@RequestMapping(value="/sns_blog_pagemainimgnameUp", method=RequestMethod.POST)
	public @ResponseBody int blog_pagemainimgnameUp(HttpServletRequest arg0,@ModelAttribute BlogDBBean dto) throws Exception{
		

System.out.println(dto.getUser_no());
System.out.println(dto.getArtistId());
System.out.println(arg0.getAttribute("user_no"));

	MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
	System.out.println(mr.getAttribute("user_no"));
	System.out.println(mr.getAttribute("pageproimgname"));
	MultipartFile mf = mr.getFile(dto.getPageproimgname());
	String filename = mf.getOriginalFilename();
	
	System.out.println("파일이름 = "+filename);
	dto.setPageproimgname(filename);
	int res = blogMapper.blog_pagemainimgnameUp(dto);
	//경로 설정
	HttpSession session = arg0.getSession();
	String upPath = session.getServletContext().getRealPath("/resources/img");
	
	//서버에 파일 쓰기
	
	File file = new File(upPath, filename);
	mf.transferTo(file);
		return res;
	}
	
}
