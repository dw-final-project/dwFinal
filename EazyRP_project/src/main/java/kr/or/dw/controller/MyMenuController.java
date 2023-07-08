package kr.or.dw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
@RequestMapping("/mymenu")
public class MyMenuController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
	@RequestMapping("/communication")
	public String loginForm() {
		return "/mymenu/communication";
	}
	
	@RequestMapping("/findPeople")
	public ModelAndView findPeople(ModelAndView mnv) {
		String url = "mymenu/findPeople";
		
		mnv.setViewName(url);
		
		return mnv;
	}

}