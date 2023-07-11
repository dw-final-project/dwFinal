package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ProcessVO;

public interface ProcessService {
	
	void registProcess(ProcessVO processVo) throws SQLException;

	// 공정 리스트 조회 및 페이징
	Map<String, Object> selectProcessList(SearchCriteria cri) throws SQLException;
	
	// 공정  상세페이지
	ProcessVO selectProcess(int pc_no) throws SQLException;

}
