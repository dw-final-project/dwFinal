package kr.or.dw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.command.SearchCriteria2;
import kr.or.dw.dao.ProfitLossDAO;
import kr.or.dw.vo.ProfitLossVO;
import kr.or.dw.vo.Tr_historyVO;



@Service
public class ProfitLossServiceImpl implements ProfitLossService {
	
	@Autowired
	private ProfitLossDAO profitLossDAO;

	@Override
	public Map<String, Object> getHistorys(String c_no, SearchCriteria cri, SearchCriteria2 cri2) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		dataMap.put("keyword", cri.getKeyword());
		dataMap.put("searchType", cri.getSearchType());
		dataMap.put("cri", cri);
		dataMap.put("c_no", c_no);
		dataMap.put("cri2", cri2);
		System.out.println(cri2.getSearchType1());
		System.out.println(cri2.getSearchType2());
		System.out.println(cri2.getStartDate());
		System.out.println(cri2.getEndDate());
		List<Tr_historyVO> list = profitLossDAO.getHistory(dataMap, rowBounds);
		
		int totalCount = profitLossDAO.getTotalCount(dataMap);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("list", list);
		map.put("pageMaker", pageMaker);
		
		return map;
	}


	
}
