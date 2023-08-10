package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.mail.Multipart;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.QualityService;
import kr.or.dw.vo.QualityVO;

@Controller
@RequestMapping("/erp5")
public class QualityController {
	
	private static final Logger logger = LoggerFactory.getLogger(QualityController.class);
	
	@Autowired
	private QualityService qualityService;
	
	@RequestMapping("/quality")
	public ModelAndView qualityMain(HttpSession session,ModelAndView mnv, String mcode, SearchCriteria cri) throws SQLException {
		
		String url = "jihwan/qulityMain.page";
		System.out.println("emp session c_no : " + session.getAttribute("c_no").toString());
		String c_no = session.getAttribute("c_no").toString();
		Map<String, Object> dataMap = qualityService.selectQualityList(cri,c_no);
		
		System.out.println(dataMap.get("qualityList"));
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;		
	}
	
	@RequestMapping("/qualityDetail")
	public ModelAndView qcDetail (ModelAndView mnv, int qc_no) throws SQLException {
		
	Map<String, Object> dataMap = qualityService.selectQcDetail(qc_no);
	
	String url = "jihwan/qualityDetail.open";
	mnv.addAllObjects(dataMap);
	mnv.setViewName(url);
		
	return mnv;
	}
	
	@RequestMapping("/qc_regist")
	public ModelAndView qcRegist(ModelAndView mnv, HttpSession session) throws SQLException{
		int empno = Integer.parseInt(session.getAttribute("emp_no").toString());
		String ename = qualityService.ename(empno);
		
		String url = "jihwan/qc_regist.open";
		mnv.setViewName(url);
		mnv.addObject("empno",empno);
		mnv.addObject("ename", ename);
		
		return mnv;
	}
	
	@RequestMapping("/insertQc")
	public void insertQc(@RequestParam("files")MultipartFile multi,int[] quantity, int emp_no, String progress, String[] pr_no, String[] pr_name,String[] content, @DateTimeFormat(pattern="yyyy-MM-dd") Date sys_regdate, HttpServletResponse res) throws SQLException, IOException {
		
		List<QualityVO> qualityVO = new ArrayList<QualityVO>();
		System.out.println("ASDASDASD");
		System.out.println("FFFFF " + content);
		for(int i=0; i < pr_no.length; i++) {
			QualityVO qc = new QualityVO();
			qc.setEmp_no(emp_no);
			qc.setPr_no(pr_no[i]);
			qc.setQuantity(quantity[i]);
			qc.setSys_regdate(sys_regdate);
			
			if(content.length != 0) {
			qc.setContent(content[i]);
			}
			
			qc.setProgress(progress);
			qualityVO.add(qc);
		}
		
		qualityService.insertQc(qualityVO);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
	}
	
	
}
