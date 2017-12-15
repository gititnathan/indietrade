package com.web.indietrade;

import java.io.File;
import java.util.Map;

import javax.annotation.Resource;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.view.RedirectView;

import com.web.security.TempKey;
import com.web.security.User;
import com.web.model.UserDBBean;
import com.web.service.LogMapper;

@Controller
public class LogController {

	@Autowired
	private LogMapper logMapper;

	@Autowired
	private JavaMailSender mailSender;

	@Resource(name="uploadPath")
	private String uploadPath;

	@Autowired
	BCryptPasswordEncoder passwordEncoder;

	@RequestMapping(value="/user_signup")
	public String signup() throws Exception{
		return "log/insertUser";	
	}

	@RequestMapping(value="/user_signup", method=RequestMethod.POST)
	public ModelAndView insertUser(HttpServletRequest req,
			@ModelAttribute UserDBBean dto, @RequestParam Map<String,String> requestParams, BindingResult result) throws Exception {
		if (result.hasErrors()) {
			System.out.println("dto.getNo는 " + dto.getNo());
			dto.setNo(0);
		}
		
		ModelAndView mav = new ModelAndView();
		
		//암호화된 비번 (최초 가입할때) 디비로 저장
		String password = dto.getPasswd();
		String encryptPassword = passwordEncoder.encode(password);

		System.out.println("오리지널 비번 : " + password);
		System.out.println("암호화된 비번 (최초 DB 저장) : " + encryptPassword);
		dto.setPasswd(encryptPassword);



		dto.setBirth(requestParams.get("yyyy") + requestParams.get("mm") + requestParams.get("dd")); //년월일 순으로 입력
		dto.setGender(requestParams.get("gender")); 
		dto.setGrade("bronze"); //bronze, silver, gold, vip

		dto.setIp(req.getRemoteAddr()); //ip주소

		//파일
		String filename = "";
		int filesize = 0;
		MultipartHttpServletRequest mr = (MultipartHttpServletRequest)req;
		MultipartFile file = mr.getFile("file");
		File target = new File(uploadPath, file.getOriginalFilename());
		if (file.getSize()>0) {
			file.transferTo(target);
			filename = file.getOriginalFilename();
			filesize = (int)file.getSize();
		}
		dto.setFilename(filename);
		dto.setFilesize(filesize);

		String authority = "";
		authority = req.getParameter("authority");
		//System.out.println("tqtq" + authority);
		if(authority.equals("a")) { //if equals a==artist
			dto.setAuthority("artist");
		}else { //if equals u==user.
			dto.setAuthority("user");
		}

		//dto.setAuthority("user"); //user , artist   ////manager (db상에서 직접 등록)

		int res = logMapper.insertUser(dto); 	

		HttpSession session = req.getSession(false);
		session.setAttribute("id", dto.getId());
		////
		String token = "token";
		//req.setAttribute("token", token);
		mav.setView(new RedirectView("user_authEmail")); //controller -> controller.
		session.setAttribute("token", token);
		
		return mav;
	}

