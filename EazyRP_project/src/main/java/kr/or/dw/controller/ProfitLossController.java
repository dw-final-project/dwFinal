package kr.or.dw.controller;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.command.SearchCriteria2;
import kr.or.dw.service.ProfitLossService;
import kr.or.dw.vo.ProfitLossVO;
import kr.or.dw.vo.Tr_historyVO;
@Controller
@RequestMapping("/profitLoss")
public class ProfitLossController {

	private static final Logger logger = LoggerFactory.getLogger(ProfitLossController.class);
	
	@Autowired
	private ProfitLossService profitLossService;
	
	@RequestMapping("/profit")
	public ModelAndView profit(ModelAndView mnv, String mcode, SearchCriteria cri, HttpSession session) {
		
		mnv.setViewName("/profitLoss/profit.page");
		mnv.addObject("mcode", mcode);
		return mnv;
	}
	
	@RequestMapping("/dayProfit")
	public ModelAndView dayProfit(ModelAndView mnv, String mcode, SearchCriteria cri, HttpSession session) {
		
		mnv.setViewName("/profitLoss/dayProfit.page");
		mnv.addObject("mcode", mcode);
		return mnv;
	}
	
	@RequestMapping("/tr_history")
	public ModelAndView tr_history(ModelAndView mnv, String mcode, SearchCriteria2 cri2, SearchCriteria cri, HttpSession session) throws SQLException {
		Map<String, Object> plVo = new HashMap<>();
		String c_no = (String) session.getAttribute("c_no");
		plVo = profitLossService.getHistorys(c_no, cri, cri2);
		List<String> gb = new ArrayList<>();
		List<Tr_historyVO> history = new ArrayList<>();
		history = (List<Tr_historyVO>) plVo.get("list");
		for(int i = 0; i < history.size(); i++) {
			String trgb = history.get(i).getTr_gb();
			if(trgb.equals("s")) {
				gb.add("쇼핑몰 판매");
			} else if(trgb.equals("w")) {
				gb.add("창고 이동");
			} else if(trgb.equals("pb")) {
				gb.add("제품 구매");
			} else if(trgb.equals("b")) {
				gb.add("기타 구매");
			} else if(trgb.equals("o")) {
				gb.add("발주 요청");
			} else if(trgb.equals("e")) {
				gb.add("불량 처리");
			} else if(trgb.equals("p")) {
				gb.add("급여 제공");
			} else if(trgb.equals("a")) {
				gb.add("AS 비용");
			}
		}
		mnv.addObject("gb", gb);
		mnv.addAllObjects(plVo);
		mnv.addObject("cri2", cri2);
		mnv.setViewName("/profitLoss/tr_history.page");
		mnv.addObject("mcode", mcode);
		return mnv;
	}
	
	@RequestMapping("regbtn")
	public void regBtn() {
		for(int i = 0; i < 20; i ++) {
			Map<String, Object> map = new HashMap<>();
			int random1 = ((int) Math.random()*30)+1;
			String date = "2023-08-" + random1;
			map.put("date", date);
			System.out.println(date);
			int saleprice = ((int) Math.random()*100) * 10000;
			map.put("saleprice", saleprice);
			int unitprice = ((int) Math.random()*100) * 10000;
			map.put("unitprice", unitprice);
			if(saleprice < unitprice) {
				int a = saleprice;
				saleprice = unitprice;
				unitprice = a;
			}
			int amount = saleprice - unitprice;
			map.put("amount", amount);
			System.out.println(amount);
			int g = (int) (Math.random()*8);
			String gb = "";
			switch(g){
				case 0: gb = "s"; break;
				case 1: gb = "w"; break;
				case 2: gb = "pb"; break;
				case 3: gb = "b"; break;
				case 4: gb = "o"; break;
				case 5: gb = "e"; break;
				case 6: gb = "p"; break;
				case 7: gb = "a"; break;
			}
			map.put("gb", gb);
			System.out.println(gb);
			int quantity = (int) (Math.random() * 500);
			map.put("quantity", quantity);
			System.out.println(quantity);
		}
	}
	
}
