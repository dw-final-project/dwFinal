package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.SiDAO;
import kr.or.dw.vo.SiVO;


@Service
public class SiServiceImpl implements SiService {
	
	@Autowired
	private SiDAO siDAO; 
	
	@Override
	public List<SiVO> selectSiList() throws SQLException {
		
		List<SiVO> siList = siDAO.selectSiList();
		
		return siList;
	}

	
}
