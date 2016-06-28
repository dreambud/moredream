/**
 * 
 */
package aop.model;

import java.util.List;

import model.PaymentVO;


public interface PrizeDao {

	PaymentVO findPaymentVOByPaymentId(int paymentId)throws Exception;
	int setBonusMoneyByPaymentId(PaymentVO paymentVO)throws Exception;

	
	
}
