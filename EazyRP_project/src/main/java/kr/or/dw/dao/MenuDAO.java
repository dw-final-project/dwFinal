package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MenuVO;

@Mapper
public interface MenuDAO {
	
	List<MenuVO> selectMainMenuList() throws SQLException;

	List<MenuVO> selectSubMenuList(String mcode) throws SQLException;

	String getURL(String mcode) throws SQLException;

	

}
