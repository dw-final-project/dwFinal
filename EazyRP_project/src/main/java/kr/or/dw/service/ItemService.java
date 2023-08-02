package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.command.SearchCriteria;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.WareHouseVO;

public interface ItemService {

	Map<String, Object> selectItemList(SearchCriteria cri) throws SQLException;

	List<Map<String, Object>> getWarehouse(Map<String, String> dataMap) throws SQLException;

	List<Map<String, Object>> getWarehouseList() throws SQLException;


}