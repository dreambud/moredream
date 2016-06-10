package model;
/*
 * 후원자의 결제 내역
 */
public class PaymentVO {
	private int paymentId;//pk
	private RewardVO rewardVO;//rewardId(fk)
	private int memberId;//결제자(후원자)
	private String paymentState;//Y or N  SQL에서 디폴트로 Y로 지정
	private int money;//금액
	
	
	public PaymentVO() {	} //디폴트 생성자
	
	//전체 생성자
	public PaymentVO(int paymentId, RewardVO rewardVO, int memberId,
			String paymentState, int money) {
		this.paymentId = paymentId;
		this.rewardVO = rewardVO;
		this.memberId = memberId;
		this.paymentState = paymentState;
		this.money = money;
	}
	
	public int getMoney() {
		return money;
	}

	public void setMoney(int money) {
		this.money = money;
	}

	public int getPaymentId() {
		return paymentId;
	}
	public void setPaymentId(int paymentId) {
		this.paymentId = paymentId;
	}
	public RewardVO getRewardVO() {
		return rewardVO;
	}
	public void setRewardVO(RewardVO rewardVO) {
		this.rewardVO = rewardVO;
	}
	public int getMemberId() {
		return memberId;
	}
	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}
	public String getPaymentState() {
		return paymentState;
	}
	public void setPaymentState(String paymentState) {
		this.paymentState = paymentState;
	}

	@Override
	public String toString() {
		return "PaymentVO [paymentId=" + paymentId + ", rewardVO=" + rewardVO
				+ ", memberId=" + memberId + ", paymentState=" + paymentState
				+ ", money=" + money + "]";
	}
	
	
	
}
