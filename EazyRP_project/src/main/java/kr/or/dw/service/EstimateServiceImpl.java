package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.EstimateDAO;
import kr.or.dw.vo.EstimateVO;

@Service
public class EstimateServiceImpl implements EstimateService {
	
	@Autowired
	private EstimateDAO estimateDAO;
	
	@Override
	public List<EstimateVO> selectEstimList() throws SQLException {
		
		List<EstimateVO> estimList = estimateDAO.selectEstimList();
		
		return estimList;
	}
	
	
	
	
}
