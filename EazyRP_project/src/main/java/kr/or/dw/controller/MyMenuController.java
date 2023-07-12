package kr.or.dw.controller;

import java.io.File;
import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
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

import kr.or.dw.service.MyMenuService;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.NoteVO;

@Controller
@RequestMapping("/mymenu")
public class MyMenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@Autowired
	private MyMenuService mymenuService;
	
	@RequestMapping("/communication")
	public ModelAndView loginForm(ModelAndView mnv) throws SQLException {
		String url = "/mymenu/communication";
		
		mnv.setViewName(url);
		return mnv;
	}
	
	@RequestMapping("/noteRegist")
	public String noteRegist(NoteVO note, int reply, HttpServletResponse res, @RequestParam("file") MultipartFile file) throws SQLException, IOException{
		if(file != null) {
			UUID uuid = UUID.randomUUID();
			String[] uuids = uuid.toString().split("-");
			
			String uniqueName = uuids[0];
			
			String fileRealName = file.getOriginalFilename();
			String fileExtension = fileRealName.substring(fileRealName.lastIndexOf("."),fileRealName.length());
			String fileName = note.getN_no()+"file"+fileExtension;
			String uploadFolder = "C:\\upload\\";
			note.setFiles(uniqueName+fileExtension);
			
			
			File saveFile = new File(uploadFolder+uniqueName+fileExtension);  // 적용 후
			
			if(!saveFile.exists()) {
				saveFile.mkdirs();
			}
			
			try {
				file.transferTo(saveFile); // 실제 파일 저장메서드(filewriter 작업을 손쉽게 한방에 처리해준다.)
			} catch (IllegalStateException e) {
				e.printStackTrace();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		
		
		
		int emp_no = note.getReceiver(); // 받는사람 emp_no
		System.out.println("1");
		int writer = 1;
		EmpVO emp = mymenuService.selectEmp(emp_no); // 받는사람 정보
		EmpVO emp2 = mymenuService.selectEmp(writer); // 보낸사람 정보
		NoteVO noteVo = new NoteVO();
		System.out.println("2");
		if(emp.getDept_no() != null) {
			noteVo.setR_dept(emp.getDept_no());
		} else {
			noteVo.setR_dept("");
		}
		noteVo.setCon(note.getCon());
		noteVo.setTitle(note.getTitle());
		if(note.getFiles() == null || note.getFiles() == "") {
			noteVo.setFiles("");
		} else {
			noteVo.setFiles(note.getFiles());
		}
		if(emp2.getDept_no() != null) {
			noteVo.setC_dept(emp2.getDept_no());
		} else {
			noteVo.setC_dept("");
		}
		if(emp2.getC_no() != null) {
			noteVo.setC_company(emp2.getC_no());
		} else {
			noteVo.setC_company(emp.getC_no());
		}
		noteVo.setCaller(writer);
		
		noteVo.setReceiver(emp_no);
		noteVo.setR_company(emp.getC_no());
		System.out.println("3");
		
		mymenuService.sendNote(noteVo);
		if(reply == 1) {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('답장이 완료되었습니다.')");
			out.println("window.opener.location.reload(true); window.close();");
			out.println("</script>");
			return null;
		} else {
			res.setContentType("text/html; charset=utf-8");
			PrintWriter out = res.getWriter();
			out.println("<script>");
			out.println("alert('전송이 완료되었습니다.')");
			out.println("window.opener.location.reload(true); window.close();");
			out.println("</script>");
			return null;
		}
	}
	
	@RequestMapping("/noteList")
	public ModelAndView noteList(ModelAndView mnv) throws SQLException{
		String url="/mymenu/noteList";
		
		List<NoteVO> note = mymenuService.getNoteList();
		
		mnv.setViewName(url);
		mnv.addObject("note", note);
		
		return mnv;
	}
	
	@RequestMapping("/deleteNote")
	public void deleteNote(int n_no, HttpServletResponse res) throws SQLException, IOException {
		mymenuService.deleteNote(n_no);
		
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("alert('삭제되었습니다.')");
		out.println("window.opener.location.reload(true); window.close();");
		out.println("</script>");
	}
	
	@RequestMapping("/replyNote")
	public ModelAndView replyNote(ModelAndView mnv, int caller, String callerName, HttpServletResponse res) throws SQLException, IOException {
		res.setContentType("text/html; charset=utf-8");
		PrintWriter out = res.getWriter();
		out.println("<script>");
		out.println("window.resizeTo(700,1000)");
		out.println("</script>");
		
		String url =  "/mymenu/reply";
		
		mnv.addObject("caller", caller);
		mnv.addObject("callerName", callerName);
		mnv.setViewName(url);
		
		return mnv;
	}
	
	@RequestMapping("/detail")
	public ModelAndView detail(ModelAndView mnv, int n_no) throws SQLException, IOException {
		
		
		String url = "/mymenu/detail";
		NoteVO note = mymenuService.selectNote(n_no);
		
		mnv.setViewName(url);
		mnv.addObject("note", note);
		
		return mnv;
	}
	
	@RequestMapping("/findPeople")
	public ModelAndView findPeople(ModelAndView mnv, String name, String c_name) throws SQLException {
		String url = "mymenu/findPeople";
		if(name == "") {
			name = null;
		}
		if(c_name == "") {
			c_name = null;
		}
		List<EmpVO> emp = null;
		if(c_name != null && name == null) {
			emp = mymenuService.getSelectEmpListCno(c_name);
		} else if (name != null && c_name == null) {
			emp = mymenuService.getSelectEmpList(name);
		} else if (name != null && c_name != null){
			Map<String, String> map = new HashMap<>();
			map.put("c_name", c_name);
			map.put("name", name);
			emp = mymenuService.getEmp(map);
		} else {
			emp = mymenuService.getEmpList();
		}
		mnv.setViewName(url);
		mnv.addObject("emp", emp);
		
		return mnv;
	}

	
	@RequestMapping("/search")
	public ModelAndView search(ModelAndView mnv, String keyword, String searchType) throws SQLException {
		String url = "/mymenu/noteList";
		Map<String, String> valMap = new HashMap<>();
		valMap.put("keyword", keyword);
		valMap.put("searchType", searchType);
		List<NoteVO> note = null;
		note = mymenuService.searchNote(valMap);
		mnv.addObject("note", note);
		mnv.addObject("keyword", keyword);
		mnv.addObject("searchType", searchType);
		mnv.setViewName(url);
		
		return mnv;
	}
	
}
