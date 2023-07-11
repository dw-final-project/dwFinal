package kr.or.dw.service;

import java.sql.SQLException;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.dao.MyMenuDAO;
import kr.or.dw.vo.CompanyVO;
import kr.or.dw.vo.EmpVO;
import kr.or.dw.vo.NoteVO;

@Service
public class MyMenuServiceImpl implements MyMenuService{
	
	@Autowired
	public MyMenuDAO mymenuDAO;

	@Override
	public List<EmpVO> getEmpList() throws SQLException {
		List<EmpVO> emp = null;
		emp = mymenuDAO.getEmpList();
		
		return emp;
	}

	@Override
	public List<EmpVO> getSelectEmpList(String name) throws SQLException {
		List<EmpVO> emp = null;
		emp = mymenuDAO.getSelectEmpList(name);
		
		return emp;
	}

	@Override
	public List<EmpVO> getSelectEmpListCno(String c_name) throws SQLException {
		List<EmpVO> emp = null;
		emp = mymenuDAO.getSelectEmpListCno(c_name);
		
		return emp;
	}

	@Override
	public List<EmpVO> getEmp(Map<String, String> map) throws SQLException {
		List<EmpVO> emp = null;
		emp = mymenuDAO.getEmp(map);
		
		return emp;
	}

	@Override
	public EmpVO selectEmp(int emp_no) throws SQLException {
		EmpVO emp = null;
		emp = mymenuDAO.selectEmp(emp_no);
		
		return emp;
	}

	@Override
	public void sendNote(NoteVO noteVo) throws SQLException {
		mymenuDAO.sendNote(noteVo);
	}

	@Override
	public List<NoteVO> getNoteList() throws SQLException {
		List<NoteVO> note = mymenuDAO.getNoteList();
		return note;
	}

	@Override
	public NoteVO selectNote(int n_no) throws SQLException {
		NoteVO note = mymenuDAO.selectNote(n_no);
		mymenuDAO.readableUpdate(n_no);
		return note;
	}

	@Override
	public void deleteNote(int n_no) throws SQLException {
		mymenuDAO.deleteNote(n_no);
	}
	
}
