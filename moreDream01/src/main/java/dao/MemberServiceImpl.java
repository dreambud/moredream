package dao;

import java.util.ArrayList;

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
		pmvo.setName("-");
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
		pmvo.setMember_newFilename("-");
		pmvo.setMember_orgFilename("-");
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

}