package kr.or.dw.dao;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.NoteVO;

@Mapper
public interface MyMenuDAO {

	public List<EmpVO> getEmpList() throws SQLException;

	public List<EmpVO> getSelectEmpList(String name) throws SQLException;

	public List<EmpVO> getSelectEmpListCno(String c_name) throws SQLException;

	public List<EmpVO> getEmp(Map<String, String> map) throws SQLException;

	public EmpVO selectEmp(int emp_no) throws SQLException;

	public void sendNote(NoteVO noteVo) throws SQLException;

	public List<NoteVO> getNoteList() throws SQLException;

	public NoteVO selectNote(int n_no) throws SQLException;

	public void readableUpdate(int n_no) throws SQLException;
	

}
