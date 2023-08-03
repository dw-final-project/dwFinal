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
import kr.or.dw.dao.EmpSalDAO;
import kr.or.dw.dao.MerchandiseDAO;
import kr.or.dw.dao.ShopDAO;
import kr.or.dw.dao.SiDAO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;


@Service
public class EmpSalServiceImpl implements EmpSalService {

	@Autowired
	private EmpSalDAO empsalDAO;

	@Override
	public Map<String, Object> selectEmpList(SearchCriteria cri) throws SQLException {

		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);	// RowBounds : 쿼리에서 페이징 처리된 결과를 알아서 필요한 만큼 가져온다.

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		List<Map<String, Object>> empList = empsalDAO.selectEmpList(cri, rowBounds);
		// 전체 board 개수
		int totalCount = empsalDAO.selectEmpListCount(cri);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("empList", empList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

	@Override
	public Map<String, Object> selectDetail(int emp_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> emp = (Map<String, Object>) empsalDAO.selectDetail(emp_no);
		dataMap.put("emp", emp);
		
		return dataMap;
	}

	@Override
	public List<CompanyVO> getCompany(Map<String, String> dataMap) throws SQLException {
		
		List<CompanyVO> company = null;
		company = empsalDAO.getCompany(dataMap);
		
		return company;
	}

	@Override
	public List<CompanyVO> getCompanyList() throws SQLException {
		
		List<CompanyVO> company = null;
		company = empsalDAO.getCompanyList();
		
		return company;
	}
	
	
}
