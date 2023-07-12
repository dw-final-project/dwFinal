package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MenuService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.ProcessVO;

@Controller
@RequestMapping("/erp5")
public class MinjunController {
	
	private static final Logger logger = LoggerFactory.getLogger(HeesungController.class);
	
	@Autowired
	private MenuService menuService;
	
	@RequestMapping("/shop")
	public ModelAndView index(ModelAndView mnv, String mcode) throws SQLException{
		String url = "/minjun/main.page";
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping("/shopRegistForm")
	public String shopRegistForm() {
		String url = "minjun/shop_open_regist";
		return url;
	}
	
	@RequestMapping("/product.do")
	public ModelAndView productMain(@RequestParam(defaultValue="M000000")String mcode, ModelAndView mnv) throws SQLException {
		String url = "minjun/product";
		
		// 메뉴 리스트
		List<MenuVO> menuList = menuService.selectMainMenuList(); 
		MenuVO menu = menuService.selectMenuByMcode(mcode);
		
		mnv.addObject("menu", menu);
		mnv.addObject("menuList", menuList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/productRegistForm")
	public String productRegistForm() {
		String url = "minjun/product_open_regist";
		return url;
	}
	
	@RequestMapping("/order.do")
	public ModelAndView orderMain(@RequestParam(defaultValue="M000000")String mcode, ModelAndView mnv) throws SQLException {
		String url = "minjun/order";
		
		// 메뉴 리스트
		List<MenuVO> menuList = menuService.selectMainMenuList(); 
		MenuVO menu = menuService.selectMenuByMcode(mcode);
		
		mnv.addObject("menu", menu);
		mnv.addObject("menuList", menuList);
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/orderRegistForm")
	public String orderRegistForm() {
		String url = "minjun/order_open_regist";
		return url;
	}
	
	@RequestMapping("/regist")
	public void regist(ProcessVO processVo, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
//		processService.registProcess(processVo);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
}
