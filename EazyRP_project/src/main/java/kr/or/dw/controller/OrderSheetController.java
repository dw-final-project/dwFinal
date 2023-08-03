package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
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
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.SaleDetailVO;
import kr.or.dw.vo.SsheetVO;

@Controller
@RequestMapping("/erp4")
public class OrderSheetController {
	
	@Autowired
	private OrderSaleService orderSaleService;
	
	private static final Logger logger = LoggerFactory.getLogger(OrderSheetController.class);
	
	@RequestMapping("/sale")
	public ModelAndView sale(ModelAndView mnv, String mcode, HttpSession session, SearchCriteria cri) throws SQLException  {
		String url = "jihwan/productSale.page";
		String c_no = (String) session.getAttribute("c_no");
		Map<String, Object> dataMap = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		dataMap.put("c_no", c_no);
		dataMap.put("cri", cri);
		
		map = orderSaleService.selectSaleList(dataMap);
		mnv.addObject("searchType", cri.getSearchType());
		mnv.addObject("keyword", cri.getKeyword());
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(map);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/saleDetail")
	public ModelAndView saleDetail (ModelAndView mnv,String sheet_no, HttpSession session) throws SQLException  {
		String url = "/jihwan/saleDetail.open";
		
		List<SaleDetailVO> saledetail = orderSaleService.getSaleDetail(sheet_no);
		SsheetVO sheet = orderSaleService.getSheet(sheet_no);
		
		mnv.addObject("saledetail" , saledetail);
		mnv.addObject("sheet", sheet);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
	
}
