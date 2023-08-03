package kr.or.dw.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
@Controller
@RequestMapping("/profitLoss")
public class ProfitLossController {

	private static final Logger logger = LoggerFactory.getLogger(ProfitLossController.class);
	
	@RequestMapping("/profit")
	public ModelAndView profit(ModelAndView mnv, String mcode) {
		
		mnv.setViewName("/profitLoss/profit.page");
		mnv.addObject("mcode", mcode);
		return mnv;
	}
	
}
