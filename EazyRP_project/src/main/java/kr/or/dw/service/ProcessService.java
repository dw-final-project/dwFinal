package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ProcessVO;

public interface ProcessService {
	
	void registProcess(ProcessVO processVo) throws SQLException;

	Map<String, Object> selectProcessList(SearchCriteria cri) throws SQLException;

}
