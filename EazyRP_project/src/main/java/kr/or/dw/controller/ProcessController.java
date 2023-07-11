package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
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
import kr.or.dw.service.ProcessService;
import kr.or.dw.vo.MenuVO;
import kr.or.dw.vo.ProcessVO;

@Controller
@RequestMapping("/erp3")
public class ProcessController {

	private static final Logger logger = LoggerFactory.getLogger(ProcessController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private ProcessService processService;
	
	@RequestMapping("/productionoutsourcing.do")
	public ModelAndView main(@RequestParam(defaultValue="M000000")String mcode, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "process/main";
		
		// 메뉴 리스트
		List<MenuVO> menuList = menuService.selectMainMenuList(); 
		MenuVO menu = menuService.selectMenuByMcode(mcode);
		
		// 공정관리 목록 조회
		
		Map<String, Object> dataMap = processService.selectProcessList(cri);
		
		mnv.addObject("menu", menu);
		mnv.addObject("menuList", menuList);
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
	}
	
//	@RequestMapping("/list")
//	public ModelAndView list(ModelAndView mnv, SearchCriteria cri) throws SQLException {
//		String url = "board/list.open";
//		
//		Map<String, Object> dataMap = boardService.selectBoardList(cri);
//		
//		mnv.addAllObjects(dataMap);
//		mnv.setViewName(url);
//		
//		return mnv;
//	}
	
	@RequestMapping("/registForm")
	public String registForm() {
		String url = "process/open_regist";
		return url;
	}
	
	@RequestMapping("/regist")
	public void regist(ProcessVO processVo, HttpServletRequest req, HttpServletResponse res) throws SQLException, IOException {
//		board.setTitle((String)req.getAttribute("XSStitle"));
		processService.registProcess(processVo);
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	
	
	
	
	
}