	//회원가입 이메일 인증
	@RequestMapping(value = "/user_authEmail", method = {RequestMethod.GET})
	public ModelAndView authEmail(HttpServletRequest arg0, HttpServletResponse arg1) throws Exception{

		ModelAndView mav = new ModelAndView();
		HttpSession session = arg0.getSession(false);
		
		//System.out.println(arg0.getAttribute("token")); WHY NULL?
		
		if(session.getAttribute("token").equals("token")) {
			//String email = arg0.getParameter("email");
			//HttpSession session = arg0.getSession(false);
			//String authUser = (String)session.getAttribute("authuser");
			String user = (String)session.getAttribute("id");

			UserDBBean dto = logMapper.getMember_login(user);

			//	dto.setEmail(email);

			System.out.println(dto.getEmail());
			//	String name = arg0.getParameter("id");
			//	String email = arg0.getParameter("email");
			//	System.out.println(name + " " + email);

			String key = new TempKey().getKey(50, false);

			String setfrom = "no-reply@indietrade.kr";     // 왜 적용안돼?     
			String tomail  = dto.getEmail();   
			String title   = "[INDIETRADE] 이메일 인증 안내";      
			//String htmlContent = "yeah its test.";    
			String content = "<h1>환영합니다, " + dto.getName() + "님</h1>"
					+ "INDIETRADE를 이용해 주셔서 감사합니다."
					+ "사이트 가입을 완료하기 위해서는 아래 이메일 인증 링크를 이용해 가입절차를 완료 하셔야 합니다.<br>"
					+ "<a href='http://localhost:8081/indietrade/user_emailConfirm?key="
					+ key
					+ "' target='_blenk'>이메일 인증 하기</a>";
			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(new InternetAddress(setfrom, "IndieTrade"));  
				messageHelper.setTo(tomail);     
				messageHelper.setSubject(title); 
				messageHelper.setText(content, true);  

				mailSender.send(message);
				//arg1.sendRedirect("/user_emailConfirm?n=1");
				mav.addObject("email", dto.getEmail());
				mav.setViewName("log/signupOk");
				
				session.removeAttribute("token");
				session.setAttribute("token", "");
			} catch(Exception e){
				System.out.println(e);
			}
		}else {
			mav.setViewName("mainindex");
		}
		
		
		return mav; 
	}

	@RequestMapping(value = "/user_emailConfirm", method = {RequestMethod.GET})
	public @ResponseBody ModelAndView emailConfirm(HttpServletRequest arg0, Model model) throws Exception{

		System.out.println("여기까지 오냐?");

		ModelAndView mav = new ModelAndView();

		if(arg0.getParameter("key")!=null) {
			//arg0.setAttribute("check", true);


			//				DefaultTransactionDefinition def = new DefaultTransactionDefinition();
			//				def.setPropagationBehavior(TransactionDefinition.PROPAGATION_REQUIRED);
			//
			//				// construct an appropriate transaction manager
			//				DataSourceTransactionManager txManager = new DataSourceTransactionManager(dataSource);
			//				TransactionStatus sts = txManager.getTransaction(def);

			HttpSession session = arg0.getSession(false);
			String user = (String)session.getAttribute("id");
			UserDBBean dto = logMapper.getMember_login(user);
			int res = logMapper.updateEmailAuth(dto);
			//				if(res==1) {
			//					System.out.println("ㅋㅋㅋ 성공");
			//				}else {
			//					System.out.println("ㅡㅡ 실패 ");
			//				}


			//				    SecurityContextHolder.clearContext();
			//			        if(session != null) {
			//			            session.invalidate();
			//			        }
			//txManager.commit(sts);
			//				String msg = "이메일 인증이 완료되었습니다." +
			//							 "이제 해당 계정 및 이메일 사용이 가능합니다. 로그인 후 이용해 주시기 바랍니다.";

			mav.setViewName("log/emailAuthOk");

			session.invalidate(); //그동안 만들었던 세션 모두 삭제. (id, token, thrown)
			
			//System.out.println("#############확인##############");
			//System.out.println(session.getAttribute("id"));
			//System.out.println(session.getAttribute("token"));
			//System.out.println(session.getAttribute("thrown"));
			
			//mav.addObject("msg", msg);

			//return mav;

			//return "log/nigga";
		}
		return mav;

		//else {
		//arg0.setAttribute("check", false);

		//mav.setViewName("mainindex");
		//return mav; 
		//}

	}		


	//1. 로그인 화면
	@RequestMapping(value="/user_login")
	public String login() throws Exception{
		return "log/login";	
	}

	//성공시.
	@RequestMapping(value="/user_login_success")
	public ModelAndView loginSuccess(HttpSession session, HttpServletRequest req, HttpServletResponse resp) throws Exception{

		ModelAndView mav = new ModelAndView();

		String emailauth = (String) session.getAttribute("isemailauth");

		String authuser = (String) session.getAttribute("authuser");
		UserDBBean dto = null;
		if(authuser!=null) {
			dto = logMapper.getMember_login(authuser);

			System.out.println("dto.getName 은 " + dto.getName());

			session.setAttribute("username", dto.getName());
			mav.setViewName("mainindex");
			mav.addObject("msg", "success");

		}


		return mav;
	}

	//실패시.
	@RequestMapping(value="/user_login_failure")
	public ModelAndView loginFailure(HttpSession session) throws Exception{

		System.out.println();
		ModelAndView mav = new ModelAndView();
		String thrown = null;
		String msg = null;
		
		
		thrown = (String) session.getAttribute("thrown");
		System.out.println("thrown : " + thrown);
		
		if(thrown==null) {
			msg= "아이디 또는 비밀번호를 다시 확인하세요.\r\n" + 
					"인디트레이드에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.";
		
		}
		
		//if(thrown.equals("usernotfound")) {
		//}else
		if(thrown!=null && thrown.equals("wrongpw")) {
			msg= "아이디 또는 비밀번호를 다시 확인하세요.\r\n" + 
					"인디트레이드에 등록되지 않은 아이디이거나, 아이디 또는 비밀번호를 잘못 입력하셨습니다.";
			//		//session.setAttribute("msg", msg);
		}else if(thrown!=null && thrown.equals("noemailauth")) {
			msg = "인증되지 않은 계정입니다.\r\n" + 
					"이메일 인증을 완료해 주시기 바랍니다.";
		}
		mav.setViewName("log/login");
		mav.addObject("msg", msg);

		return mav;
	}
	
	//a(아티스트) 인지, f(팬, 유저) 인지.
	@RequestMapping(value="/user_aorf")
	public String aorf() throws Exception{
		return "log/aorf";	
	}

	@RequestMapping(value = "/user_checkId", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int idCheck(UserDBBean dto) throws Exception{
		//@ResponseBody 자동으로 json형태로 반환
		return logMapper.checkId(dto);
	}

	@RequestMapping(value = "/user_checkEmail", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int emailCheck(UserDBBean dto) throws Exception{
		return logMapper.checkEmail(dto);
	}

	@RequestMapping(value = "/user_checkPhone", method = { RequestMethod.GET, RequestMethod.POST})
	public @ResponseBody int phoneCheck(UserDBBean dto) throws Exception{
		return logMapper.checkPhone(dto);
	}
	
	//아이디찾기 checkNameBirthEmail.
	@RequestMapping(value = "/user_checkNBE", method = {RequestMethod.POST})
	public @ResponseBody int NBECheck(HttpServletRequest arg0, UserDBBean dto) throws Exception{

		int res = logMapper.checkNBE(dto);

		//no (pk) email (unique constraint) 
		String email = arg0.getParameter("email");  
		UserDBBean _dto = logMapper.getMember(email);

		if(res==1) {

			String setfrom = "milfastlane11@gmail.com";
			String receiverName = arg0.getParameter("name");
			String tomail  = arg0.getParameter("email");     
			String title   = "Indietrade id find mail.";      
			String content = receiverName + "님 안녕하세요. 아이디 안내입니다."
					+ "<br> your Id : " + _dto.getId()  ;    
			//String htmlContent = "<strong>안녕하세요</strong>, 반갑습니다. " + "<a href=\"emailAuth\">emailAuth로 가기</a>";

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(new InternetAddress(setfrom, "IndieTrade"));  
				messageHelper.setTo(tomail);     
				messageHelper.setSubject(title); 
				messageHelper.setText(content, true);  

				mailSender.send(message);



			} catch(Exception e){
				System.out.println(e);
			}
		}

		return res;

	}
	
	//비밀번호 찾기 checkIdEmail.
	@RequestMapping(value = "/user_checkIE", method = {RequestMethod.POST})
	public @ResponseBody int IECheck(HttpServletRequest arg0, UserDBBean dto) throws Exception{

		String email2 = arg0.getParameter("email2");
		dto.setEmail(email2);

		System.out.println(dto.getEmail());
		//	String name = arg0.getParameter("id");
		//	String email = arg0.getParameter("email");
		//	System.out.println(name + " " + email);

		String tempPassword = new TempKey().getKey(8, false);


		int res = logMapper.checkIE(dto);
		if(res==1) {
			String setfrom = "milfastlane11@gmail.com";         
			String tomail  = arg0.getParameter("email2");    
			String title   = "Indietrade 새로운 비밀번호 안내.";      
			//String htmlContent = "yeah its test.";    
			String content = arg0.getParameter("id") + "님의 새 비밀번호 안내입니다." 
					+ "<br> 새로운 비밀번호 : " + tempPassword;

			try {
				MimeMessage message = mailSender.createMimeMessage();
				MimeMessageHelper messageHelper 
				= new MimeMessageHelper(message, true, "UTF-8");

				messageHelper.setFrom(new InternetAddress(setfrom, "IndieTrade"));  
				messageHelper.setTo(tomail);     
				messageHelper.setSubject(title); 
				messageHelper.setText(content, true);  

				mailSender.send(message);

				UserDBBean _dto = logMapper.getMember_login(arg0.getParameter("id"));

				if(_dto!=null) {

					//1. _dto(UserDBBean) 바꿔주고,
					String newencryptPassword = passwordEncoder.encode(tempPassword);
					_dto.setPasswd(newencryptPassword);

					System.out.println("새로이 바뀌게 된 암호화된 _dto.getPasswd()는 ?? " +_dto.getPasswd());

					//2. 실제 디비 바꿔주기
					logMapper.updatePassword(_dto);
				}

			} catch(Exception e){
				System.out.println(e);
			}
		}

		return res;
	}
	
	@RequestMapping(value = "/user_account")
	public String UserAccount(HttpServletRequest arg0, UserDBBean dto){
		return "user/account";
	}

}
