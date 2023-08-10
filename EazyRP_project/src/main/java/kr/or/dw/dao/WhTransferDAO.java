package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.vo.WhTransferVO;
import kr.or.dw.vo.WorkOrderVO;

@Mapper
public interface WhTransferDAO {
	
	List<WhTransferVO> selectSearchWhTransferList(RowBounds rowBounds, Map<String, Object> map) throws SQLException;
	
	int selectSearchWhTransferListCount(Map<String, Object> map) throws SQLException;

}
