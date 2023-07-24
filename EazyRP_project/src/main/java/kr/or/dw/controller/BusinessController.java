package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Sets.SetView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.EstimateService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MyMenuService;
import kr.or.dw.service.SiService;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;
import kr.or.dw.vo.WareHouseVO;

@Controller
@RequestMapping("/erp4")
public class BusinessController {
	
	private static final Logger logger = LoggerFactory.getLogger(BusinessController.class);
	
	@Autowired
	private MenuService menuService;
	
	@Autowired
	private EstimateService estimateService;
	
	@Autowired
	private SiService siService;
	
	@Autowired
	private MyMenuService mymenuService;
	
	@RequestMapping("/estimate")
	public ModelAndView main(ModelAndView mnv, String mcode, SearchCriteria cri) throws SQLException {
		String url = "jihwan/main.page";
		
		Map<String, Object> dataMap = estimateService.selectEstimList(cri);
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);

		return mnv;
	}
	
	@RequestMapping("/estimate_regist")
	public ModelAndView esti(ModelAndView mnv ,HttpSession session) throws SQLException{
		int empno = Integer.parseInt(session.getAttribute("emp_no").toString());
		String ename = estimateService.ename(empno);
		String url = "jihwan/estimate_regist.open";
		mnv.setViewName(url);
		mnv.addObject("empno",empno);
		mnv.addObject("ename",ename);
		return mnv;
	}

	@RequestMapping("/estimateDetail")
	public ModelAndView estDetail (ModelAndView mnv ,String est_no) throws SQLException {
		
		Map<String, Object> dataMap = estimateService.selectDetail(est_no);
		String url = "jihwan/estimateDetail.open";
		mnv.addAllObjects(dataMap);
//		Map<String, Object> est2 = (Map<String, Object>) dataMap.get("est");
//		mnv.addObject("est2",est2);
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/siSelect")
	public ModelAndView siSel(ModelAndView mnv) throws SQLException {
		String url = "jihwan/siSelect";
		List<SiVO> siList = siService.selectSiList();
		mnv.setViewName(url);
		mnv.addObject("siList", siList);
		return mnv;
	}
	
	@RequestMapping("/s_Sheet")
	public String sSheet() {
		String url = "jihwan/s_Sheet";
		return url;
	}
//	
//	@RequestMapping("/estimateInsert")
//	public void estimateInsert(@RequestParam("files")MultipartFile multi, EstimateVO vo,HttpServletResponse res) throws SQLException, IOException{
//		// 파일저장 및 파일명 가져오기
//		if(multi != null) {
//			UUID uuid = UUID.randomUUID();
//			String[] uuids = uuid.toString().split("-");
//			
//			String uniqueName = uuids[0];
//			
//			String fileRealName = multi.getOriginalFilename();
//			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
//			String uploadFolder = "C:\\upload\\";
//			vo.setFiles(uniqueName+fileExtension);
//			
//			
//			File saveFile = new File(uploadFolder+uniqueName+fileExtension);  // 적용 후
//			
//			if(!saveFile.exists()) {
//				saveFile.mkdirs();
//			}
//			
//			try {
//				multi.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
//			} catch (IllegalStateException e) {
//				e.printStackTrace();
//			} catch (IOException e) {
//				e.printStackTrace();
//			}
//		}
//		// 가져온 파일명 estimateVO에 set
//
//		// DB에 Insert
//		estimateService.estimateInsert(vo);
//		System.out.println(vo.getEst_no());
//		res.setContentType("text/html; charset=utf-8");
//		PrintWriter out = res.getWriter();
//		out.println("<script>");
//		out.println("alert('성공적으로 등록되었습니다.')");
//		out.println("window.opener.location.reload(true); window.close();");
//		out.println("</script>");
//	}
	
	@RequestMapping("/findPeople")
	public ModelAndView findPeople(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "mymenu/findPeople";
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
		if(keyword != null){
			emp = mymenuService.getEmp(dataMap);
		} else {
			emp = mymenuService.getEmpList();
		}
		
		mnv.setViewName(url);
		mnv.addObject("emp", emp);
		mnv.addObject("searchType", searchType);
		mnv.addObject("keyword", keyword);
		
		return mnv;
	}
	
//	@RequestMapping("/findProduct")
//	public ResponseEntity<List<ProductVO>> findProduct2(String c_name , String pr_name) throws SQLException {
//		ResponseEntity<List<ProductVO>> entity = null;
//		
//		List<ProductVO> product = estimateService.getProductList();
//		try {
//			entity = new ResponseEntity<List<ProductVO>>(product, HttpStatus.OK);
//		} catch (Exception e) {
//			e.printStackTrace();
//			entity = new ResponseEntity<List<ProductVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
//		}
//		
//		return entity;
//	}
	
	@RequestMapping("/findProduct")
	public ModelAndView findProduct(ModelAndView mnv, String pr_name, String c_name, String searchType, String keyword) throws SQLException {
		String url = "jihwan/findProduct";
		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<ProductVO> product = null;
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("pr_name", pr_name);
		dataMap.put("c_name", c_name);
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		if(keyword != null){
			product = estimateService.getProduct(dataMap);
		} else {
			product = estimateService.getProductList();
		}
		mnv.setViewName(url);
		mnv.addObject("product", product);
		mnv.addObject("pr_name", pr_name);
		mnv.addObject("c_name", c_name);
		mnv.addObject("searchType", searchType);
		mnv.addObject("keyword", keyword);
		
		return mnv;
	}
	
	@RequestMapping("/findWareHouse")
	public ModelAndView findWareHouse(ModelAndView mnv, String searchType, String keyword) throws SQLException {
		String url = "jihwan/findWareHouse";

		if(searchType == "") {
			searchType = null;
		}
		if(keyword == "") {
			keyword = null;
		}
		List<WareHouseVO> warehouse = null;
		Map<String, String> dataMap = new HashMap<>();
		dataMap.put("searchType", searchType);
		dataMap.put("keyword", keyword);
		if(keyword != null){
			warehouse = estimateService.getWareHouse(dataMap);
			System.out.println(warehouse.get(0).getWh_name());
		} else {
			warehouse = estimateService.getWareHouseList();
		}
		
		mnv.setViewName(url);
		mnv.addObject("warehouse",warehouse );
		mnv.addObject("searchType", searchType);
		mnv.addObject("keyword", keyword);
		
		return mnv;
	}
	
	@RequestMapping("/insertEstimate")
	public void insertEstimate (@RequestParam("files")MultipartFile multi, int emp_no, String[] pr_no, String fc_no, String[] wh_no, int[] quantity, int[] amount,  HttpServletResponse res) throws Exception {
		
		List<EstimateVO> vo = new ArrayList<EstimateVO>();
		
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
		
		for(int i= 0; i < pr_no.length; i++) {
			EstimateVO est = new EstimateVO();
			est.setEmp_no(emp_no);
			est.setPr_no(pr_no[i]);
			est.setFc_no(fc_no);
			est.setWh_no(wh_no[i]);
			est.setAmount(amount[i]);
			est.setQuantity(quantity[i]);
			est.setFiles(filess);
			
			vo.add(est);	
		}
		
		System.out.println(vo);
		
		estimateService.insertEstimate(vo);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
		
	}
	
	
//	@RequestMapping("/modifyForm")
//	public void modifyform() {
//		
//	}
}
