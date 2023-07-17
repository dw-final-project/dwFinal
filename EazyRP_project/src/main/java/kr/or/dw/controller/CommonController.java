package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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

	@Autowired
	private MemberService memberService;
	
	@GetMapping("/common/loginForm")
	public String loginForm(HttpServletResponse res) throws Exception {
		String url = "/common/loginForm";
		return url;
	}
	
	@RequestMapping("/common/main")
	public ModelAndView index(ModelAndView mnv, HttpSession session) throws SQLException{
		String url = "/common/main.main";
		
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
	
	
	
}
