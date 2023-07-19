package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProductVO;

public interface EstimateService {

	Map<String, Object> selectEstimList() throws SQLException;

	Map<String, Object> selectDetail(String est_no) throws SQLException;

	void estimateInsert(EstimateVO vo) throws SQLException;

	List<ProductVO> getProduct(Map<String, String> map) throws SQLException;

	List<ProductVO> getProductList() throws SQLException;
	
	

}
