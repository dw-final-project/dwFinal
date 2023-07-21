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

import com.aspose.cells.CellsException;
import com.aspose.cells.ImageOrPrintOptions;
import com.aspose.cells.Range;
import com.aspose.cells.SheetRender;
import com.aspose.cells.Workbook;
import com.aspose.cells.Worksheet;
import com.aspose.cells.Cell;
import com.aspose.cells.Cells;
import com.aspose.cells.LoadOptions;
import com.aspose.cells.Workbook;
import com.aspose.cells.Worksheet;


import java.awt.Color;
import java.awt.Graphics2D;
import java.awt.Rectangle;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.OutputStream;

import javax.imageio.ImageIO;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.service.ManagementService;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.PlVO;

import java.awt.image.BufferedImage;
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

import javax.imageio.ImageIO;
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
	public ModelAndView detail(String dr_no, ModelAndView mnv, HttpSession session) throws Exception {
		DraftVO draft = null;
		Map<String, Object> dataMap = new HashMap<>();
		draft = managementService.selectDraft(dr_no);
		String fileName = draft.getFiles();  // 파일 이름
		String uploadPath = session.getServletContext().getRealPath("/resources/documents/"); // 파일 경로
				
		String saveFile = (uploadPath+fileName); // 파일경로 + 파일이름
        List<String> data = new ArrayList<>();
		try {
            // 엑셀 파일 로드
            LoadOptions loadOptions = new LoadOptions();
            Workbook workbook = new Workbook(saveFile, loadOptions);

            // 첫 번째 시트 가져오기
            Worksheet worksheet = workbook.getWorksheets().get(0);

            // 모든 행을 반복하여 데이터를 2차원 List에 저장
            Cells cells = worksheet.getCells();
            int maxRow = cells.getMaxDataRow() + 1;
            int maxColumn = cells.getMaxDataColumn() + 1;
            for (int row = 0; row < maxRow; row++) {
                for (int column = 0; column < maxColumn; column++) {
                    // 각 셀의 데이터를 문자열로 변환하여 2차원 리스트에 추가
                    Cell cell = cells.get(row, column);
                    data.add((String)cell.getStringValue());
                }
            }
            // 데이터 확인
                for (int i = 0; i < data.size(); i++) {
                    System.out.println(i + "번쨰 = " + data.get(i));
                    System.out.println(i + "번쨰 타입 = "+ data.get(i).getClass());
                }

            // Clean up resources
            workbook.dispose();
        } catch (Exception e) {
            e.printStackTrace();
        }
		String url = "";
		url = "/management/detailD002";
		String pl_no = draft.getPl_no();
		PlVO pl = managementService.getPl(pl_no);
		
		dataMap.put("data", data);
		dataMap.put("draft", draft);
		dataMap.put("pl", pl);
		
		mnv.setViewName(url);
		mnv.addAllObjects(dataMap);
		
		return mnv;
	}
	 

}
