package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.WorkOrderVO;

@Mapper
public interface WorkOrderDAO {
	
	List<WorkOrderVO> selectSearchWorkOrderList(SearchCriteria cri, RowBounds rowBounds) throws SQLException;
	
	int selectSearchWorkOrderListCount(SearchCriteria cri) throws SQLException;
	
	// 담당자 이름 가져오기
	List<String> selectEName(int getEmp_no) throws SQLException;

	int selectWono(int wono) throws SQLException;

	int wo_no(int wono);

}