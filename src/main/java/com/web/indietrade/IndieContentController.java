package com.web.indietrade;

import java.io.File;
import java.io.UnsupportedEncodingException;
import java.io.*;
import java.text.DateFormat;
import java.util.*;
import java.util.List;
import java.util.Locale;
import java.util.Map;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;

import com.web.model.AlbumDBBean;
import com.web.service.AlbumMapper;

@Controller
public class IndieContentController{
	@Autowired
	private AlbumMapper albumMapper;

	@RequestMapping(value="/album_list")
	public ModelAndView album_list() {
		List<AlbumDBBean> list = albumMapper.listAlbum();
		ModelAndView mav = new ModelAndView();
		mav.addObject("albumList", list);
		mav.setViewName("list");
		return mav;
	}
	
	@RequestMapping(value="/album_write", method=RequestMethod.GET)
	public String writeFormAlbum() throws Exception {
		return "writeForm";
	}
	
	@RequestMapping(value="/album_view")
	public String albumView() throws Exception {
		return "album/albumMain";
	}
	@RequestMapping(value="/album_write", method=RequestMethod.POST)
	public ModelAndView writePro(HttpServletRequest arg0,
			@ModelAttribute AlbumDBBean dto, BindingResult result) throws Exception {
		if (result.hasErrors()) {
			dto.setArtistnum(0);
			dto.setAlbumtitle("none");
			dto.setGenre("none");
			dto.setMusicFiles("");
			dto.setAlbumImage("");
			dto.setMvLink("");
			dto.setAlbumDesc("none");

		}
		String uploadPath ="D:\\spring\\files";
		String musicFiles = "";
		String albumImage = "";
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)arg0;
		MultipartFile musicfile = mr.getFile("musicFiles"); // multipartReqeust�� musicFiles�̶�� �ѱ� ���� MultipartFile�� �־��ش�.
		File musictarget = new File(uploadPath, musicfile.getOriginalFilename());  //target�̶�� ������ �����ϰ�. (���ε���, MultipartFile������ file�� ������ ���� �̸�)�� �־��ش�.
		if (musicfile.getSize()>0) {
			musicfile.transferTo(musictarget);//������ Ÿ������ �ű��.
			musicFiles = musicfile.getOriginalFilename();//�ռ� �������� ""�̶� ����name�� �����̸��� �Ѱ��ش�.
		}
		dto.setMusicFiles(musicFiles);//�׸��� ��Ƽ���� ����!


