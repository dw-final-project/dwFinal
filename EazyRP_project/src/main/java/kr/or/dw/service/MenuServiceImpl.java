package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.MenuDAO;
import kr.or.dw.vo.MenuVO;

@Service
public class MenuServiceImpl implements MenuService{
	
	@Autowired
	private MenuDAO menuDAO;	// == MenuDAOImpl.getInstance();
	
	@Override
	public List<MenuVO> selectMainMenuList() throws SQLException {
		
		List<MenuVO> menuList = menuDAO.selectMainMenuList();
		
		return menuList;
	}

	@Override
	public Map<String, Object> selectSubMenuList(List<MenuVO> menuList) throws SQLException{
		
		Map<String, List<MenuVO>> subMenuList = new HashMap<String, List<MenuVO>>();
		Map<String, List<MenuVO>> smallMenuList = new HashMap<String, List<MenuVO>>();
		
		for(MenuVO menu : menuList) {
			String mcode = menu.getMcode();
			List<MenuVO> subMenu = menuDAO.selectSubMenuList(mcode);
			subMenuList.put(mcode, subMenu);
			for(MenuVO smenu : subMenu) {
				mcode = smenu.getMcode();
				List<MenuVO> smallMenu = menuDAO.selectSubMenuList(mcode);
				smallMenuList.put(mcode, smallMenu);
			}
		}	
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("subMenuList", subMenuList);
		dataMap.put("smallMenuList", smallMenuList);
		
		return dataMap;
	}

	@Override
	public String getUrl(String mcode) throws SQLException {
		String url = menuDAO.getURL(mcode);
		
		return url;
	}




}
