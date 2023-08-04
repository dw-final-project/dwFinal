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
import kr.or.dw.vo.DeptVO;
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
	public ModelAndView empMain(ModelAndView mnv, String mcode, EmpVO empVO, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "/minjun2/emp.page";
		System.out.println("emp session c_no : " + session.getAttribute("c_no").toString());
		String c_no = session.getAttribute("c_no").toString();
		Map<String, Object> dataMap = empsalService.selectEmpList(cri, c_no);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/empDetail")
	public ModelAndView empDetail(ModelAndView mnv ,int emp_no) throws SQLException {
		
		Map<String, Object> dataMap = empsalService.selectDetail(emp_no);
		
		String url = "minjun2/emp_detail.open";
		System.out.println("empDetail dataMap : " + dataMap);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/empRegistForm")
	public String shopRegistForm() {
		String url = "minjun2/emp_regist";
		return url;
	}
	
	@RequestMapping("/insertEmp")
	public void insertEmp(EmpVO empVO, HttpServletResponse res, HttpSession session) throws Exception {
		int emp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		empVO.setSys_reg(emp_no + "");
		empVO.setSys_up(emp_no + "");
		
		empsalService.insertEmp(empVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/modifyEmp.do")
	public void modifyEmp (EmpVO empVO, HttpServletResponse res, HttpSession session, Integer emp_no) throws SQLException , Exception {
		int SSemp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		System.out.println("modifyEmp SSemp_no : " + SSemp_no);
		empVO.setEmp_no(emp_no);
		empVO.setSys_up(SSemp_no + "");
		System.out.println("modifyEmp emp_no : " + emp_no);
		
		empsalService.modifyEmp(empVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 수정되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/deleteEmp.do")
	public void deleteEmp (EmpVO empVO, HttpServletResponse res, HttpSession session, Integer emp_no) throws SQLException , Exception {
		int SSemp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		empVO.setEmp_no(emp_no);
		empVO.setSys_up(SSemp_no + "");
		System.out.println("modifyEmp emp_no : " + emp_no);
		
		empsalService.deleteEmp(empVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 삭제되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/findCompany")
	public ModelAndView findCompany(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "minjun2/findCompany";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		
		List<CompanyVO> company = null;
		Map<String, String> dataMap = new HashMap<>();
		
	
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		
		if(keyword != null){
			company = empsalService.getCompany(dataMap);
		} else {
			company = empsalService.getCompanyList();
		}
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("company", company);
		
		return mnv;
	}
	
	@RequestMapping("/findDept")
	public ModelAndView findDept(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "minjun2/findDept";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		
		List<DeptVO> dept = null;
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		
		if(keyword != null){
			dept = empsalService.getDept(dataMap);
		} else {
			dept = empsalService.getDeptList();
		}
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("dept", dept);
		
		return mnv;
	}
	
	@RequestMapping("/findEmp")
	public ModelAndView findEmp(ModelAndView mnv, String searchType, String keyword, String c_no) throws SQLException {
		String url = "minjun2/findEmp";
		
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<EmpVO> emp = null;
		Map<String, String> dataMap = new HashMap<>();
		
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		dataMap.put("c_no", c_no);
		if(keyword != null){
			emp = empsalService.getEmp(dataMap);
		} else {
			emp = empsalService.getEmpList(c_no);
		}
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		mnv.addObject("emp", emp);
		
		return mnv;
	}
}
