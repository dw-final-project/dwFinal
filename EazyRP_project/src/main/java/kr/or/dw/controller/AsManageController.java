package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.ibatis.annotations.Param;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.AsService;
import kr.or.dw.vo.AsVO;
import kr.or.dw.vo.ProcessVO;


@Controller
@RequestMapping("/asmanage")
public class AsManageController {

	@Autowired
	private AsService asService;
	
	@RequestMapping("/as")
	public ModelAndView as(String mymenu, ModelAndView mnv, String mcode, SearchCriteria cri ) throws Exception {
		String url="";
    	if(mymenu == null) {
			url="/as/asMain.page";
		} else {
			url="/as/asMain.mymenu";
		}
		
		Map<String, Object> dataMap = asService.selectAsList(cri);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);

		mnv.setViewName(url);
		
		return mnv;

	}
	
	@RequestMapping("/registForm")
	public ModelAndView asRegist (ModelAndView mnv, HttpSession session) throws Exception{
		String url = "/as/asRegistForm.open";

		mnv.setViewName(url);
		return mnv;
	}

	@RequestMapping("/regist")
	public void asRegist( AsVO asVO, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {

		System.out.println(asVO.getEmp_no());
		asService.registAs(asVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail (String as_no ,ModelAndView mnv, HttpSession session) throws Exception{
		String url = "/as/asDetail.open";
		
		Map<String, Object> dataMap = asService.selectAsDetail(as_no);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/modify")
	public void modify (AsVO asVO, HttpServletResponse res, HttpSession session) throws Exception{
		String c_no = (String) session.getAttribute("c_no");
		asVO.setC_no(c_no);
		asService.modifyAs(asVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('수정 되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/remove")
	public void remove (AsVO asVO, HttpServletResponse res) throws Exception {
	asService.removeAs(asVO);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
}
