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
import kr.or.dw.dao.SiDAO;
import kr.or.dw.vo.SiVO;


@Service
public class SiServiceImpl implements SiService {
	
	@Autowired
	private SiDAO siDAO;

	@Override
	public Map<String, Object> selectSiList(SearchCriteria cri) throws SQLException {
		

		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		List<Map<String, Object>> siList = siDAO.selectSiList(cri, rowBounds);
		
		int totalCount = siDAO.selectSearchSiListCount(cri);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("pageMaker", pageMaker);
		dataMap.put("siList", siList);

		return dataMap;
		
	} 
	
	
	
}
