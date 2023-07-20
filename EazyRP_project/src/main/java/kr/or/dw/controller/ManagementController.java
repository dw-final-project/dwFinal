package kr.or.dw.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.FileSystemResource;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ManagementService;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.PlVO;

import java.io.File;
import java.io.FileInputStream;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;
import java.sql.SQLException;
import java.util.ArrayList;
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
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
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
	@RequestMapping("/documentRegist")
	public String documentRegist() {
		return "/management/documentRegist";
	}
	
	@RequestMapping("/documentDown")
	public ResponseEntity<FileSystemResource> documentDown(HttpSession session, String document, HttpServletResponse res) throws IOException {
	    String uploadPath = session.getServletContext().getRealPath("/resources/forms/");
	    String fileName = "";
	    if (document.equals("B")) {
	        fileName = "휴가신청서.xlsx";
	    } else if (document.equals("A")) {
	        fileName = "출장보고서.xlsx";
	    } else if (document.equals("C")) {
	        fileName = "발주보고서.xlsx";
	    } else if (document.equals("D")) {
	        fileName = "지출결의서.xlsx";
	    }
	    String filePath = uploadPath + fileName;

	    File file = new File(filePath);

	    if (file.exists()) {
	        HttpHeaders headers = new HttpHeaders();
	        headers.setContentType(MediaType.APPLICATION_OCTET_STREAM);

	        try {
	            // 파일 이름을 UTF-8로 인코딩하여 헤더에 설정
	            String encodedFileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
	            headers.setContentDispositionFormData("attachment", encodedFileName);
	        } catch (UnsupportedEncodingException e) {
	            // 인코딩 에러 처리
	            res.sendError(HttpServletResponse.SC_INTERNAL_SERVER_ERROR);
	            return null;
	        }

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
			System.out.println("경로 : " + uploadPath);
			
			draft.setFiles(uniqueName+fileExtension);
			draft.setRealFileName(fileRealName);
			
			File saveFile = new File(uploadPath+uniqueName+fileExtension);
			
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
	
	
	@RequestMapping("/detail")
	public ModelAndView detail(String dr_no, ModelAndView mnv, HttpSession session) throws SQLException {
		DraftVO draft = null;
		Map<String, Object> dataMap = new HashMap<>();
		draft = managementService.selectDraft(dr_no);
        FileInputStream file= null;
		String fileName = draft.getFiles();
		String uploadPath = session.getServletContext().getRealPath("/resources/documents/");
		
		File saveFile = new File(uploadPath+fileName);
		  try {
			  	file = new FileInputStream(saveFile);
		        XSSFWorkbook workbook = new XSSFWorkbook(file);
		        List<String> content = new ArrayList<String>();
		        int rowNo = 0;
		        int cellIndex = 0;
		        String val = "";

		        XSSFSheet sheet = workbook.getSheetAt(0); 
		        

		        int rows = sheet.getPhysicalNumberOfRows();
		        for(rowNo = 0; rowNo <= rows; rowNo++){
		            XSSFRow row = sheet.getRow(rowNo);
		            if(row != null){
		                int cells = row.getPhysicalNumberOfCells();
		                for(cellIndex = 0; cellIndex <= cells; cellIndex++){  
		                    XSSFCell cell = row.getCell(cellIndex);       
		                    String value = "";	                    
		                    if(cell == null) {
		                        continue;
		                    }else{
		                        switch (cell.getCellType()){
		                        case FORMULA:
		                            value = cell.getCellFormula();
		                            break;
		                        case NUMERIC:
		                            value = cell.getNumericCellValue() + "";
		                            break;
		                        case STRING:
		                            value = cell.getStringCellValue() + "";
		                            break;
		                        case BLANK:
		                            value = cell.getBooleanCellValue() + "";
		                            break;
		                        case ERROR:
		                            value = cell.getErrorCellValue() + "";
		                            break;
		                        }
		                    }
		                    if(!value.equals("false")) {
		                    	System.out.println( rowNo + "번 행 : " + cellIndex + "번 열 값은: " + value);
		                    	content.add(value);
		                    }
		                }
		            }
		        } 
		        
		        System.out.println(content);
				mnv.addObject("content", content);
		    }catch(Exception e) {
	    		e.printStackTrace();
	    	}
		
		String url = "/management/documentView1";
		String pl_no = draft.getPl_no();
		PlVO pl = managementService.getPl(pl_no);
		
		dataMap.put("draft", draft);
		dataMap.put("pl", pl);
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		
		return mnv;
	}
	
	

}
