package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.FactoryService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.WhService;
import kr.or.dw.service.WorkOrderService;
import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.WhVO;

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
	@Autowired
	private FactoryService factoryService;
	@Autowired
	private WorkOrderService workOrderService;
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////// 목록 열기
	
	@RequestMapping("/findFactory")
	public ModelAndView findFactory(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "heesung/findFactory.open";
		
		Map<String, Object> dataMap = factoryService.selectFactoryList(cri);
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		return mnv;
	}
	
	@RequestMapping("/findWorkOrder")
	public ModelAndView findWorkOrder(ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "heesung/findWorkOrder.open";
		
		Map<String, Object> dataMap = workOrderService.selectWorkOrderList(cri);
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		return mnv;
	}
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////// process
	
	@RequestMapping("/process")
	public ModelAndView processMain(String mcode, ModelAndView mnv, SearchCriteria cri) throws SQLException {
		String url = "heesung/process/main.page";
			
		// 공정관리 목록 조회
		Map<String, Object> dataMap = processService.selectProcessList(cri);
		
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);

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
	
//////////////////////////////////////////////////////////////////////////////////////////////////////////////// wh(생산입고)
	
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
	
	@RequestMapping("/wh/registForm")
	public String whRegistForm() {
		
		String url = "heesung/wh/registForm.open";
		return url;

	}
	
	@RequestMapping("/wh/regist")
	public void whRegist(HttpServletResponse res, int emp_no, int wo_no, String wh_total, String[] pr_no, String[] fac_no, String wh_no2[], 
		String[] outprice, int[] quantity, String[] total_outprice) throws SQLException, IOException {
		
		System.out.println("erp4/wh/regist 컨트롤러 진입");
		
		System.out.println("emp_no : " + emp_no);
		System.out.println("wo_no : " + wo_no);
		System.out.println("wh_total : " + wh_total);

		List<WhVO> whDetailVoList = new ArrayList<WhVO>();	// 상세 정보들을 만들기 위한 객체
		
		for(int i = 0; i < pr_no.length; i++) {
			WhVO whDetailVo = new WhVO();
			whDetailVo.setEmp_no(emp_no);
			whDetailVo.setWo_no(wo_no);
			whDetailVo.setWh_total(wh_total);
			whDetailVo.setPr_no(pr_no[i]);
			whDetailVo.setFac_no(fac_no[i]);
			whDetailVo.setWh_no2(wh_no2[i]);
			whDetailVo.setOutprice(outprice[i]);
			whDetailVo.setQuantity(quantity[i]);
			whDetailVo.setTotal_outprice(total_outprice[i]);
			
			whDetailVoList.add(whDetailVo);
		}

		whService.registWh(whDetailVoList);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
	}
	
}
