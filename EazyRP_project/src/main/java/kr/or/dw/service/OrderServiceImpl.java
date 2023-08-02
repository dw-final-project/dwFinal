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
import kr.or.dw.dao.EstimateDAO;
import kr.or.dw.dao.MerchandiseDAO;
import kr.or.dw.dao.OrderDAO;
import kr.or.dw.dao.ShopDAO;
import kr.or.dw.dao.SiDAO;
import kr.or.dw.vo.OrderVO;
import kr.or.dw.vo.ProductVO;
import kr.or.dw.vo.ShopVO;
import kr.or.dw.vo.SiVO;


@Service
public class OrderServiceImpl implements OrderService {

	@Autowired
	private OrderDAO orderDAO;
	
	@Autowired
	private EstimateDAO estimateDAO;
	
	@Override
	public Map<String, Object> selectOrderList(SearchCriteria cri) throws SQLException {
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);		// RowBounds : 쿼리에서 페이징 처리된 결과를 알아서 필요한 만큼 가져온다.

		// 현재 page 번호에 맞는 리스트를 perPageNum 개수 만큼 가져오기
		List<Map<String, Object>> orderList = orderDAO.selectOrderList(cri, rowBounds);
		// 전체 board 개수
		int totalCount = orderDAO.selectOrderListCount(cri);

		// PageMaker 생성
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("orderList", orderList);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}
	
	@Override
	public List<ProductVO> getProduct1(Map<String, String> dataMap) throws SQLException {
		List<ProductVO> product = null;
		product = estimateDAO.getProduct(dataMap);
		
		return product;
	}

	@Override
	public List<ProductVO> getProductList1() throws SQLException {
		List<ProductVO> product = null;
		product = estimateDAO.getProductList();
		
		return product;
	}

	@Override
	public void insertOrder(OrderVO orderVO) throws SQLException {
		
		orderDAO.insertOrder(orderVO);
		
	}

	@Override
	public Map<String, Object> selectDetail(String so_no) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		Map<String, Object> order = (Map<String, Object>) orderDAO.selectDetail(so_no);
		System.out.println("OrderServiceImpl order : " + order);
		dataMap.put("order", order);
		
		return dataMap;
	}

	@Override
	public void minusQuantity(OrderVO orderVO) throws SQLException {
		
		orderDAO.minusQuantity(orderVO);
		
	}

	@Override
	public void modifyOrder(OrderVO orderVO) throws SQLException {

		orderDAO.modifyOrder(orderVO);
		
	}

	@Override
	public void plusQuantity(OrderVO orderVO) throws SQLException {
		
		orderDAO.plusQuantity(orderVO);
		
	}
	
}