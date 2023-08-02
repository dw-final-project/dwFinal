package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;

public interface OrderSaleService {


	Map<String, Object> selectSaleList(Map<String, Object> dataMap) throws SQLException;

	
	
	
	
	

}
