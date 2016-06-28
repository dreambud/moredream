package aop.model;

import model.PaymentVO;
import model.RewardVO;

import org.mybatis.spring.SqlSessionTemplate;

public class PrizeDaoImpl implements PrizeDao{
	private SqlSessionTemplate sqlSession;
	
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		System.out.println("::"+getClass().getName()+".setSqlSession() call..");
		this.sqlSession = sqlSession;
	}

	@Override
	public PaymentVO findPaymentVOByPaymentId(int paymentId) throws Exception {
	
		return sqlSession.selectOne("prizeSql.findPaymentVOByPaymentId", paymentId);
	}

	@Override
	public int setBonusMoneyByPaymentId(PaymentVO paymentVO) throws Exception {
		
		return sqlSession.update("prizeSql.setBonusMoneyByPaymentId", paymentVO);
	}

	
}
