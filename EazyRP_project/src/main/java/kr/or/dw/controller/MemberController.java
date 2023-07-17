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
	
	@GetMapping("/PWfindForm")
	public String PWfind(HttpServletResponse res) throws Exception {

		String url = "/common/PWfindForm";
		return url;
	}
	
	@RequestMapping("/PWfindForm")
	public String PWfind(MemberVO member, HttpServletRequest req, HttpServletResponse res) throws Exception {
		String status = memberService.pwFind(member);
		String url = "";
		if(status == null || status.equals("")) {
			
		} else {
			
		}
		
		return url;
	}
	
	@GetMapping("/IDfindForm")
	public String IDFind(HttpServletResponse res) throws Exception {
		String url = "/common/IDfindForm";
		return url;
	}
	
//	@GetMapping("/PWrenew")
//	public String PWrenew(HttpServletRequest res) throws Exception{
//		
//		String url = "/member/PWrenew";
//		return url;
//	}

}
