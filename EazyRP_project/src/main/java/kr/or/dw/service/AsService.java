package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.AsVO;

public interface AsService {

	Map<String, Object> selectAsList(SearchCriteria cri) throws SQLException;

	void registAs(AsVO asVO) throws SQLException;

	Map<String, Object> selectAsDetail(String as_no) throws SQLException;


}
