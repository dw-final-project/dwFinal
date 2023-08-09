package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;

@Mapper
public interface QualityDAO {

	List<Map<String, Object>> selectQualityList(SearchCriteria cri, RowBounds rowBounds, String c_no) throws SQLException;

	int selectQualityListCount(SearchCriteria cri, String c_no) throws SQLException;

	Map<String, Object> selectQcDetail(int qc_no) throws SQLException;

	List<Map<String, Object>> forQcList(int qc_no) throws SQLException;

	String ename(int empno) throws SQLException;
	
	
	
	
}
