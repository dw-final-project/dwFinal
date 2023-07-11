package kr.or.dw.service;

import java.sql.SQLException;

import kr.or.dw.vo.MemberVO;

public interface MemberService {

	MemberVO selectMemberById(String id)throws SQLException;



}
