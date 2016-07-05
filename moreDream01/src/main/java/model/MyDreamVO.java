package model;

public class MyDreamVO {
	private DreamVO dreamVO;
	private RewardVO rewardVO;
	private PaymentVO paymentVO;
	//160705 추가
	private MemberVO memberVO;

	
	public MyDreamVO() {
		super();
	}

	public MyDreamVO(DreamVO dreamVO, RewardVO rewardVO, PaymentVO paymentVO) {
		super();
		this.dreamVO = dreamVO;
		this.rewardVO = rewardVO;
		this.paymentVO = paymentVO;
	}

	public DreamVO getDreamVO() {
		return dreamVO;
	}

	public void setDreamVO(DreamVO dreamVO) {
		this.dreamVO = dreamVO;
	}

	public RewardVO getRewardVO() {
		return rewardVO;
	}

	public void setRewardVO(RewardVO rewardVO) {
		this.rewardVO = rewardVO;
	}

	public PaymentVO getPaymentVO() {
		return paymentVO;
	}

	public void setPaymentVO(PaymentVO paymentVO) {
		this.paymentVO = paymentVO;
	}
	//160705
	public MemberVO getMemberVO() {
	    return memberVO;
	}

	public void setMemberVO(MemberVO memberVO) {
	    this.memberVO = memberVO;
	}


	@Override
	public String toString() {
		return "MyDreamVO [dreamVO=" + dreamVO + ", rewardVO=" + rewardVO
				+ ", paymentVO=" + paymentVO + "]";
	}
	
	
	
}
