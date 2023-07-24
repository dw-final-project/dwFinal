package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.ShopDAO;
import kr.or.dw.dao.SiDAO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;


@Service
public class ShopServiceImpl implements ShopService {
	
	@Autowired
	private ShopDAO shopDAO;

	@Override
	public List<ShopVO> getShop(Map<String, String> dataMap) throws SQLException {
		List<ShopVO> shop = null;
		shop = shopDAO.getShop(dataMap);
		return shop;
	}

	@Override
	public List<ShopVO> getShopList() throws SQLException {
		List<ShopVO> shop = null;
		shop = shopDAO.getShopList();
		return shop;
	} 
	
	
}
