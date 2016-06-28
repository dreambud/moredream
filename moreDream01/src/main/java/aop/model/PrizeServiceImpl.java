package aop.model;

import model.PaymentVO;


public class PrizeServiceImpl implements PrizeService {
	
	private PrizeDao prizeDao;
	

	public void setPrizeDao(PrizeDao prizeDao) {
	
		this.prizeDao = prizeDao;
	}



	@Override
	public int bonusMoney(PaymentVO paymentVO) throws Exception {
		
		int num = (int) (Math.random()*2)+1;
		int money = 0;
		int bonus = 0;
		if(num==1){
		paymentVO = 
		prizeDao.findPaymentVOByPaymentId(paymentVO.getPaymentId());
		money = paymentVO.getMoney()*2;
		paymentVO.setMoney(money);
		bonus = prizeDao.setBonusMoneyByPaymentId(paymentVO);
		System.out.println("축 당첨(당첨확률 50%).~~! 후원금 두배 적용!!");
		}

		return bonus;
	}

}
