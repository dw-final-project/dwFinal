package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.WhVO;

@Mapper
public interface WhDAO {

	List<WhVO> selectSearchWhList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectSearchWhListCount(SearchCriteria cri) throws SQLException;

	void insertWh(WhVO whVo) throws SQLException;
	
	void insertWhDetail(WhVO whVo) throws SQLException;

	// 제품명 가져오기
	List<String> selectProductName(String getWh_no) throws SQLException;


}
