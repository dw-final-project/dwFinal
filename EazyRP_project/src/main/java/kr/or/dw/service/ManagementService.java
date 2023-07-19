package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.DraftVO;

public interface ManagementService {

	Map<String, Object> getAllDraft(Map<String, Object> dataMap) throws SQLException;

	void documentRegist(DraftVO draft) throws SQLException;

}
