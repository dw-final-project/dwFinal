package kr.or.dw.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.ProcessVO;

@Mapper
public interface ProcessDAO {
	void insertProcess(ProcessVO processVo) throws SQLException;
}
