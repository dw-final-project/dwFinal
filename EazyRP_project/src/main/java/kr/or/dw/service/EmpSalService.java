package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;

public interface EmpSalService {

	Map<String, Object> selectEmpList(SearchCriteria cri) throws SQLException;

	Map<String, Object> selectDetail(int emp_no) throws SQLException;

	List<CompanyVO> getCompany(Map<String, String> dataMap) throws SQLException;

	List<CompanyVO> getCompanyList() throws SQLException;

}
