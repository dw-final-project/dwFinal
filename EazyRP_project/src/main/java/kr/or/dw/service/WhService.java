package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;

public interface WhService {
	
	Map<String, Object> selectWhList(SearchCriteria cri) throws SQLException;
	
}
