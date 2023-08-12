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
import kr.or.dw.dao.WhTransferDAO;
import kr.or.dw.vo.WhTransferVO;

@Service
public class WhTransferServiceImpl implements WhTransferService{

	@Autowired
	private WhTransferDAO whTransferDAO;
	
	@Override
	public Map<String, Object> selectWhTransferList(Map<String, Object> map) throws SQLException {

		List<Map<String, Object>> whtList = null;
		SearchCriteria cri = (SearchCriteria) map.get("cri");
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		whtList = whTransferDAO.selectSearchWhTransferList(rowBounds, map);
		
		// 전체 board 개수
		int totalCount = whTransferDAO.selectSearchWhTransferListCount(map);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("whtList", whtList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	
	}

	@Override
	public Map<String, Object> whtSelectWareHouse(Map<String, Object> map) throws SQLException {
	
		List<Map<String, Object>> whtWareHouseList = null;
		SearchCriteria cri = (SearchCriteria) map.get("cri");
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		whtWareHouseList = whTransferDAO.whtSelectWareHouseList(rowBounds, map);
		
		// 전체 board 개수
		int totalCount = whTransferDAO.whtSelectWareHouseListCount(map);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("whtWareHouseList", whtWareHouseList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
		
	}

	@Override
	public void registWhTransfer(List<WhTransferVO> whtList) throws SQLException {
		
		whTransferDAO.registWhTransfer(whtList.get(0));
		
		String wt_no = whtList.get(0).getWt_no();
		System.out.println("whtList.get(0).getWt_no() = " + wt_no);
		
		for(WhTransferVO whtDetail : whtList) {
			whtDetail.setWt_no(wt_no);
			whTransferDAO.registWhTransferDetail(whtDetail);
		}

	}

}
