package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;

public interface ShopService {

	List<ShopVO> getShop(Map<String, String> dataMap) throws SQLException;

	List<ShopVO> getShopList() throws SQLException;

	
}
