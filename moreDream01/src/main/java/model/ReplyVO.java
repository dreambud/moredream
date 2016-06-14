package model;
/*
 * 드리머와 드림 메이커
 * 댓글 달기
 */
import java.util.Date;

public class ReplyVO {
	private int replyId;
	private DreamVO dreamVO;//dreamId(fk)
	private MemberVO memberVO;//댓글 작성자
	private String content;
	//20160614 date type >> String type
	private String writeDate;
	
	
	public ReplyVO() {	}//디폴트 생성자
	
	//전체 생성자
	public ReplyVO(int replyId, DreamVO dreamVO, MemberVO memberVO, String content, String writeDate) {
		this.replyId = replyId;
		this.dreamVO = dreamVO;
		this.memberVO = memberVO;
		this.content = content;
		this.writeDate = writeDate;
	}

	
	public int getReplyId() {
		return replyId;
	}

	public void setReplyId(int replyId) {
		this.replyId = replyId;
	}

	public DreamVO getDreamVO() {
		return dreamVO;
	}
	public void setDreamVO(DreamVO dreamVO) {
		this.dreamVO = dreamVO;
	}
	public MemberVO getMemberVO() {
		return memberVO;
	}
	public void setMemberVO(MemberVO memberVO) {
		this.memberVO = memberVO;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWriteDate() {
		return writeDate;
	}
	public void setWriteDate(String writeDate) {
		this.writeDate = writeDate;
	}

	@Override
	public String toString() {
		return "ReplyVO [replyId=" + replyId + ", dreamVO=" + dreamVO
				+ ", memberVO=" + memberVO + ", content=" + content
				+ ", writeDate=" + writeDate + "]";
	}
	
	
	
}
