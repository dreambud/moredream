package dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public class DreamServiceImpl implements DreamService {

	private DreamDao dreamDao;

	public void setDreamDao(DreamDao dreamDao) {
		this.dreamDao = dreamDao;
	}

	////추가
	@Override
	public List<DreamVO> getAllListDreamForAdmin() throws IOException {
		List<DreamVO> list = dreamDao.getAllListDreamForAdmin();
		return list;
	}
	
	
	
	@Override
	public void requestDream(DreamVO vo) throws IOException {
		dreamDao.requestDream(vo);
	}

	@Override
	public void deleteDream(int dreamId) throws IOException {
		dreamDao.deleteDream(dreamId);
	}

	@Override
	public void registerReward(RewardVO vo) throws IOException {
		dreamDao.registerReward(vo);
	}

	@Override
	public void confirmRequestDream(Map<String, Object> map) throws IOException {
		dreamDao.confirmRequestDream(map);
	}

	@Override
	public List<DreamVO> selectByCategory(String category) throws IOException {
		List<DreamVO> list = dreamDao.selectByCategory(category);
		return list;
	}

	@Override
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException {
		DreamVO vo = dreamDao.getDetailDreamByDreamId(dreamId);
		return vo;
	}

	@Override
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException {
		List<DreamVO> list = dreamDao.selectByKeyWord(keyword);
		return list;
	}

	@Override
	public List<DreamVO> getAllListDream() throws IOException {
		List<DreamVO> list = dreamDao.getAllListDream();
		return list;
	}

	@Override
	public List<PaymentVO> getPaymentHistoryByMemberId(int memberId)
			throws IOException {
		List<PaymentVO> list = dreamDao.getPaymentHistoryByMemberId(memberId);
		return list;
	}

	@Override
	public List<DreamVO> cheerUpList(int memberId) throws IOException {
		List<DreamVO> list = dreamDao.cheerUpList(memberId);
		return list;
	}

	@Override
	public int getMoneyByDreamId(int dreamId) throws IOException {
		List<Integer> list = dreamDao.getMoneyByDreamId(dreamId);
		int sum = 0;
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i);
		}
		return sum;
	}

	@Override
	public int getAllMoney() throws IOException {
		List<Integer> list = dreamDao.getAllMoney();
		int sum = 0;
		for (int i = 0; i < list.size(); i++) {
			sum += list.get(i);
		}
		return sum;
	}

	@Override
	public void deletePaymentByPaymentId(int paymentId) throws IOException {
		dreamDao.deletePaymentByPaymentId(paymentId);
	}

	@Override
	public void payment(PaymentVO vo) throws IOException {
		dreamDao.payment(vo);
	}

	@Override
	public List<RewardVO> getRewardByDreamId(int dreamId) throws IOException {
		List<RewardVO> list = dreamDao.getRewardByDreamId(dreamId);
		return list;
	}

	@Override
	public List<DreamVO> requestStateDream(int memberId) throws IOException {
		List<DreamVO> list = dreamDao.requestStateDream(memberId);
		return list;
	}

	@Override
	public void updateDream(UpdateDreamVO vo) throws IOException {
		dreamDao.updateDream(vo);
	}

	
	
	
	// ///////////////댓글 작성, 알림받기/////////////////////////
	@Override
	public void writeComment(ReplyVO vo) throws IOException {
		dreamDao.writeComment(vo);

	}

	@Override
	public int deleteComment(int memberId) throws IOException {

		return dreamDao.deleteComment(memberId);
	}

	@Override
	public List<UpdateDreamVO> alarm(int memberId) throws IOException {

		return dreamDao.alarm(memberId);
	}
}
