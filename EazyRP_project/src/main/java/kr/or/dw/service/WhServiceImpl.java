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
import kr.or.dw.dao.WhDAO;
import kr.or.dw.vo.WhVO;

@Service
public class WhServiceImpl implements WhService{
	
	@Autowired WhDAO whDAO;
	
	@Override
	public Map<String, Object> selectWhList(SearchCriteria cri) throws SQLException {
		
		List<WhVO> whList = null;
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);	// RowBounds : 쿼리에서 페이징 처리된 결과를 알아서 필요한 만큼 가져온다.
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		whList = whDAO.selectSearchWhList(cri, rowBounds);
		
		// 전체 board 갯수
		int totalCount = whDAO.selectSearchWhListCount(cri);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("whList", whList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

}
