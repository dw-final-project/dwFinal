package kr.or.dw.service;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.ProfitLossDAO;



@Service
public class ProfitLossServiceImpl implements ProfitLossService {
	
	@Autowired
	private ProfitLossDAO profitLossDAO;


	
}
