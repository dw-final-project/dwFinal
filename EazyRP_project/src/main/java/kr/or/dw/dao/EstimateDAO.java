package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.EstimateVO;

@Mapper
public interface EstimateDAO {

	List<Map<String, Object>> selectEstimList() throws SQLException;

	List<EstimateVO> selectDetail(String est_no) throws SQLException;

	void insertEstimate(EstimateVO vo) throws SQLException;


	
}
