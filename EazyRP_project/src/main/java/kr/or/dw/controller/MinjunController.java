package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.ProcessService;
import kr.or.dw.vo.ProcessVO;

@Controller
@RequestMapping("/erp4")
public class MinjunController {

	private static final Logger logger = LoggerFactory.getLogger(MinjunController.class);
	
	@RequestMapping("/shop.do")
	public String main() {
		return "minjun/main";
	}
	
<<<<<<< Updated upstream
	
=======

	@RequestMapping("/product")
	public ModelAndView productMain(String mcode, ModelAndView mnv) throws SQLException {
		String url = "minjun/product";
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping("/productRegistForm")
	public String productRegistForm() {
		String url = "minjun/product_open_regist";
		return url;
	}
	

	@RequestMapping("/order")
	public ModelAndView orderMain(String mcode, ModelAndView mnv) throws SQLException {
		String url = "minjun/order";
		
		
		mnv.addObject("mcode", mcode);		
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
>>>>>>> Stashed changes
}
