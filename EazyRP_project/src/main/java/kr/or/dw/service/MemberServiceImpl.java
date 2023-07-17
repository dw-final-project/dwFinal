package kr.or.dw.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;

import kr.or.dw.dao.MemberDAO;
import kr.or.dw.vo.MemberVO;

public class MemberServiceImpl implements MemberService{

	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public MemberVO selectMemberById(String id) throws SQLException {
		MemberVO member = memberDAO.selectMemberById(id);
		return member;
	}

	@Override
	public void register(MemberVO member) throws SQLException {
		memberDAO.insertMember(member);
	}

	@Override
	public String pwFind(MemberVO member) throws SQLException {
		String PW = memberDAO.selectUserFind(member);
		
		return PW;
	}



}