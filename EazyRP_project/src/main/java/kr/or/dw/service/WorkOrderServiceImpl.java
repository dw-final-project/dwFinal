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
		
		// 제품의 이름을 담을 객체를 선언한다.
		// 현재 해당하는 생산입고 게시글에서 창고번호를 조회하고 매퍼에서 가져온 창고명을 넣어준다.
		for(int i = 0; i < woList.size(); i++) {
			
			int getEmp_no = woList.get(i).getEmp_no();
			List<String> eName = workOrderDAO.selectEName(getEmp_no);
			
			woList.get(i).setE_name(eName.get(i));
		
		}
		
		return dataMap;
	}

}
