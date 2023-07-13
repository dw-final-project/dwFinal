package kr.or.dw.service;

import java.sql.SQLException;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.RowBounds;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.or.dw.command.PageMaker;
import kr.or.dw.command.SearchCriteria;
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
	public Map<String, Object> getNoteList(SearchCriteria cri) throws SQLException {
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		
		List<NoteVO> note = mymenuDAO.getNoteList(cri, rowBounds);
		
		int totalCount = mymenuDAO.selectSearchNoteListCount(cri);
		System.out.println(totalCount);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		Map<String, Object> dataMap = new HashMap<String, Object>();
		dataMap.put("note", note);
		dataMap.put("pageMaker", pageMaker);
		return dataMap;
	}

	@Override
	public NoteVO selectNote(int n_no, String send) throws SQLException {
		NoteVO note = mymenuDAO.selectNote(n_no);
		if(send == "N") {
			mymenuDAO.readableUpdate(n_no);
		}
		return note;
	}

	@Override
	public void deleteNote(int n_no) throws SQLException {
		mymenuDAO.deleteNote(n_no);
	}

	@Override
	public List<NoteVO> searchNote(Map<String, String> valMap) throws SQLException {
		List<NoteVO> note = mymenuDAO.searchNote(valMap);
		
		return note;
	}

	@Override
	public Map<String, Object> getSendNoteList(int emp_no, SearchCriteria cri) throws SQLException {
		Map<String, Object> dataMap = new HashMap<String, Object>();
		
		int offset = cri.getPageStartRowNum();
		int limit = cri.getPerPageNum();
		RowBounds rowBounds = new RowBounds(offset, limit);
		
		int totalCount = mymenuDAO.selectSearchNoteListCount(cri);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(totalCount);
		
		
		List<NoteVO> note = mymenuDAO.getSendNoteList(emp_no);
		
		dataMap.put("note", note);
		dataMap.put("pageMaker", pageMaker);
		
		return dataMap;
	}

}
