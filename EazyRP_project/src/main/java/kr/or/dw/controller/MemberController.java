package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;
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
			System.out.println("이메일 인증 요청이 들어옴!");
			System.out.println("이메일 인증 이메일 : " + email);
			return mailService.joinEmail(email);
					
		};

	// 회원가입 
	@RequestMapping("/register")
	public String register(MemberVO member, String domainselect, HttpServletRequest req, HttpServletResponse res) throws Exception{
	    System.out.println(member.getId());  

		System.out.println("세팅 전 : " + member.getEmail());
		member.setEmail(member.getEmail()+ domainselect);
		System.out.println("세팅 후 : " + member.getEmail());
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
	public String IDfind(MemberVO member, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
		MemberVO status = memberService.idFind(member);
		String url = "";
	
		res.setContentType("text/html; charset=utf-8");
	      PrintWriter out = res.getWriter();
		if(status == null || status.equals("")) {			
			url = "/common/IDfindForm";
			  out.println("<script>");
		      out.println("alert('회원님의 이름 또는 이메일를 다시 확인해주세요.');");
		      out.println("</script>");
		}else {
	      out.println("<script>");
	      out.println("alert('회원님의 ID는 " + status.getId() + " 입니다.');");
	      out.println("</script>");
	      url = "/common/loginForm";
		}
		return url;
	}
	
	
	@RequestMapping("/PWfindForm")
	public String PWfindForm() {
		return "/common/PWfindForm";
	}

	@RequestMapping("/PWfind")
	public String PWfind(MemberVO member, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String status2 = memberService.pwFind(member);
		String url = "";
		res.setContentType("text/html; charset=utf-8");
	      PrintWriter out = res.getWriter();
		if(status2 == null || status2.equals("")) {
			url = "/common/PWfindForm";
			  out.println("<script>");
		      out.println("alert('회원님의 아이디 또는 이메일를 다시 확인해주세요.');");
		      out.println("</script>");
		} else {
			url = "/common/PWrenew";
		}
		
		return url;
	}
	
	@RequestMapping("/PWrenew")
	public String PWrenew (MemberVO member, HttpServletRequest req, HttpServletResponse res) throws Exception{
		String pw = memberService.pwRenew(member);
		String url = "/common/loginForm";
				
		return url;
	}
	
	
}
