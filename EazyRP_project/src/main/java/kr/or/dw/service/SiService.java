package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.SiVO;

public interface SiService {

	List<SiVO> selectSiList() throws SQLException;
	
	
}
