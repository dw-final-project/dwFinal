package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.EstimateVO;

public interface EstimateService {

	Map<String, Object> selectEstimList() throws SQLException;

	List<EstimateVO> selectDetail(String est_no) throws SQLException;

	void estimateInsert(EstimateVO vo) throws SQLException;


}
