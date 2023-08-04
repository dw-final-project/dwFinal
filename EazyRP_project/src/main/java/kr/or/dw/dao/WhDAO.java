package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.WhVO;

@Mapper
public interface WhDAO {

	List<WhVO> selectSearchWhList(Map<String, Object> map, RowBounds rowBounds) throws SQLException;

	int selectSearchWhListCount(Map<String, Object> map) throws SQLException;

	void insertWh(WhVO whVo) throws SQLException;
	
	void insertWhDetail(WhVO wh) throws SQLException;

	// 제품명 가져오기
	List<String> selectProductName(String getWh_no) throws SQLException;

	Map<String, Object> selectWh(String wh_no) throws SQLException;

	List<Map<String, Object>> selectWhDetail(String wh_no) throws SQLException;

}
