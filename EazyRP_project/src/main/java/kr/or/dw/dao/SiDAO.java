package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.SiVO;

@Mapper
public interface SiDAO {

	List<SiVO> selectSiList() throws SQLException;
	
}
