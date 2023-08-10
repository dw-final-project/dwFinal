package kr.or.dw.service;

import java.sql.SQLException;
import java.util.Map;

public interface WhTransferService {

	Map<String, Object> selectWhTransferList(Map<String, Object> map) throws SQLException;
	
}
