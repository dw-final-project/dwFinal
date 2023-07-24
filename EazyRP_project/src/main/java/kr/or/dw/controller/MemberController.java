package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.mail.javamail.JavaMailSenderImpl;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MailSendService;
import kr.or.dw.service.MemberService;
import kr.or.dw.vo.MemberVO;

@Component
@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;

	@Autowired
	private MailSendService mailService;
	
	@RequestMapping("/mypage")
	public ModelAndView index(ModelAndView mnv, String mcode) throws SQLException{
		String url = "/common/userProfile.page";
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		return mnv;
	}
	
	// 아이디 중복확인
	@RequestMapping("/idCheck") 
	public ResponseEntity<String> idCheck(String id, HttpServletRequest req){
		
		ResponseEntity<String> entity = null;
		
		try {
			MemberVO member = memberService.selectMemberById(id);
			entity = new ResponseEntity<String>(member == null ? id : "", HttpStatus.OK);
		} catch (Exception e) {
			e.printStackTrace();
			entity = new ResponseEntity<String>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	};

	//회원가입 페이지 이동

		@GetMapping("/registerForm")
		public void registerForm() {}
		
		//이메일 인증
		@GetMapping("/mailCheck")
		@ResponseBody
		public String mailCheck(String email) throws Exception{
			return mailService.joinEmail(email);
					
		};

	// 회원가입 
	@RequestMapping("/register")
	public String register(MemberVO member, String domainselect, HttpServletRequest req, HttpServletResponse res) throws Exception{
		member.setEmail(member.getEmail()+ domainselect);
		memberService.register(member);
		
		  res.setContentType("text/html; charset=utf-8");
	      PrintWriter out = res.getWriter();
	      out.println("<script>");
	      out.println("alert('회원가입이 정상적으로 되었습니다.');");
	      out.println("</script>");
	      
	      return "/common/loginForm";
	}
	
	@RequestMapping("/IDfindForm")
	public String IDfindForm(HttpServletResponse res) throws Exception {

		String url = "/common/IDfindForm";
		return url;
	}
	
	@RequestMapping("/IDfind")
	public void IDfind(MemberVO member, HttpServletResponse res) throws SQLException, IOException {
		MemberVO status = memberService.idFind(member);
		
		res.setContentType("text/html; charset=utf-8");
		System.out.println(status.getId());
	    PrintWriter out = res.getWriter();
		if(status == null || status.equals("")) {	
		  out.println("<script>");
		  out.println("alert('회원님의 이름 또는 이메일를 다시 확인해주세요.');");
		  out.println("location.href='/common/IDfindForm';");
		  out.println("</script>");
		}else {
	      out.println("<script>");
	      out.println("alert('회원님의 ID는 " + status.getId() + " 입니다.');");
	      out.println("location.href='/common/loginForm';");
	      out.println("</script>");
		}
		
	}
	
	
	@RequestMapping("/PWfindForm")
	public String PWfindForm() {
		return "/common/PWfindForm";
	}

	@RequestMapping("/PWfind")
	public ModelAndView PWfind(MemberVO member, HttpServletRequest req, HttpServletResponse res, ModelAndView mnv) throws Exception {
		String status2 = memberService.pwFind(member);
		
		if(status2 == null || status2.equals("")) {
			mnv.setViewName("/common/PWfindForm");
		} else {			
			mnv.addObject("id", member.getId());
			mnv.setViewName("/common/PWrenew");
		}
		
		return mnv;
	}
	@RequestMapping("/PWrenew")
	public ModelAndView PWrenew (ModelAndView mnv, String pwd, String id) throws Exception{
		String url = "/common/loginForm";
		
		memberService.pwRenew(pwd, id);		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modProfileForm")
	public String modProfile(){		
		return "/common/modProfile";
	}	

	@RequestMapping("/modProfile")
	public String Profile(MemberVO member, HttpServletResponse res) throws Exception {
		String Profile = memberService.modProfile(member);
		String url = "";
		if(Profile == null || Profile.equals("")) {
			  url = "/common/modProfile";
		}else {
			url="/common/userProfile";
		}
		return url;
	}
	
	@RequestMapping("/userProfile")
	public String userProfile(HttpServletResponse res) throws SQLException {
		return "/common/userProfile";
	}
	
}
