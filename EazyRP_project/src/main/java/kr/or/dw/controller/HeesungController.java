package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.EstimateService;
import kr.or.dw.service.FactoryService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.ProcessService;
import kr.or.dw.service.WhService;
import kr.or.dw.service.WorkOrderService;
import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProcessVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.WhVO;
import kr.or.dw.vo.WorkOrderVO;

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
	@Autowired
	private EstimateService estimateService;
	
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
	public ModelAndView findWorkOrder(ModelAndView mnv, SearchCriteria cri, HttpSession session) throws SQLException {
		String url = "heesung/findWorkOrder.open";
		
		String c_no = session.getAttribute("c_no").toString();
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("c_no", c_no);
		Map<String, Object> dataMap = workOrderService.selectWorkOrderList(map);
		
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
	public ModelAndView whRegistForm(ModelAndView mnv, HttpSession session) throws SQLException {
		
		int empno = Integer.parseInt(session.getAttribute("emp_no").toString());
		String ename = estimateService.ename(empno);
		
		String c_no = session.getAttribute("c_no").toString();
		String c_name = session.getAttribute("c_name").toString();
		
		String url = "heesung/wh/registForm.open";
		
		mnv.setViewName(url);
		mnv.addObject("empno", empno);	// 사원번호
		mnv.addObject("ename", ename);	// 사원이름
		mnv.addObject("c_no", c_no);	// 회사이름
		mnv.addObject("c_name", c_name);	// 회사번호
		
		return mnv;

	}
	
	@RequestMapping("/wh/regist")
	public void whRegist(HttpServletResponse res, int emp_no,  int wo_no, int wh_total, String[] pr_no, String[] fac_no, String wh_no[], 
		int[] outprice, int[] quantity, int[] total_outprice, @RequestParam("files")MultipartFile multi) throws SQLException, IOException {
		
		System.out.println("erp4/wh/regist 컨트롤러 진입");
		
		System.out.println("emp_no : " + emp_no);
		System.out.println("wo_no : " + wo_no);
		System.out.println("wh_total : " + wh_total);

		List<WhVO> whDetailVoList = new ArrayList<WhVO>();	// 상세 정보들을 만들기 위한 객체
		
		String filess = "";
		
		if(!multi.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			String fileRealName = multi.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = "C:\\upload\\";
			
			filess = uniqueName+fileExtension;
			
			
			File saveFile = new File(uploadFolder+uniqueName+fileExtension);  // 적용 후
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			
			try {
				multi.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		for(int i = 0; i < pr_no.length; i++) {
			
			System.out.println("pr_no.length : " + pr_no.length);
			System.out.println("pr_no : " + pr_no[i]);
			System.out.println("fac_no: " + fac_no[i]);
			System.out.println("wh_no2: " + wh_no[i]);
			System.out.println("outprice: " + outprice[i]);
			System.out.println("quantity: " + quantity[i]);
			System.out.println("total_outprice: " + total_outprice[i]);
			System.out.println("files : " + total_outprice[i]);
			
			WhVO whDetailVo = new WhVO();
			
			whDetailVo.setEmp_no(emp_no);
			whDetailVo.setWo_no(wo_no);
			whDetailVo.setWh_total(wh_total);
			whDetailVo.setPr_no(pr_no[i]);
			whDetailVo.setFac_no(fac_no[i]);
			whDetailVo.setWh_no2(wh_no[i]);
			whDetailVo.setOutprice(outprice[i]);
			whDetailVo.setQuantity(quantity[i]);
			whDetailVo.setTotal_outprice(total_outprice[i]);
			whDetailVo.setFiles(filess);
			
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
	
////////////////////////////////////////////////////////////////////////////////////////////////////////////////workorder(작업지시서)
	
	@RequestMapping("/workorder")
	public ModelAndView workorder(ModelAndView mnv, SearchCriteria cri, String mcode, HttpSession session) throws SQLException {
		
		System.out.println("HeesungController - erp4/workorder 진입");
		
		// 페이지 정보와 작업지시서의 정보를 가지고 url에 반환할것이다 url에서는 게시판 형태로 사용자에게 보여준다.
		String url = "heesung/workorder/main.page";
		
		String c_no = session.getAttribute("c_no").toString();
		Map<String, Object> map = new HashMap<>();
		map.put("cri", cri);
		map.put("c_no", c_no);
		Map<String, Object> dataMap = workOrderService.selectWorkOrderList(map);
		
		mnv.setViewName(url);
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(dataMap);
		
		return mnv;
	}
	
	@RequestMapping("/workorder/registForm")
	public ModelAndView workorderRegistForm(ModelAndView mnv, HttpSession session) throws SQLException {
		
		System.out.println("HeesungController - erp4/workorder/registForm 진입");
		
		int empno = Integer.parseInt(session.getAttribute("emp_no").toString());
		String ename = estimateService.ename(empno);
		
		String c_no = session.getAttribute("c_no").toString();
		String c_name = session.getAttribute("c_name").toString();
		
		String url = "heesung/workorder/registForm.open";
		
		mnv.setViewName(url);
		mnv.addObject("empno", empno);		// 사원번호
		mnv.addObject("ename", ename);		// 사원이름
		mnv.addObject("c_no", c_no);		// 회사번호
		mnv.addObject("c_name", c_name);	// 회사이름
		
		return mnv;
	}
	
	@RequestMapping("/workorder/regist")
	public void registWorkOrder (HttpServletResponse res, @RequestParam("files")MultipartFile multi, String wo_name, 
		String fac_no, @DateTimeFormat(pattern="yyyy-MM-dd")Date deliverydate, String progress, String[] pr_no, int[] quantity, int emp_no, HttpSession session) throws SQLException, IOException {
		
		System.out.println("희성 컨트롤러 erp4/workorder/regist 진입");
		
		String c_no = session.getAttribute("c_no").toString();
		
		String filess = "";
		
		if(!multi.isEmpty()) {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			String fileRealName = multi.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = "C:\\upload\\";
			
			filess = uniqueName+fileExtension;
			
			File saveFile = new File(uploadFolder+uniqueName+fileExtension);  // 적용 후
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			
			try {
				multi.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		List<WorkOrderVO> woList = new ArrayList<WorkOrderVO>();
		
		System.out.println("pr_no.length : " + pr_no);
		
		for(int i = 0; i < pr_no.length; i++) {
			
			WorkOrderVO wo = new WorkOrderVO();

			// workorder 테이블
			wo.setC_no(c_no);
			wo.setWo_name(wo_name);
			wo.setFac_no(fac_no);
			wo.setEmp_no(emp_no);
			wo.setDeliverydate(deliverydate);
			wo.setProgress(progress);
			wo.setFiles(filess);
			wo.setC_no(c_no);
			
			// workorderdetail 테이블
			wo.setPr_no(pr_no[i]);
			wo.setQuantity(quantity[i]);
			
			woList.add(wo);
			
		}
		
		System.out.println("workOrder registService 진입 전");
		
		workOrderService.registWorkOrder(woList);
		
		System.out.println("workOrder registService 진입 후");
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
	}
	
	@RequestMapping("workorder/detail")
	public ModelAndView workOrderDetail(ModelAndView mnv, String wo_no) throws SQLException {
		
		System.out.println("erp4/workorder/detail 진입");
		
		Map<String, Object> dataMap = workOrderService.selectWorkOrderDetail(wo_no);
		String url = "heesung/workorder/detail.open";
		
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		
		return mnv;
		
	}
	
}
