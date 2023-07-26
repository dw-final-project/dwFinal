package kr.or.dw.controller;

import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MemberService;
import kr.or.dw.service.MenuService;
import kr.or.dw.vo.MenuVO;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private MenuService menuService;

	@GetMapping("/common/loginForm")
	public String loginForm(HttpServletResponse res) throws Exception {
		String url = "/common/loginForm";
		return url;
	}
	
	@RequestMapping("/security/accessDenied")
	public String accessDenied(HttpServletResponse res) throws Exception{
		String url = "security/accessDenied.open";
		
		res.setStatus(302);
		
		return url;
	}
	
	@RequestMapping("/common/LoginTimeOut")
	public void loginTimeOut(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>");
		out.println("alert('세션이 만료되었습니다.\\n다시 로그인하세요!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/LoginExpired")
	public void loginExpired(HttpServletRequest req, HttpServletResponse res) throws Exception {
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		out.println("<script>");
		out.println("alert('중복 로그인이 확인되었습니다.\\n 다시 로그인하면 다른 장치의 로그인은 해제됩니다!')");
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
	
	@RequestMapping("/common/main")
	public ModelAndView index(ModelAndView mnv, HttpSession session, HttpServletRequest req) throws SQLException{
		String url = "/common/main.main";
		if(session.getAttribute("id") != null) {
			System.out.println("저장된 아이디 : " + session.getAttribute("id"));
		}
		if(session.getAttribute("c_no") == null) {
			session.setAttribute("c_no", "");
			session.setAttribute("emp_no", 0);
		}
		List<MenuVO> menuList = menuService.selectMainMenuList();
		Map<String, Object> dataMap = menuService.selectSubMenuList(menuList);
		Map<String, List<MenuVO>> subMenuList = (Map<String, List<MenuVO>>) dataMap.get("subMenuList");
		Map<String, List<MenuVO>> smallMenuList = (Map<String, List<MenuVO>>) dataMap.get("smallMenuList");
		
		session.setAttribute("menuList", menuList);
		session.setAttribute("subMenuList", subMenuList);
		session.setAttribute("smallMenuList", smallMenuList);
		
		mnv.setViewName(url);	
		
		return mnv;
	}

	@RequestMapping("/common/registerForm")
	public String registerForm(HttpServletResponse res) throws Exception {
		return "/common/registerForm";

	}
	
	@RequestMapping("/common/change")
	public ModelAndView change(ModelAndView mnv, String mcode, HttpSession session,String selectedC_no, HttpServletRequest req) throws SQLException{
		String str = req.getRequestURI();
		String result = str.substring(0, str.indexOf("."));
		System.out.println(result);
		String url = "";
		System.out.println(mcode);
		if(mcode == null || mcode.equals("")) {
			url = "/common/main.do";
		} else {
			String getUrl = menuService.getUrl(mcode);
			String getUrlResult = getUrl.substring(0, getUrl.indexOf("."));
			String modMcode = mcode.substring(0, 3) + "0000";
			System.out.println(modMcode);
			url = getUrl + "?mcode=" + modMcode;
		}
		
		System.out.println("url = " + url);
		session.setAttribute("c_no", selectedC_no);
		if(selectedC_no.equals("C000001")) {
			session.setAttribute("emp_no", 1);
		} else if(selectedC_no.equals("C000002")) {
			session.setAttribute("emp_no", 2);
		} else if(selectedC_no.equals("C000003")) {
			session.setAttribute("emp_no", 3);
		} else if(selectedC_no.equals("C000004")) {
			session.setAttribute("emp_no", 4);
		} else if(selectedC_no.equals("C000005")) {
			session.setAttribute("emp_no", 5);
		} else if(selectedC_no.equals("C000006")) {
			session.setAttribute("emp_no", 6);
		}
		
		System.out.println(session.getAttribute("emp_no"));
		System.out.println(session.getAttribute("c_no"));
		mnv.setViewName("redirect:" + url);
		
		return mnv;
		
	}
	
	
}
