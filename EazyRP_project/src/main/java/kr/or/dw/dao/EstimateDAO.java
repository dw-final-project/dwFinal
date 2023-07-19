package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.EstimateVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.WareHouseVO;

@Mapper
public interface EstimateDAO {

	List<Map<String, Object>> selectEstimList() throws SQLException;

	Map<String, Object> selectDetail(String est_no) throws SQLException;

	void insertEstimate(EstimateVO vo) throws SQLException;

	List<Map<String, Object>> forEstimList(String est_no) throws SQLException;
	
	List<ProductVO> getProduct(Map<String, String> map) throws SQLException;

	List<ProductVO> getProductList() throws SQLException;

	List<WareHouseVO> getWareHouse(Map<String, String> dataMap) throws SQLException;

	List<WareHouseVO> getWareHouseList() throws SQLException;

	String ename(int empno) throws SQLException;


	
}
