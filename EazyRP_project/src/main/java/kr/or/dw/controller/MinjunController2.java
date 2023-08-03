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
import kr.or.dw.service.EmpSalService;
import kr.or.dw.service.ManagementService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MerchandiseService;
import kr.or.dw.service.OrderService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.ProductService;
import kr.or.dw.service.ShopService;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.NoteVO;
import kr.or.dw.vo.OrderVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;

@Controller
@RequestMapping("/management")
public class MinjunController2 {
	
	private static final Logger logger = LoggerFactory.getLogger(MinjunController2.class);
	
	@Autowired
	private MenuService menuService;

	@Autowired
	private EmpSalService empsalService;
	
	@Autowired
	private ManagementService managementService;
	
	// EMP CRUD
	
	@RequestMapping("/emp")
	public ModelAndView empMain(ModelAndView mnv, String mcode, EmpVO empVO, SearchCriteria cri) throws SQLException {
		String url = "/minjun2/emp.page";
		
		System.out.println("emp 컨트롤러 진입");
		
		Map<String, Object> dataMap = empsalService.selectEmpList(cri);
		
		System.out.println("emp dataMap : " + dataMap);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/empDetail")
	public ModelAndView empDetail (ModelAndView mnv ,int emp_no) throws SQLException {
		
		Map<String, Object> dataMap = empsalService.selectDetail(emp_no);
		System.out.println("empDetail dataMap : " + dataMap);
		String url = "minjun2/emp_detail.open";
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/findCompany")
	public ModelAndView findCompany(ModelAndView mnv, String c_name, String c_no, String searchType, String keyword) throws SQLException {
		String url = "minjun2/findCompany";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		
		List<CompanyVO> company = null;
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap.put("c_name", c_name);
		dataMap.put("c_no", c_no);
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		
		if(keyword != null){
			company = empsalService.getCompany(dataMap);
		} else {
			company = empsalService.getCompanyList();
		}
		
		System.out.println("findCompany dataMap : " + dataMap);
		System.out.println("findCompany company : " + company);
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("company", company);
		
		return mnv;
	}
}
