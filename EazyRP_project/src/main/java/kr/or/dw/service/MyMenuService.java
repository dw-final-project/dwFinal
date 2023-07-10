package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.NoteVO;

public interface MyMenuService {

	List<EmpVO> getEmpList() throws SQLException;

	List<EmpVO> getSelectEmpList(String name) throws SQLException;

	List<EmpVO> getSelectEmpListCno(String c_name) throws SQLException;

	List<EmpVO> getEmp(Map<String, String> map) throws SQLException;

	EmpVO selectEmp(int emp_no) throws SQLException;

	void sendNote(NoteVO noteVo) throws SQLException;

	List<NoteVO> getNoteList() throws SQLException;

	NoteVO selectNote(int n_no) throws SQLException;


}
