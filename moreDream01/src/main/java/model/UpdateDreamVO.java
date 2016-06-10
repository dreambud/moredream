package model;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

public class UpdateDreamVO {
	private DreamVO dreamVO;//dreamId(fk)
	private String update_detailDream;
	private String update_orgFilename;
	private String update_newFilename;
	
	private MultipartFile multipartFile;

	
	public UpdateDreamVO() {	} //디폴트 생성자
	
	//전체 생성자
	public UpdateDreamVO(DreamVO dreamVO, String update_detailDream) {
		this.dreamVO = dreamVO;
		this.update_detailDream = update_detailDream;
	}

	public DreamVO getDreamVO() {
		return dreamVO;
	}

	public void setDreamVO(DreamVO dreamVO) {
		this.dreamVO = dreamVO;
	}

	public String getUpdate_detailDream() {
		return update_detailDream;
	}

	public void setUpdate_detailDream(String update_detailDream) {
		this.update_detailDream = update_detailDream;
	}

	public String getUpdate_orgFilename() {
		return update_orgFilename;
	}

	public void setUpdate_orgFilename(String update_orgFilename) {
		this.update_orgFilename = update_orgFilename;
	}

	public String getUpdate_newFilename() {
		return update_newFilename;
	}

	public void setUpdate_newFilename(String update_newFilename) {
		this.update_newFilename = update_newFilename;
	}

	
	public MultipartFile getMultipartFile() {
		return multipartFile;
	}

	public void setMultipartFile(MultipartFile multipartFile) {
		this.multipartFile = multipartFile;
	}

	@Override
	public String toString() {
		return "UpdateDreamVO [dreamVO=" + dreamVO + ", update_detailDream="
				+ update_detailDream + ", update_orgFilename="
				+ update_orgFilename + ", update_newFilename="
				+ update_newFilename + ", multipartFile=" + multipartFile + "]";
	}

	
	

}