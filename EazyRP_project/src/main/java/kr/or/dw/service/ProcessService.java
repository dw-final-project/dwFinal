package kr.or.dw.service;

import java.sql.SQLException;

import kr.or.dw.vo.ProcessVO;

public interface ProcessService {
	ProcessVO selectProcess(int PC_NO);

	void registProcess(ProcessVO processVo) throws SQLException;
}
