package kr.or.dw.controller;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.OrderSaleService;

@Controller
@RequestMapping("/erp4")
public class OrderSheetController {
	
	@Autowired
	private OrderSaleService orderSaleService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderSheetController.class);
	
	@RequestMapping("/productSale")
	public ModelAndView productSale(ModelAndView mnv, String mcode, HttpSession session, SearchCriteria cri)  {
		String url = "jihwan/productSale.page";
//		String c_no = (String) session.getAttribute("c_no");
//		Map<String, Object> dataMap = new HashMap<>();
//		Map<String, Object> map = new HashMap<>();
//		dataMap.put("c_no", c_no);
//		dataMap.put("cri", cri);
//		
////		map = OrderSaleService.getS_sheet(dataMap);
//		mnv.addObject("searchType", cri.getSearchType());
//		mnv.addObject("keyword", cri.getKeyword());
//		mnv.addObject("mcode", mcode);
//		mnv.addAllObjects(map);
		mnv.setViewName(url);
		return mnv;
		
	}
	
}
