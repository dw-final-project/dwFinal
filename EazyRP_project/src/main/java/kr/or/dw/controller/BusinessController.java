package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLClientInfoException;
import java.sql.SQLException;
import java.util.List;
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
import kr.or.dw.service.SiService;
import kr.or.dw.vo.EstimateVO;
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
	
	@RequestMapping("/business")
	public ModelAndView main(ModelAndView mnv, String mcode) throws SQLException {
		String url = "jihwan/main.page";
		
		List<EstimateVO> estimList = estimateService.selectEstimList();
		mnv.addObject("mcode", mcode);
		mnv.setViewName(url);
<<<<<<< Updated upstream
		mnv.addObject("estimList" ,estimList);
		System.out.println(estimList.get(0).getFiles());
		System.out.println(estimList.get(1).getFiles());
=======
		mnv.addObject("estimList", estimList);
		
>>>>>>> Stashed changes
		return mnv;
	}
	
	@RequestMapping("/estimate")
	public String esti() {
		String url = "jihwan/estimate";
		return url;
	}

	@RequestMapping("/estimateSelect")
	public ModelAndView estSel(ModelAndView mnv ,String est_no) throws SQLException {
		
		
		EstimateVO estVo = estimateService.selectdetail(est_no);
		String url = "jihwan/estimateSelect.page";
		mnv.addObject("estVo", estVo);
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
			vo.setFileName(uniqueName+fileExtension);
			
			
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
	
	
//	@RequestMapping("/modifyForm")
//	public void modifyform() {
//		
//	}
}
