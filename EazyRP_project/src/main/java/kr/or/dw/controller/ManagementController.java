package kr.or.dw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ManagementService;
import kr.or.dw.vo.DraftVO;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.UUID;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.catalina.core.ApplicationContext;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

@Controller
@RequestMapping("/management")
public class ManagementController {
	
	private static final Logger logger = LoggerFactory.getLogger(ManagementController.class);
	
	@Autowired
	private ManagementService managementService;
	
	@RequestMapping("/main")
	public ModelAndView main(ModelAndView mnv, String mcode) throws SQLException {
		String url = "/management/testMain.page";
		
		mnv.setViewName(url);
		mnv.addObject("mcode", mcode);

		
		return mnv;
	}
	
	@RequestMapping("/payment")
	public ModelAndView payment(HttpSession session, ModelAndView mnv, String mcode, SearchCriteria cri) throws SQLException {
		String url = "/management/payment.page";
		String c_no = (String)session.getAttribute("c_no");
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> draft = null;

		dataMap.put("cri", cri);
		dataMap.put("c_no", c_no);
		
		draft = managementService.getAllDraft(dataMap);
		
		System.out.println();
		mnv.setViewName(url);
		mnv.addObject("mcode", mcode);
		mnv.addAllObjects(draft);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, String dr_no) {
		
		return mnv;
	}
	
	@RequestMapping("/documentRegist")
	public String documentRegist() {
		return "/management/documentRegist";
	}
	
	@RequestMapping("/documentDown")
	public ResponseEntity<FileSystemResource> documentDown(HttpSession session, String document, HttpServletResponse res) throws IOException {
		String uploadPath = session.getServletContext().getRealPath("/resources/forms/");
		String filePath = uploadPath + document + ".xlsx";
		String fileName = document + ".xlsx";
		File file = new File(filePath);
		

        if (file.exists()) {
            HttpHeaders headers = new HttpHeaders();
            headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);
            headers.setContentDispositionFormData("attachment", fileName);

            FileSystemResource resource = new FileSystemResource(file);
            return new ResponseEntity<>(resource, headers, org.springframework.http.HttpStatus.OK);
        } else {
            res.sendError(HttpServletResponse.SC_NOT_FOUND);
            return null;
        }
		
	}
	
	@RequestMapping("/regist")
	public void regist(HttpServletRequest req, MultipartFile file, String fileName, HttpServletResponse res, DraftVO draft, HttpSession session) throws SQLException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		
		if(!fileName.trim().equals("")) {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			String uniqueName = uuids[0];
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String uploadPath = session.getServletContext().getRealPath("/resources/documents/");
			
			draft.setFiles(uniqueName+fileExtension);
			draft.setRealFileName(fileRealName);
			
			File saveFile = new File(uploadPath+uniqueName+fileExtension);  // 적용 후
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			
			try {
				file.transferTo(saveFile);
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		} else {
			draft.setFiles("");
			draft.setRealFileName("");
		}
		
		
		draft.setEmp_no((int)session.getAttribute("emp_no"));
		draft.setC_no((String)session.getAttribute("c_no"));
		
		
		managementService.documentRegist(draft);
		

		out.println("<script>");
		out.println("alert('기안문 작성이 되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
		
	}

}
