package service;

import java.io.File;
import java.util.ArrayList;

import dao.MemberDao;
import model.MemberVO;

public class MemberServiceImpl implements MemberService {

	private MemberDao memberDao;
	
	public void setMemberDao(MemberDao memberDao) {
		this.memberDao = memberDao;
	}

	@Override
	public void registerMember(MemberVO pmvo) {
		
		pmvo.setAddress("-");
		pmvo.setMember_newFilename("-");
		pmvo.setMember_orgFilename("-");
		pmvo.setMemberCode("U");
		pmvo.setMemberId(0);
		pmvo.setPhoneNumber("-");
		memberDao.registerMember(pmvo);
		
	}

	@Override
	public boolean existEmail(String email) {
		return memberDao.existEmail(email);
	}

	@Override
	public MemberVO login(MemberVO pmvo) {
		return memberDao.login(pmvo);
	}

	@Override
	public void updateMember(MemberVO pmvo) {
		if(pmvo.getMember_newFilename()==null||pmvo.getMember_newFilename()=="-")
		{
		pmvo.setMember_newFilename("-");
		pmvo.setMember_orgFilename("-");
		}
		pmvo.setMemberCode("U");
		memberDao.updateMember(pmvo);
		
	}

	@Override
	public void deleteMember(int memberId) {
		memberDao.deleteMember(memberId);
		
	}

	@Override
	public ArrayList<MemberVO> getMemberList() {
		return memberDao.getMemberList();
	}

	@Override
	public void deleteFileMember(String member_newFilename1,String member_newFilename2) {
		File f = new File(member_newFilename1);
		f.delete();// 이게 안돼. 
		memberDao.deleteFileMember(member_newFilename2);
	}
	//160620 facebook 연동 로직 추가
	@Override
	public MemberVO facebookLogin(String facebookId) {
		return memberDao.facebookLogin(facebookId);
	}
	@Override
	public void updateFacebookId(MemberVO mvo) {
		memberDao.updateFacebookId(mvo);
	}
}
