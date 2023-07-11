package kr.or.dw.controller;

<<<<<<< Updated upstream
import java.sql.SQLException;
import java.util.List;
=======
import javax.servlet.http.HttpServletResponse;
>>>>>>> Stashed changes

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import kr.or.dw.service.MenuService;
import kr.or.dw.vo.MenuVO;

@Controller
public class CommonController {
	
	private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
	
<<<<<<< Updated upstream
	@Autowired
	private MenuService menuService;

=======
>>>>>>> Stashed changes
	@GetMapping("/common/loginForm")
	public String loginForm(HttpServletResponse res) throws Exception {
		String url = "/common/loginForm";
		
		return url;
	}
	
<<<<<<< Updated upstream
//	@GetMapping("/common/main")
//	public String main() {
//		return "/common/main";
//	}
	
	@RequestMapping("/common/main")
	public ModelAndView index(@RequestParam(defaultValue="M000000")String mcode, ModelAndView mnv) throws SQLException{
		String url = "/common/main";
		
		List<MenuVO> menuList = menuService.selectMainMenuList();
		MenuVO menu = menuService.selectMenuByMcode(mcode);
		
		mnv.addObject("menu", menu);
		mnv.addObject("menuList", menuList);
		mnv.setViewName(url);
		
		
		
		return mnv;
=======
	@GetMapping("/common/main")
	public String main() {
		return "/common/registerForm";
>>>>>>> Stashed changes
	}
	
	@RequestMapping("/common/subMenu")
	public ResponseEntity<List<MenuVO>> subMenu(String mcode){
		System.out.println(mcode);
		ResponseEntity<List<MenuVO>> entity = null;
		
		List<MenuVO> subMenu = null;
		try {
			subMenu = menuService.selectSubMenuList(mcode);
			entity = new ResponseEntity<List<MenuVO>>(subMenu, HttpStatus.OK);
		} catch (SQLException e) {
			entity = new ResponseEntity<List<MenuVO>>(HttpStatus.INTERNAL_SERVER_ERROR);
		}
		
		return entity;
	}
	
	
}
