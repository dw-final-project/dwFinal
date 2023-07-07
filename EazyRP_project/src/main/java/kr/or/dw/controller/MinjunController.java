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

	private static final Logger logger = LoggerFactory.getLogger(HeesungController.class);
	
	@RequestMapping("/shop.do")
	public String main() {
		return "minjun/main";
	}
	
	
}
