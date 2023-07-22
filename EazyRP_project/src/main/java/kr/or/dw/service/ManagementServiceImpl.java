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
		dataMap2.put("keyword", cri.getKeyword());
		dataMap2.put("searchType", cri.getSearchType());
		dataMap2.put("cri", cri);
		dataMap2.put("c_no", c_no);
		int totalCount = managementDAO.getDraftCount(dataMap2);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);

		
		draft = managementDAO.getAllDraft(dataMap2, rowBounds);
		
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

	@Override
	public List<String> getRank(PlVO pl) throws SQLException {
		List<String> rank = managementDAO.getRank(pl);
		
		return rank;
	}

	@Override
	public void updateDraft(Map<String, String> dataMap) throws SQLException {
		String no = "";
		String pl_progress = dataMap.get("pl_progress");
		if(pl_progress.equals("0")) {
			no = "1";
		} else if(pl_progress.equals("1")) {
			no = "2";
		} else if(pl_progress.equals("2")) {
			no = "3";
		}
		dataMap.put("no", no);
		System.out.println(no);
		System.out.println(pl_progress);
		managementDAO.updateDraft(dataMap);
	}

	@Override
	public void failDraft(Map<String, String> dataMap) throws SQLException {
		String no = "";
		String pl_progress = dataMap.get("pl_progress");
		if(pl_progress.equals("0")) {
			no = "1fail";
		} else if(pl_progress.equals("1")) {
			no = "2fail";
		} else if(pl_progress.equals("2")) {
			no = "3fail";
		}
		System.out.println(no);
		System.out.println(pl_progress);
		dataMap.put("no", no);
		managementDAO.failDraft(dataMap);
	}

	@Override
	public String getE_name(int emp_no) throws SQLException {
		String ename = managementDAO.getE_name(emp_no);
		return ename;
	}

}
