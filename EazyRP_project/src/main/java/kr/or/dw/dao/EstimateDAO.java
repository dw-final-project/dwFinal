package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.EstimateVO;

@Mapper
public interface EstimateDAO {

	List<EstimateVO> selectEstimList() throws SQLException;
	
}
