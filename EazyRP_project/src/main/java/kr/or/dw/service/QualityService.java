package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.QualityVO;

public interface QualityService {

	Map<String, Object> selectQualityList(SearchCriteria cri, String c_no) throws SQLException;

	Map<String, Object> selectQcDetail(int qc_no) throws SQLException;

	String ename(int empno) throws SQLException;

	void insertQc(List<QualityVO> qualityVO) throws SQLException;

	void modifyQc(List<QualityVO> modify, String empno) throws SQLException;

	QualityVO qcFileDown(int qc_no) throws SQLException;
	
}
