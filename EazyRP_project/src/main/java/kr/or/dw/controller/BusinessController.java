package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.google.common.collect.Sets.SetView;

import kr.or.dw.service.EstimateService;
import kr.or.dw.service.MenuService;
import kr.or.dw.service.MyMenuService;
import kr.or.dw.service.SiService;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;

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
	public ModelAndView main(ModelAndView mnv, String mcode) throws SQLException {
		String url = "jihwan/main.page";
		
		Map<String, Object> dataMap = estimateService.selectEstimList();
		
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);

		return mnv;
	}
	
	@RequestMapping("/estimate_regist")
	public String esti() {
		String url = "jihwan/estimate_regist.open";
		return url;
	}

	@RequestMapping("/estimateDetail")
	public ModelAndView estDetail (ModelAndView mnv ,String est_no) throws SQLException {
		
		Map<String, Object> dataMap = estimateService.selectDetail(est_no);
		
		String url = "jihwan/estimateDetail.open";
		mnv.addAllObjects(dataMap);
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
	
	@RequestMapping("/estimateInsert")
	public void estimateInsert(@RequestParam("files")MultipartFile multi, EstimateVO vo,HttpServletResponse res) throws SQLException, IOException{
		// 파일저장 및 파일명 가져오기
		if(multi != null) {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			String fileRealName = multi.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadFolder = "C:\\upload\\";
			vo.setFiles(uniqueName+fileExtension);
			
			
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
		// 가져온 파일명 estimateVO에 set

		// DB에 Insert
		estimateService.estimateInsert(vo);
		System.out.println(vo.getEst_no());
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('성공적으로 등록되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
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
	
	@RequestMapping("/findProduct")
	public ModelAndView findProduct(ModelAndView mnv, String pr_name ,String c_name) throws SQLException {
		String url = "jihwan/findProduct";
		if(c_name == "") {
			c_name = null;
		}
		List<ProductVO> product = null;
		if(c_name != null && pr_name == null) {
			product = estimateService.getSelectProductListCno(c_name);
		} else if (pr_name != null && c_name == null) {
			product = estimateService.getSelectProductList(pr_name);
		} else if (pr_name != null && c_name != null){
			Map<String, String> map = new HashMap<>();
			map.put("c_name", c_name);
			map.put("pr_name", pr_name);
			product = estimateService.getProduct(map);
		} else {
			product = estimateService.getProductList();
		}
		mnv.setViewName(url);
		mnv.addObject("product", product);
		
		return mnv;
	}
	
	
//	@RequestMapping("/modifyForm")
//	public void modifyform() {
//		
//	}
}
