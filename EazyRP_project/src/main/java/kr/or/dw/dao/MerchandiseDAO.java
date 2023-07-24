package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;

@Mapper
public interface MerchandiseDAO {

	List<Map<String, Object>> selectMerchandiseList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectMerchandiseListCount(SearchCriteria cri) throws SQLException;

	
}
