package kr.or.dw.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.OrderSaleDAO;

@Service
public class OrderSaleServiceImpl implements OrderSaleService {
	
	@Autowired
	private OrderSaleDAO ordersaleDAO;
	
	
}
