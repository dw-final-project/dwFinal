package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.command.SearchCriteria2;
import kr.or.dw.vo.ProfitLossVO;



public interface ProfitLossService {

	Map<String, Object> getHistorys(String c_no, SearchCriteria cri, SearchCriteria2 cri2) throws SQLException;

	
}
