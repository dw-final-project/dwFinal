package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;

import kr.or.dw.vo.SiVO;


//출하 지시서
public interface SiService {

	List<SiVO> selectSiList() throws SQLException;
	
	
}
