package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;

public interface AsService {

	Map<String, Object> selectAsList(SearchCriteria cri) throws SQLException;


}
