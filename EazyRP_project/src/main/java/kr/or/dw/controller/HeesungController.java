package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.WhService;
import kr.or.dw.vo.ProcessVO;

@Controller
@RequestMapping("/erp4")
public class HeesungController {

private static final Logger logger = LoggerFactory.getLogger(HeesungController.class);
	
	@Autowired
	private MenuService menuService;
	@Autowired
	private ProcessService processService;
	@Autowired
	private WhService whService;
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////// process
	
	@RequestMapping("/process")
	public ModelAndView processMain(String mcode, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "heesung/process/main.page";
			
		// 공정관리 목록 조회
		Map<String, Object> dataMap = processService.selectProcessList(cri);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		System.out.println("맥북 깃허브 테스트");
		return mnv;
	}
	
	@RequestMapping("/process/registForm")
	public String processRegistForm() {
		String url = "heesung/process/open_regist";
		return url;
	}
	
	@RequestMapping("/process/regist")
	public void processRegist(ProcessVO processVo, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
//		process.setTitle((String)req.getAttribute("XSStitle"));
		processService.registProcess(processVo);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/process/detail")
	public ModelAndView processDetail(String pc_code, ModelAndView mnv) throws SQLException {
		String url = "heesung/process/detail";
		
		ProcessVO process = null;
		
		process = processService.selectProcess(pc_code);
		
		mnv.addObject("process", process);
		mnv.setViewName(url);
	
		return mnv;
	}

	@RequestMapping("/process/modifyForm")
	public ModelAndView processModifyForm(String pc_code, ModelAndView mnv) throws SQLException {
		String url = "heesung/process/modify";
		
		ProcessVO process = null;
		
		process = processService.selectProcess(pc_code);
		
		mnv.addObject("process", process);
		mnv.setViewName(url);
		
		return mnv;
	}

	@RequestMapping("/process/modify")
	public void processModify(ProcessVO process, HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {

		processService.modify(process);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("window.opener.location.reload();");
		out.println("location.href='process/detail.do?pc_code=" + process.getPc_code() + "';");
		out.println("alert('수정 되었습니다.')");
		out.println("</script>");
	}
	
	@RequestMapping("/process/remove")
	public void processRemove(String pc_code, HttpServletRequest req, HttpServletResponse res) throws IOException, SQLException {
		System.out.println("컨트롤러 진입");
		processService.remove(pc_code);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('삭제 되었습니다.')");
		out.println("window.opener.location.reload();");
		out.println("window.close();");
		out.println("</script>");
	}
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	
	@RequestMapping("/wh")
	public ModelAndView wh(String mcode, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		
		String url = "heesung/wh/main.page";
		
		// 공정관리 목록 조회
		Map<String, Object> dataMap = whService.selectWhList(cri);
				
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}