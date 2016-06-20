package model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class MemberVO {
	private int memberId;
	private String email;
	private String password;
	private String memberCode;
	private String address;
	private String name;
	private String phoneNumber;
	private String member_newFilename;
	private String member_orgFilename;
	private String facebookId;
	private MultipartFile multipartFile;
	
	public MemberVO() {  }//디폴트 생성자

	//회원가입, 로그인 사용(이메일, 비밀번호)
	public MemberVO(String email, String password) {
		this.email = email;
		this.password = password;
	}

	//전체 생성자 :: 추가정보
	public MemberVO(int memberId, String email, String password,
			String memberCode, String address, String name, String phoneNumber) {
		this.memberId = memberId;
		this.email = email;
		this.password = password;
		this.memberCode = memberCode;
		this.address = address;
		this.name = name;
		this.phoneNumber = phoneNumber;
	}
	
	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getMemberCode() {
		return memberCode;
	}

	public void setMemberCode(String memberCode) {
		this.memberCode = memberCode;
	}

	public String getAddress() {
		return address;
	}

	public void setAddress(String address) {
		this.address = address;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getPhoneNumber() {
		return phoneNumber;
	}

	public void setPhoneNumber(String phoneNumber) {
		this.phoneNumber = phoneNumber;
	}

	public String getMember_newFilename() {
		return member_newFilename;
	}

	public void setMember_newFilename(String member_newFilename) {
		this.member_newFilename = member_newFilename;
	}

	public String getMember_orgFilename() {
		return member_orgFilename;
	}

	public void setMember_orgFilename(String member_orgFilename) {
		this.member_orgFilename = member_orgFilename;
	}

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	@Override
	public String toString() {
		return "MemberVO [memberId=" + memberId + ", email=" + email
				+ ", password=" + password + ", memberCode=" + memberCode
				+ ", address=" + address + ", name=" + name + ", phoneNumber="
				+ phoneNumber + ", member_newFilename=" + member_newFilename
				+ ", member_orgFilename=" + member_orgFilename
				+ ", multipartFile=" + multipartFile + "]";
	}

	public void setFacebookId(String facebookId) {
		this.facebookId = facebookId;
	}
	public String getFacebookId() {
		return facebookId;
	}

	
	
	
}
