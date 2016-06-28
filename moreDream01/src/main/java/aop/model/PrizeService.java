package aop.model;

import model.PaymentVO;

public interface PrizeService {
	int bonusMoney(PaymentVO paymentVO)throws Exception;
	
}
