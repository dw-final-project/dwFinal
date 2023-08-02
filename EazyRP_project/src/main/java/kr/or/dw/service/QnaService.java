package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.WareHouseVO;

public interface QnaService {

	Map<String, Object> selectQnaList(SearchCriteria cri) throws SQLException;



}