package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.MerchandiseVO;
import kr.or.dw.vo.OrderVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;

@Mapper
public interface OrderDAO {

	List<Map<String, Object>> selectOrderList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;

	int selectOrderListCount(SearchCriteria cri) throws SQLException;

	void insertOrder(OrderVO orderVO) throws SQLException;

	Map<String, Object> selectDetail(String so_no) throws SQLException;

	void minusQuantity(OrderVO orderVO) throws SQLException;

	void modifyOrder(OrderVO orderVO) throws SQLException;

	void plusQuantity(OrderVO orderVO) throws SQLException;


	
}
