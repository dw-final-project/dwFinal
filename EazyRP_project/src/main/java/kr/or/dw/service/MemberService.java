package kr.or.dw.service;

import java.sql.SQLException;

import javax.servlet.http.HttpSession;

import kr.or.dw.vo.MemberVO;

public interface MemberService {

	MemberVO selectMemberById(String id)throws SQLException;

	void register(MemberVO member) throws SQLException;

	String pwFind(MemberVO member) throws SQLException;

	MemberVO idFind(MemberVO member) throws SQLException;

	String pwRenew(MemberVO member) throws SQLException;


}