		MultipartFile imagefile = mr.getFile("albumImage");
		File atarget = new File(uploadPath, imagefile.getOriginalFilename());
		if (imagefile.getSize()>0) {
			imagefile.transferTo(atarget);//������ Ÿ������ �ű��.
			albumImage = imagefile.getOriginalFilename();//�ռ� �������� ""�̶� ����name�� �����̸��� �Ѱ��ش�.
		}
		dto.setAlbumImage(albumImage);
		int res = albumMapper.insertAlbum(dto);
		return new ModelAndView("redirect:album_list");
	}
	@RequestMapping(value="/album_content")
	public ModelAndView getAlbum(HttpServletRequest req, @RequestParam String num) throws Exception {
		int snum = Integer.parseInt(num);
		AlbumDBBean dto = albumMapper.getAlbum(snum,"content");
		ModelAndView mav = new ModelAndView();
		mav.addObject("getAlbum", dto);
		mav.setViewName("content");
		return mav;
	}
	@RequestMapping(value="/album_delete", method=RequestMethod.GET)
	public String deleteForm() {
		return "deleteForm";
	}
	@RequestMapping(value="/album_update", method=RequestMethod.GET)
	public ModelAndView UpdateFormAlbum(@RequestParam String num) throws Exception {
		int snum = Integer.parseInt(num); // int�� �޾ƿ��� ���
		AlbumDBBean dto = albumMapper.getAlbum(snum,"update"); // update��� mode�� dto�� �ҷ��´�.
		return new ModelAndView("board/updateForm", "getAlbum", dto); // "getAlbum"�� dto�� �Ѱ��ش�.
	}
	@RequestMapping(value="/album_update", method=RequestMethod.POST)
	protected ModelAndView UpdateProAlbum(HttpServletRequest req, @ModelAttribute AlbumDBBean dto, 
			BindingResult result)
					throws Exception {
		//���� �ޱ�
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req; // req�� ���� �ָ� ����ȯ�ؼ� mr�� ����ش�.
		MultipartFile mf = mr.getFile("filename"); // mr���� filename�� ������ �ִ� �ָ� �����ͼ� mf�� ��´�.
		String filename = mf.getOriginalFilename(); // mf���� ������ ���������� �̸��� String�� filename�� ����ش�.
		// ���� �̸��� �켱 üũ�غ���
		System.out.println("filename = " + filename);
		// ���� ��� �����ϱ�
		HttpSession session = req.getSession();
		String upPath = session.getServletContext().getRealPath("/files"); // ������ �������ִ� ��.
		// ������ ���� ����
		File file = new File(upPath, filename);
		if (result.hasErrors()) {
			dto.setAlbumnum(0);
		} else {
			mf.transferTo(file);
		}
		int res = albumMapper.updateAlbum(dto);
		/*if (res>0) {
		}else if (res<0) {
		}else {
		}*/
		return new ModelAndView("redirect:album_list");
	}
	@RequestMapping(value="/file_upload", method=RequestMethod.GET)
	public String form() {
		return "form";
	}
	@RequestMapping(value="/file_upload", method=RequestMethod.POST)
	// method = RequestMethod.GET 
	public Map fileUpload(HttpServletRequest req, HttpServletResponse rep) 
	{ 
		//������ ����� path ���� 
		String path = "D:\\7�� �ڹ� ������ ��Ǵ�\\"; 
		Map returnObject = new HashMap(); 
		try { 
			// MultipartHttpServletRequest ���� 
			MultipartHttpServletRequest mhsr = (MultipartHttpServletRequest) req; 
			Iterator iter = mhsr.getFileNames(); 
			MultipartFile mfile = null; 
			String fieldName = ""; 
			List resultList = new ArrayList();
			// ���丮�� ���ٸ� ���� 
			File dir = new File(path); 
			if (!dir.isDirectory()) { dir.mkdirs(); }
			// ���� ���ö����� 
			while (iter.hasNext()) { 
				fieldName = (String) iter.next(); // ������ �����ͼ� 
				mfile = mhsr.getFile(fieldName); 
				String origName; 
				origName = new String(mfile.getOriginalFilename().getBytes("8859_1"), "UTF-8"); //�ѱۃ��� ���� 
				// ���ϸ��� ���ٸ� 
				if ("".equals(origName)) { continue; }
				// ���� �� ����(uuid�� ��ȣȭ) 
				String ext = origName.substring(origName.lastIndexOf('.')); 
				// Ȯ���� 
				String saveFileName = getUuid() + ext; 
				// ������ path�� �������� 
				File serverFile = new File(path + File.separator + saveFileName); 
				mfile.transferTo(serverFile); 
				Map file = new HashMap();  // file�̶�� hashMap�� ���� �����̸��� origName�� ������ Ư�� ��ġ�� ������ �����̸��� �־���� �Ѵ�.
				file.put("origName", origName); 
				file.put("sfile", serverFile); 
				resultList.add(file); 
			}
			returnObject.put("files", resultList); 
			returnObject.put("params", mhsr.getParameterMap()); 
		} catch (UnsupportedEncodingException e) { 
			// TODO Auto-generated catch block 
			e.printStackTrace(); }catch (IllegalStateException e) { 
				// TODO Auto-generated catch block 
				e.printStackTrace(); } catch (IOException e) { 
					// TODO Auto-generated catch block 
					e.printStackTrace(); 
				} 
		return null; 
	} 
	//uuid���� 
	public static String getUuid() { 
		return UUID.randomUUID().toString().replaceAll("-", ""); 
	}
}