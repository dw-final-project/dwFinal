package kr.or.dw.service;

import java.sql.SQLException;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.ProcessDAO;
import kr.or.dw.vo.ProcessVO;

public class ProcessServiceImpl implements ProcessService{

	@Autowired
	private ProcessDAO processDAO;
	
	@Override
	public ProcessVO selectProcess(int PC_NO) {
		return null;
	}

	@Override
	public void registProcess(ProcessVO processVo) throws SQLException {
		processDAO.insertProcess(processVo);
	}

}
