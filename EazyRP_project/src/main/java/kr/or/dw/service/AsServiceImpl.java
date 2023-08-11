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
import kr.or.dw.dao.AsDAO;
import kr.or.dw.vo.AsVO;



@Service
public class AsServiceImpl implements AsService {
	
	@Autowired
	private AsDAO asDAO;

	@Override
	public Map<String, Object> selectAsList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Map<String, Object>> asList = asDAO.selectAsList(cri, rowBounds);
		int totalCount = asDAO.selectAsListCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("asList", asList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public void registAs(AsVO asVO) throws SQLException {
		asDAO.asRegist(asVO);
		
	}

	@Override
	public Map<String, Object> selectAsDetail(String as_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> as = asDAO.selectAsDetail(as_no);
		
		dataMap.put("as", as);
		
		return dataMap;
	}

	
	
}
