package service;

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
	//160620 facebook 연동 로직 추가
	MemberVO facebookLogin(String facebookId);
	void updateFacebookId(MemberVO mvo);
}
