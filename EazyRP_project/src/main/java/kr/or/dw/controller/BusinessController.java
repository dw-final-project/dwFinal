package kr.or.dw.controller;

import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.EstimateService;
import kr.or.dw.service.MenuService;
import kr.or.dw.vo.EstimateVO;

@Controller
@RequestMapping("/erp3")
public class BusinessController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private EstimateService estimateService;
	
	
	@RequestMapping("/business")
	public ModelAndView main(ModelAndView mnv) throws SQLException {
		String url = "jihwan/main";
		
		List<EstimateVO> estimList = estimateService.selectEstimList();
		mnv.setViewName(url);
		mnv.addObject("estimList" ,estimList);
		
		return mnv;
	}
	
	@RequestMapping("/estimate")
	public String esti() {
		String url = "jihwan/estimate";
		return url;
	}

	@RequestMapping("/estimateSelect")
	public String estSel() {
		String url = "jihwan/estimateSelect";
		return url;
	}
	
	@RequestMapping("/siSelect")
	public String siSel() {
		String url = "jihwan/siSelect";
		return url;
	}
	
	@RequestMapping("/s_Sheet")
	public String sSheet() {
		String url = "jihwan/s_Sheet";
		return url;
	}
	
}
