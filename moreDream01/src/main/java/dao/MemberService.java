package dao;

import java.util.ArrayList;

import model.MemberVO;

public interface MemberService {
	void registerMember(MemberVO pmvo);
	boolean	existEmail(String email);
	MemberVO login(MemberVO pmvo);
	void updateMember(MemberVO pmvo);
	void deleteMember(int memberId);
	ArrayList<MemberVO> getMemberList();
	void deleteFileMember(String member_newFilename1, String member_newFilename2);
}
