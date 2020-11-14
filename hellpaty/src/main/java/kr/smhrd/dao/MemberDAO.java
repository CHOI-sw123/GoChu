package kr.smhrd.dao;

import javax.servlet.http.HttpSession;

import kr.smhrd.vo.MemberVO;

public interface MemberDAO {
	public int Id_Check(MemberVO m);
	public int Register(MemberVO m);
	public int Login(MemberVO m, HttpSession Hsession);
}
