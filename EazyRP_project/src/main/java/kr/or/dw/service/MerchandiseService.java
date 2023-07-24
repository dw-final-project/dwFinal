package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;


public interface MerchandiseService {

	Map<String, Object> selectMerchandiseList(SearchCriteria cri) throws SQLException;

	List<ProductVO> getProduct1(Map<String, String> dataMap) throws SQLException;

	List<ProductVO> getProductList1() throws SQLException;

	
	
}
