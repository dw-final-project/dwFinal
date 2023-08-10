package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
import kr.or.dw.dao.QualityDAO;
import kr.or.dw.vo.QualityVO;

@Service
public class QualityServiceImpl implements QualityService{
	
	@Autowired
	private QualityDAO qualityDAO;
	
	@Override
	public Map<String, Object> selectQualityList(SearchCriteria cri, String c_no) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		List<Map<String, Object>> qualityList = qualityDAO.selectQualityList(cri, rowBounds, c_no);
		
		int totalCount = qualityDAO.selectQualityListCount(cri, c_no);
		
		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("qualityList", qualityList);
		dataMap.put("pageMaker", pageMaker);
		
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectQcDetail(int qc_no) throws SQLException {
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		Map<String, Object> qc = qualityDAO.selectQcDetail(qc_no);
		
		List<Map<String, Object>> qcList = qualityDAO.forQcList(qc_no);
		
		dataMap.put("qc", qc);
		dataMap.put("qcList", qcList);
		
		return dataMap;
	}

	@Override
	public String ename(int empno) throws SQLException {
		String ename = qualityDAO.ename(empno);
		return ename;
	}
	
	@Transactional
	@Override
	public void insertQc(List<QualityVO> qualityVO) throws SQLException {
		
		qualityDAO.insertQc(qualityVO.get(0));
		int qc_no = qualityVO.get(0).getQc_no();
		
		for (QualityVO vo : qualityVO) {
			vo.setQc_no(qc_no);
			System.out.println("나는:" + qc_no);
			int result = qualityDAO.insertQcDetail(vo);
			if (result < 0) break;
		}
		
	}
	
	
	
}
