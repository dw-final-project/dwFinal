package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;

@Mapper
public interface OrderSaleDAO {

	List<Map<String, Object>> selectSaleList(Map<String, Object> dataMap2, RowBounds rowBounds) throws SQLException;

	int selectSearchSaleListCount(Map<String, Object> dataMap2) throws SQLException;

	
	
}	
