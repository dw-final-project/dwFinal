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
import kr.or.dw.dao.ManagementDAO;
import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.PlVO;

@Service
public class ManagementServiceImpl implements ManagementService{

	@Autowired
	private ManagementDAO managementDAO;
	
	@Override
	public Map<String, Object> getAllDraft(Map<String, Object> dataMap) throws SQLException {
		List<DraftVO> draft = null;
		SearchCriteria cri = (SearchCriteria) dataMap.get("cri");
		String c_no = (String) dataMap.get("c_no");
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		Map<String, Object> dataMap2 = new HashMap<String, Object>();
		dataMap2.put("cri", cri);
		dataMap2.put("c_no", c_no);
		dataMap2.put("rowbounds", rowBounds);
		
		int totalCount = managementDAO.getDraftCount(dataMap2);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		
		draft = managementDAO.getAllDraft(dataMap);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("draft", draft);
		map.put("pageMaker", pageMaker);
		
		return map;
	}

	@Override
	public void documentRegist(DraftVO draft) throws SQLException {
		managementDAO.documentRegist(draft);
	}

	@Override
	public DraftVO selectDraft(String dr_no) throws SQLException {
		DraftVO draft = null;
		
		draft = managementDAO.selectDraft(dr_no);
		return draft;
	}

	@Override
	public PlVO getPl(String pl_no) throws SQLException {
		PlVO pl = null;
		pl = managementDAO.getPl(pl_no);
		
		return pl;
	}

}
