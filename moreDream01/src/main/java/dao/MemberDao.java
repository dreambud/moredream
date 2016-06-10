package dao;

import java.util.ArrayList;

import model.MemberVO;

public interface MemberDao {
	int registerMember(MemberVO pmvo);
	boolean	existEmail(String email);
	MemberVO login(MemberVO pmvo);
	int	updateMember(MemberVO pmvo);
	int deleteMember(int memberId);
	ArrayList<MemberVO> getMemberList();
}
