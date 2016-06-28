package aop.common;




import model.PaymentVO;

import org.aspectj.lang.ProceedingJoinPoint;

import aop.model.PrizeService;

public class PrizeAspect {
	private PrizeService prizeService;
	
	public void setPrizeService(PrizeService prizeService) {
		this.prizeService = prizeService;
	}

	public Object prize(ProceedingJoinPoint pjp) throws Throwable{
		
		Object retObj =	pjp.proceed();//타겟의 메소드가 호출되는 지점.
		Object[] paymentVOs = pjp.getArgs();
		System.out.println(paymentVOs);
		PaymentVO paymentVO = (PaymentVO) paymentVOs[0];
		System.out.println("aop 위빙될때 받아오는 값"+paymentVO);
		retObj = prizeService.bonusMoney(paymentVO);
		
		return retObj;
	}
}
