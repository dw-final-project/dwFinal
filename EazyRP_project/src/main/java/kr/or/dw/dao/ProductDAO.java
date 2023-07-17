package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SiVO;

@Mapper
public interface ProductDAO {

	List<ProductVO> selectSearchProductList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectSearchProductListCount(SearchCriteria cri) throws SQLException;



	
}
