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
		String PW = memberDAO.selectPWFind(member);
		
		return PW;
	}

	@Override
	public MemberVO idFind(MemberVO member) throws SQLException {
		MemberVO mem = memberDAO.selectIDFind(member);
		return mem;
	}

	@Override
	public void pwRenew(String pwd, String id) throws SQLException {
		 memberDAO.updatePwd(pwd, id);
	}

	@Override
	public String modProfile(MemberVO member) throws SQLException {
		String mod = memberDAO.modProfile(member);
		return mod;
	}

	@Override
	public void repwd(String pwd) throws SQLException {
		 memberDAO.updateRepwd(pwd);
		 System.out.println("서비스 임플");
		
	}

	@Override
	public void delete(String id) throws SQLException {
		memberDAO.deleteUser(id);
		
	}



}