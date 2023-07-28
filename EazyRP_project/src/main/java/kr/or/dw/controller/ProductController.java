package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.List;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.ProductService;
import kr.or.dw.vo.BsheetVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productBuy")
	public ModelAndView productBuy(ModelAndView mnv, String mcode) throws SQLException {
		String url = "product/productBuy.page";
		List<BsheetVO> sheet = productService.getB_sheet();
		
		mnv.addObject("mcode", mcode);
		mnv.addObject("sheet", sheet);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/productOrder")
	public ModelAndView productOrder(ModelAndView mnv, String mcode) {
		String url = "product/productOrder.page";
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		return mnv;
	}
	
	
}
