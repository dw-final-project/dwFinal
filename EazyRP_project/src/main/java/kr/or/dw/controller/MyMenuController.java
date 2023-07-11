package kr.or.dw.controller;

import java.io.IOException;
import java.io.PrintWriter;
import java.io.Writer;
import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
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
	public String noteRegist(NoteVO note, int writer) throws SQLException{
		int emp_no = note.getReceiver(); // 받는사람 emp_no
		writer = 1;
		EmpVO emp = mymenuService.selectEmp(emp_no); // 받는사람 정보
		EmpVO emp2 = mymenuService.selectEmp(writer); // 보낸사람 정보
		NoteVO noteVo = new NoteVO();
		
		noteVo.setR_dept(emp.getDept_no());

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

		
		mymenuService.sendNote(noteVo);
		
		return "/mymenu/communication";
	}
	
	@RequestMapping("/noteList")
	public ModelAndView noteList(ModelAndView mnv) throws SQLException{
		String url="/mymenu/noteList";
		
		List<NoteVO> note = mymenuService.getNoteList();
		
		mnv.setViewName(url);
		mnv.addObject("note", note);
		
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

}
