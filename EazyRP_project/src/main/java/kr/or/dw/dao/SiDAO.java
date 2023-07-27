package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.SiVO;

@Mapper
public interface SiDAO {

	List<Map<String, Object>> selectSiList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectSearchSiListCount(SearchCriteria cri) throws SQLException;

	
	
}
