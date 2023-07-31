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
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MerchandiseService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.ProductService;
import kr.or.dw.service.ShopService;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.NoteVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;

@Controller
@RequestMapping("/erp4")
public class InventoryController {
	
	private static final Logger logger = LoggerFactory.getLogger(InventoryController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ContactService contactService;
	
	@RequestMapping("/contact")
	public ModelAndView contactMain(ModelAndView mnv, String mcode, SearchCriteria cri) throws SQLException{
		String url = "inventory/basic/contact.page";
		Map<String, Object> dataMap = contactService.selectContactList(cri);
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/contactRegistForm")
	public ModelAndView contactRegistForm(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "inventory/basic/contactRegistForm";
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<CompanyVO> contactList = null;
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		if(keyword != null){
			contactList = contactService.getContact(dataMap);
		} else {
			contactList = contactService.getContactList();
		}
		
		mnv.setViewName(url);
		mnv.addObject("contactList", contactList);
		mnv.addObject("searchType", searchType);
		mnv.addObject("keyword", keyword);
		
		return mnv;
	}
	
	@RequestMapping("/contactRegist")
	public void contactRegist(String c_no, HttpServletResponse res) throws Exception{
		
		contactService.registContact(c_no);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록 되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/contactDetail")
	public ModelAndView contactDetail (ModelAndView mnv ,String c_no) throws SQLException {
		Map<String, Object> contact = contactService.selectContactDetail(c_no);
		String url = "inventory/basic/contactDetail";
		mnv.addObject("contact", contact);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/modifyContact")
	public void modifyContact(CompanyVO contact, HttpServletResponse res, HttpSession session, String acc) throws Exception {
		int emp_no = Integer.parseInt(session.getAttribute("emp_no").toString());
		contact.setSys_reg(emp_no + "");
		contact.setSys_up(emp_no + "");
		
		int index = contact.getAccount().indexOf(" ");
		String bank = acc.substring(0, index);
		String ac_no = acc.substring(index + 1);
		String ac_cd = contact.getAccount(); 
		
		contactService.updateAccount(ac_no, ac_cd, bank);
		
		contactService.modifyContact(contact);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 수정 되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}

}
