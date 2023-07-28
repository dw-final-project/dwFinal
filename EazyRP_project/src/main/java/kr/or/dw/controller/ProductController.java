package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ProductService;
import kr.or.dw.vo.BsheetVO;
import kr.or.dw.vo.BuyDetailVO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.OrderVO;

@Controller
@RequestMapping("/product")
public class ProductController {

	private static final Logger logger = LoggerFactory.getLogger(ProductController.class);
	
	@Autowired
	private ProductService productService;
	
	@RequestMapping("/productBuy")
	public ModelAndView productBuy(ModelAndView mnv, String mcode, HttpSession session, SearchCriteria cri) throws SQLException {
		String url = "/product/productBuy.page";
		String c_no = (String) session.getAttribute("c_no");
		Map<String, Object> dataMap = new HashMap<>();
		Map<String, Object> map = new HashMap<>();
		dataMap.put("c_no", c_no);
		dataMap.put("cri", cri);
		
		map = productService.getB_sheet(dataMap);
		mnv.addObject("searchType", cri.getSearchType());
		mnv.addObject("keyword", cri.getKeyword());
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(map);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/findCompany")
	public ModelAndView findCompany(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		List<CompanyVO> company = productService.getCompanyList(cri);
		
		mnv.addObject("company", company);
		mnv.setViewName("/product/findCompany");
		return mnv;
	}
	
	@RequestMapping("/productBuyRegist")
	public ModelAndView productBuyRegist(ModelAndView mnv, HttpSession session) {

		mnv.addObject("empno", session.getAttribute("emp_no"));
		mnv.addObject("ename", session.getAttribute("e_name"));
		mnv.setViewName("/product/productBuyRegist");
		return mnv;
	}
	
	@RequestMapping("/productBuyRegistFrom")
	public void productBuyRegistFrom(HttpServletResponse res, HttpSession session, BsheetVO sheet, String[] pr_no, String[] pr_name, int[] quantity, int[] amount) throws SQLException, IOException {
		sheet.setBuy_c_no((String)session.getAttribute("c_no"));
		if(pr_name.length > 1) {
			int length = pr_name.length - 1 ;
			sheet.setPr_name(pr_name[0]+" 외 " + length + "건");
		}
		int sheet_no = productService.insertProductBuy(sheet);
		
		List<BuyDetailVO> detail = new ArrayList<BuyDetailVO>();

		
		for(int i = 0; i < pr_no.length; i++) {
			BuyDetailVO vo = new BuyDetailVO();
			vo.setAmount(amount[i]);
			vo.setPr_no(pr_no[i]);
			vo.setQuantity(quantity[i]);
			vo.setSheet_no(sheet_no);
			detail.add(i, vo);
			System.out.println(i + "번째 추가 " + vo);
		}
		productService.insertProductDetail(detail);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('구매 내역 추가가 완료되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
	}
	
	@RequestMapping("/buyDetail")
	public ModelAndView buyDetail(ModelAndView mnv, String sheet_no, HttpSession session) throws SQLException {
		String url = "/product/buyDetail";
		
		List<BuyDetailVO> detailVo = productService.getBuyDetail(sheet_no);
		BsheetVO sheetVo = productService.getSheet(sheet_no);
		
		mnv.addObject("sheet", sheetVo);
		mnv.addObject("detail", detailVo);
		mnv.setViewName(url);
		return mnv;
	}
	
	
	
	
	@RequestMapping("/productOrder")
	public ModelAndView productOrder(ModelAndView mnv, String mcode, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/product/productOrder.page";
		String c_no = (String) session.getAttribute("c_no");
		List<OrderVO> orderList = productService.allOrderList(cri, c_no);
		
		mnv.addObject("cri", cri);
		mnv.addObject("order", orderList);
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		return mnv;
	}
	
	
}
