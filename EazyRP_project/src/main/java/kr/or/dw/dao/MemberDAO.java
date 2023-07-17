package kr.or.dw.dao;

import java.sql.SQLException;

import org.apache.ibatis.annotations.Mapper;

import kr.or.dw.vo.MemberVO;

@Mapper
public interface MemberDAO {

	MemberVO selectMemberById(String id) throws SQLException;

	void insertMember(MemberVO member) throws SQLException;

	String selectErank(int u_no) throws SQLException;

	String selectUserFind(MemberVO member) throws SQLException;

}
