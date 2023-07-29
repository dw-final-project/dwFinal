package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.WorkOrderDAO;
import kr.or.dw.vo.WorkOrderVO;

@Service
public class WorkOrderServiceImpl implements WorkOrderService{

	@Autowired
	private WorkOrderDAO workOrderDAO;
	
	@Override
	public Map<String, Object> selectWorkOrderList(SearchCriteria cri) throws SQLException {
		
		List<WorkOrderVO> woList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		woList = workOrderDAO.selectSearchWorkOrderList(cri, rowBounds);
		
		// 전체 board 개수
		int totalCount = workOrderDAO.selectSearchWorkOrderListCount(cri);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("woList", woList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

}
