package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.EstimateVO;

public interface EstimateService {

	List<EstimateVO> selectEstimList() throws SQLException;

}