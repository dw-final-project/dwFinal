package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ContactService;
import kr.or.dw.service.ItemService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MerchandiseService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.ProductService;
import kr.or.dw.service.ShopService;
import kr.or.dw.service.WarehouseService;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.NoteVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.WareHouseVO;

@Controller
@RequestMapping("/erp4")
public class itemController {
	
	private static final Logger logger = LoggerFactory.getLogger(itemController.class);
	
	@Autowired
	private ItemService itemService;
	
	@RequestMapping("/item")
	public ModelAndView itemMain(ModelAndView mnv, String mcode, SearchCriteria cri) throws SQLException{
		String url = "inventory/basic/item.page";
		Map<String, Object> dataMap = itemService.selectItemList(cri);
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/itemRegistForm")
	public ModelAndView contactRegistForm(ModelAndView mnv, HttpSession session) throws SQLException {
		String url = "inventory/basic/itemRegistForm";
		
		mnv.setViewName(url);
		
		return mnv;
	}
	
//	@RequestMapping("/registWarehouse")
//	public void registWarehouse(WareHouseVO warehouse, HttpServletResponse res, int emp_no) throws Exception{
//		
//		warehouse.setSys_reg(emp_no + "");
//		warehouse.setSys_up(emp_no + "");
//		
//		warehouseService.registWarehouse(warehouse);
//		
//		res.setContentType("text/html; charset=utf-8");
//		PrintWriter out = res.getWriter();
//		out.println("<script>");
//		out.println("alert('성공적으로 등록 되었습니다.')");
//		out.println("window.opener.location.reload(true); window.close();");
//		out.println("</script>");
//	}
//	
//	@RequestMapping("/warehouseDetail")
//	public ModelAndView warehouseDetail (ModelAndView mnv, String wh_no) throws SQLException {
//		Map<String, Object> warehouse = warehouseService.selectWarehouseDetail(wh_no);
//		String url = "inventory/basic/warehouseDetail";
//		mnv.addObject("warehouse", warehouse);
//		mnv.setViewName(url);
//		return mnv;
//	}
	
	@RequestMapping("/findWarehouseToitem")
	public ModelAndView findCompany(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "inventory/basic/findWarehouse";
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<Map<String, Object>> warehouseList = null;
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		if(keyword != null){
			warehouseList = itemService.getWarehouse(dataMap);
		} else {
			warehouseList = itemService.getWarehouseList();
		}
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("warehouseList", warehouseList);
		
		return mnv;
	}
	
//	@RequestMapping("/modifyWarehouse")
//	public void modifyWarehouse(WareHouseVO warehouse, HttpServletResponse res, HttpSession session) throws Exception {
//		int emp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
//		System.out.println(emp_no);
//		warehouse.setSys_reg(emp_no + "");
//		warehouse.setSys_up(emp_no + "");
//		
//		warehouseService.modifyWarehouse(warehouse);
//		
//		res.setContentType("text/html; charset=utf-8");
//		PrintWriter out = res.getWriter();
//		out.println("<script>");
//		out.println("alert('성공적으로 수정 되었습니다.')");
//		out.println("window.opener.location.reload(true); window.close();");
//		out.println("</script>");
//	}
//	
//	@RequestMapping("/deleteWarehouse")
//	public void deleteContact(String wh_no, HttpServletResponse res, HttpSession session) throws Exception{
//		int emp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
//		
//		WareHouseVO warehouse = new WareHouseVO();
//		
//		warehouse.setSys_up(emp_no + "");
//		warehouse.setSys_reg(emp_no + "");
//		warehouse.setWh_no(wh_no);
//		
//		warehouseService.deleteWarehouse(warehouse);
//		
//		res.setContentType("text/html; charset=utf-8");
//		PrintWriter out = res.getWriter();
//		out.println("<script>");
//		out.println("alert('성공적으로 삭제 되었습니다.')");
//		out.println("window.opener.location.reload(true); window.close();");
//		out.println("</script>");
//	}

}
