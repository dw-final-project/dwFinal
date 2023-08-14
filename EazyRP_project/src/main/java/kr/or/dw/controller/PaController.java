package kr.or.dw.controller;

import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.command.SearchCriteria2;
import kr.or.dw.service.ManagementService;
import kr.or.dw.vo.PaVO;

@Controller
@RequestMapping("/pa")
public class PaController {
	
	@Autowired
	private ManagementService managementService;
	
	@RequestMapping("/pa")
	public ModelAndView pa(ModelAndView mnv, String mcode, String mymenu, HttpSession session, SearchCriteria2 cri2, SearchCriteria cri) throws SQLException {
		String url = "";
		if(mymenu == null) {
			url="pa/pa.page";
		} else {
			url="pa/pa.mymenu";
		}
		
		if(cri2.getStartDate().equals("")) {
			LocalDate now = LocalDate.now();
			
			cri2.setStartDate(now.toString());
			cri2.setEndDate(now.toString());
		}
		Map<String, Object> map = new HashMap<>();
		String c_no = (String) session.getAttribute("c_no");
		map.put("cri2", cri2);
		map.put("cri", cri);
		map.put("c_no", c_no);
		
		Map<String, Object> dataMap = new HashMap<>();
		
		dataMap = managementService.getPaList(map);
		System.out.println(dataMap.get("name"));
		mnv.addObject("mcode", mcode);
		mnv.addObject("cri", cri);
		mnv.addObject("cri2", cri2);
		mnv.addAllObjects(dataMap);
		mnv.setViewName(url);
		return mnv;
	}
}
