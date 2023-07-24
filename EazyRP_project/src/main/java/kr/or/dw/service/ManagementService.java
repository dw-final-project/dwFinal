package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.PlVO;

public interface ManagementService {

	Map<String, Object> getAllDraft(Map<String, Object> dataMap) throws SQLException;

	void documentRegist(DraftVO draft) throws SQLException;

	DraftVO selectDraft(String dr_no) throws SQLException;

	PlVO getPl(String pl_no) throws SQLException;

	List<String> getRank(PlVO pl) throws SQLException;

	void updateDraft(Map<String, String> dataMap) throws SQLException;

	void failDraft(Map<String, String> dataMap) throws SQLException;

	String getE_name(int emp_no) throws SQLException;

}
