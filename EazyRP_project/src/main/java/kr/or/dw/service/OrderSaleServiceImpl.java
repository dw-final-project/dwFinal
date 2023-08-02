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
import kr.or.dw.dao.OrderSaleDAO;
import kr.or.dw.vo.BsheetVO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.SaleDetailVO;
import kr.or.dw.vo.SsheetVO;

@Service
public class OrderSaleServiceImpl implements OrderSaleService {
	
	@Autowired
	private OrderSaleDAO ordersaleDAO;

	@Override
	public Map<String, Object> selectSaleList(Map<String, Object> dataMap) throws SQLException {
		
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		String c_no = (String) dataMap.get("c_no");
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, Object> dataMap2 = new HashMap<String, Object>();
		
		dataMap2.put("keyword", cri.getKeyword());
		dataMap2.put("searchType", cri.getSearchType());
		dataMap2.put("cri", cri);
		dataMap2.put("c_no", c_no);
		List<Map<String, Object>> sale = ordersaleDAO.selectSaleList(dataMap2, rowBounds);
		
		int totalCount = ordersaleDAO.selectSearchSaleListCount(dataMap2);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("sale", sale);
		map.put("pageMaker", pageMaker);
		
		return map;
		
	}
	
	

	

	

	
	
	
}
