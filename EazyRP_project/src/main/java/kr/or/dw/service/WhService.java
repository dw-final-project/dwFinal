package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.WhVO;

public interface WhService {
	
	Map<String, Object> selectWhList(SearchCriteria cri) throws SQLException;

	void registWh(List<WhVO> whDetailVoList) throws SQLException;

}
