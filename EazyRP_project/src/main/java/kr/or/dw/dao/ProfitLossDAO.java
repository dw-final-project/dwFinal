package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ProfitLossVO;
import kr.or.dw.vo.SiVO;
import kr.or.dw.vo.Tr_historyVO;

@Mapper
public interface ProfitLossDAO {

	int getTotalCount(Map<String, Object> dataMap) throws SQLException;

	List<Tr_historyVO> getHistory(Map<String, Object> dataMap, RowBounds rowBounds) throws SQLException;

	
}
