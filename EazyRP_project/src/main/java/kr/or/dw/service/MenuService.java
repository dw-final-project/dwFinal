package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.MenuVO;

public interface MenuService {
	
	// 전체 메인 메뉴 목록 조회
	List<MenuVO> selectMainMenuList() throws SQLException;

	Map<String, Object> selectSubMenuList(List<MenuVO> menuList) throws SQLException;

	
}
