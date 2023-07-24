package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
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

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MerchandiseService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.ProductService;
import kr.or.dw.service.ShopService;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.NoteVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;

@Controller
@RequestMapping("/erp5")
public class MinjunController {
	
	private static final Logger logger = LoggerFactory.getLogger(MinjunController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private MerchandiseService merchandiseService;
	
	@Autowired
	private ShopService shopService;
	
	@RequestMapping("/shop")
	public ModelAndView index(ModelAndView mnv, String mcode) throws SQLException{
		String url = "/minjun/shop.page";
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		return mnv;
	}

	
	@RequestMapping("/shopRegistForm")
	public String shopRegistForm() {
		String url = "minjun/shop_regist";
		return url;
	}
	
	@RequestMapping("/merchandise")
	public ModelAndView merchandiseMain(String mcode, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "minjun/merchandise.page";
		
		//상품 조회
		Map<String, Object> dataMap = merchandiseService.selectMerchandiseList(cri);
		System.out.println("상품 맵 리스트 : " + dataMap);
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/merchandiseSearch")
	public ModelAndView search(ModelAndView mnv, String mcode, String keyword, String searchType) throws SQLException {
		String url = "/minjun/merchandise.page";
		Map<String, String> valMap = new HashMap<>();
		valMap.put("keyword", keyword);
		valMap.put("searchType", searchType);
		List<NoteVO> note = null;
//		note = mymenuService.searchNote(valMap);
		mnv.addObject("note", note);
		mnv.addObject("keyword", keyword);
		mnv.addObject("searchType", searchType);
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/merchandiseRegistForm")
	public String merchandiseRegistForm() {
		String url = "minjun/merchandise_regist";
		return url;
	}
	

	@RequestMapping("/order.do")
	public ModelAndView orderMain(String mcode, ModelAndView mnv) throws SQLException {
		String url = "minjun/order";
		
		
		mnv.addObject("mcode", mcode);		
		mnv.setViewName(url);
		
		return mnv;
	}

	
	@RequestMapping("/orderRegistForm")
	public String orderRegistForm() {
		String url = "minjun/order_regist";
		return url;
	}
	
	@RequestMapping("/findProduct2")
	public ModelAndView findProduct(ModelAndView mnv, String pr_no,String pr_name, String c_name, String searchType, String keyword) throws SQLException {
		String url = "minjun/findProduct2";
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<ProductVO> product = null;
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("pr_name", pr_name);
		dataMap.put("c_name", c_name);
		dataMap.put("pr_no", pr_no);
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		if(keyword != null){
			product = merchandiseService.getProduct1(dataMap);
		} else {
			product = merchandiseService.getProductList1();
		}
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("product", product);
		
		return mnv;
	}
	
	@RequestMapping("/findShop")
	public ModelAndView findShop(ModelAndView mnv, String s_name, String searchType, String keyword) throws SQLException {
		String url = "minjun/findShop";
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<ShopVO> shop = null;
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("s_name", s_name);
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		if(keyword != null){
			shop = shopService.getShop(dataMap);
		} else {
			shop = shopService.getShopList();
		}
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("shop", shop);
		
		return mnv;
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
