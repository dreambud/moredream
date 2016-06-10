package model;

public class RewardVO {
	private int rewardId;//pk
	private DreamVO dreamVO;//dreamId(fk)
	private String rewardInfo;
	private int rewardGuide;
	private int stock;//보상 재고
	
	
	public RewardVO() { }//디폴트 생성자
	
	//전체 생성자
	public RewardVO(int rewardId, DreamVO dreamVO, String rewardInfo,
			int rewardGuide, int stock) {
		this.rewardId = rewardId;
		this.dreamVO = dreamVO;
		this.rewardInfo = rewardInfo;
		this.rewardGuide = rewardGuide;
		this.stock = stock;
	}
	
	public int getStock() {
		return stock;
	}
	public void setStock(int stock) {
		this.stock = stock;
	}
	public int getRewardId() {
		return rewardId;
	}
	public void setRewardId(int rewardId) {
		this.rewardId = rewardId;
	}
	public DreamVO getDreamVO() {
		return dreamVO;
	}
	public void setDreamVO(DreamVO dreamVO) {
		this.dreamVO = dreamVO;
	}
	public String getRewardInfo() {
		return rewardInfo;
	}
	public void setRewardInfo(String rewardInfo) {
		this.rewardInfo = rewardInfo;
	}
	public int getRewardGuide() {
		return rewardGuide;
	}
	public void setRewardGuide(int rewardGuide) {
		this.rewardGuide = rewardGuide;
	}

	@Override
	public String toString() {
		return "RewardVO [rewardId=" + rewardId + ", dreamVO=" + dreamVO
				+ ", rewardInfo=" + rewardInfo + ", rewardGuide=" + rewardGuide
				+ ", stock=" + stock + "]";
	}
	
	
	
}
