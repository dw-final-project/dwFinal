package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.EstimateVO;

@Mapper
public interface EstimateDAO {

	List<EstimateVO> selectEstimList() throws SQLException;

	EstimateVO selectdetail(String est_no) throws SQLException;

	void insertEstimate(EstimateVO vo) throws SQLException;

	List<EstimateVO> selectDetail(String est_no) throws SQLException;

	String selectEname(int emp_no) throws SQLException;
	
}
