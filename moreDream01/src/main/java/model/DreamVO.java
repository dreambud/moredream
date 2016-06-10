package model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class DreamVO {
	private int dreamId;//pk
	private MemberVO memberVO;//memberId(FK)
	private String category;//분야 추가
	private String dream_orgFilename;
	private String dream_newFilename;
	private String confirmRequestDream; // sql에서 N으로 기본값 지정
	private String titleDream;//추가
	private String detailDream;
	private String requestDate;
	private int targetFund;
	private String startDate;
	private String endDate;

	private MultipartFile multipartFile;

	
	public DreamVO() {	}//디폴트 생성자

	//전체 생성자
	public DreamVO(int dreamId, MemberVO memberVO, String category, String confirmRequestDream, 
			String titleDream, String detailDream, String requestDate, int targetFund, 
			String startDate, String endDate) {
		this.dreamId = dreamId;
		this.memberVO = memberVO;
		this.category = category;
		this.confirmRequestDream = confirmRequestDream;
		this.titleDream = titleDream;
		this.detailDream = detailDream;
		this.requestDate = requestDate;
		this.targetFund = targetFund;
		this.startDate = startDate;
		this.endDate = endDate;
	}
	
	public String getCategory() {
		return category;
	}

	public void setCategory(String category) {
		this.category = category;
	}

	public String getTitleDream() {
		return titleDream;
	}

	public void setTitleDream(String titleDream) {
		this.titleDream = titleDream;
	}

	public int getDreamId() {
		return dreamId;
	}

	public void setDreamId(int dreamId) {
		this.dreamId = dreamId;
	}

	public MemberVO getMemberVO() {
		return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}

	public String getDream_orgFilename() {
		return dream_orgFilename;
	}

	public void setDream_orgFilename(String dream_orgFilename) {
		this.dream_orgFilename = dream_orgFilename;
	}

	public String getDream_newFilename() {
		return dream_newFilename;
	}

	public void setDream_newFilename(String dream_newFilename) {
		this.dream_newFilename = dream_newFilename;
	}

	public String getConfirmRequestDream() {
		return confirmRequestDream;
	}

	public void setConfirmRequestDream(String confirmRequestDream) {
		this.confirmRequestDream = confirmRequestDream;
	}

	public String getDetailDream() {
		return detailDream;
	}

	public void setDetailDream(String detailDream) {
		this.detailDream = detailDream;
	}

	public String getRequestDate() {
		return requestDate;
	}

	public void setRequestDate(String requestDate) {
		this.requestDate = requestDate;
	}

	public int getTargetFund() {
		return targetFund;
	}

	public void setTargetFund(int targetFund) {
		this.targetFund = targetFund;
	}

	public String getStartDate() {
		return startDate;
	}

	public void setStartDate(String startDate) {
		this.startDate = startDate;
	}

	public String getEndDate() {
		return endDate;
	}

	public void setEndDate(String endDate) {
		this.endDate = endDate;
	}

	

	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	@Override
	public String toString() {
		return "DreamVO [dreamId=" + dreamId + ", memberVO=" + memberVO
				+ ", category=" + category + ", dream_orgFilename="
				+ dream_orgFilename + ", dream_newFilename="
				+ dream_newFilename + ", confirmRequestDream="
				+ confirmRequestDream + ", titleDream=" + titleDream
				+ ", detailDream=" + detailDream + ", requestDate="
				+ requestDate + ", targetFund=" + targetFund + ", startDate="
				+ startDate + ", endDate=" + endDate + ", multipartFile="
				+ multipartFile + "]";
	}

	

	

	

	
	
	
}
