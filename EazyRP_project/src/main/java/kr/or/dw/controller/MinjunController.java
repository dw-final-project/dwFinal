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

	
	
}
