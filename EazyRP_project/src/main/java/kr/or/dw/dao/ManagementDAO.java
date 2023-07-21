package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.session.RowBounds;

import kr.or.dw.vo.DraftVO;
import kr.or.dw.vo.PlVO;

@Mapper
public interface ManagementDAO {

	List<DraftVO> getAllDraft(Map<String, Object> dataMap, RowBounds rowBounds) throws SQLException;

	int getDraftCount(Map<String, Object> dataMap2) throws SQLException;

	void documentRegist(DraftVO draft) throws SQLException;

	DraftVO selectDraft(String dr_no) throws SQLException;

	PlVO getPl(String pl_no) throws SQLException;

	List<String> getRank(PlVO pl) throws SQLException;

	void updateDraft(Map<String, String> dataMap) throws SQLException;

	void failDraft(Map<String, String> dataMap) throws SQLException;


}
