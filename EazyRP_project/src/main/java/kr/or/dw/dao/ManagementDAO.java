package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.DraftVO;

@Mapper
public interface ManagementDAO {

	List<DraftVO> getAllDraft(Map<String, Object> dataMap) throws SQLException;

	int getDraftCount(Map<String, Object> dataMap2) throws SQLException;

	void documentRegist(DraftVO draft) throws SQLException;


}
