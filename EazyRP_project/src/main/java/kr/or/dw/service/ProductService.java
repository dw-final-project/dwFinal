package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.BsheetVO;
import kr.or.dw.vo.SiVO;


public interface ProductService {

	Map<String, Object> selectProductList(SearchCriteria cri) throws SQLException;

	List<BsheetVO> getB_sheet() throws SQLException;

	
	
}
