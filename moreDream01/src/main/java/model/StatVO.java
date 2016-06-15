package model;

public class StatVO {
	private int endDay;
	private int totalMoney;
	private int supporterCnt;
	
	public StatVO(){}
	public StatVO(int endDay, int totalMoney, int supporterCnt) {
		this.endDay = endDay;
		this.totalMoney = totalMoney;
		this.supporterCnt = supporterCnt;
	}
	public int getEndDay() {
		return endDay;
	}
	public void setEndDay(int endDay) {
		this.endDay = endDay;
	}
	public int getTotalMoney() {
		return totalMoney;
	}
	public void setTotalMoney(int totalMoney) {
		this.totalMoney = totalMoney;
	}
	public int getSupporterCnt() {
		return supporterCnt;
	}
	public void setSupporterCnt(int supporterCnt) {
		this.supporterCnt = supporterCnt;
	}
	public String getTotalMoneyView(){
		StringBuffer stringBuffer = new StringBuffer(String.valueOf(totalMoney));
		System.out.println(stringBuffer.length());
		for(int i=stringBuffer.length()-3;i>0;i=i-3){
			stringBuffer.insert(i, ',');
		}
		return stringBuffer.toString();
	}
	
}
