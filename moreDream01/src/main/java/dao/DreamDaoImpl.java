package dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.DreamVO;
import model.MemberVO;
import model.MyDreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public class DreamDaoImpl implements DreamDao {

	private SqlSession sqlSession;

	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}

	//160617
	//추가 :: getAllMyDreamByMemberId
	//memberId로 dream 정보 가져오기

	@Override
	public List<DreamVO> getAllMyDreamByMemberId(int memberId)
			throws IOException {

		return sqlSession.selectList("dreamSql.getAllMyDreamByMemberId", memberId);
	}

	// 추가 ::getAllMySupportProject
	//memberId로 moredream 현황 보기
	@Override
	public List<MyDreamVO> getAllMySupportProject(int memberId)
			throws IOException {

		return sqlSession.selectList("dreamSql.getAllMySupportProject", memberId);
	}

	//160616
	// 꿈에 대한 댓글 카운트
	@Override
	public int getCountReplyByDreamId(int dreamId) throws IOException {
		int replyCount = sqlSession.selectOne("dreamSql.getCountReplyByDreamId", dreamId);
		return replyCount;
	}

	//꿈에 대한 업데이트 카운트
	@Override
	public int getCountUpdateDreamByDreamId(int dreamId) throws IOException {
		int updateDreamCount = sqlSession.selectOne("dreamSql.getCountUpdateDreamByDreamId", dreamId);
		return updateDreamCount;
	}


	// 재고 업데이트
	@Override
	public int updatePlusStockByRewardId(int rewardId) throws IOException {
		int result = sqlSession.update("dreamSql.updatePlusStockByRewardId", rewardId);
		return result;
	}
	@Override
	public int updateMinusStockByRewardId(int rewardId) throws IOException {
		int result = sqlSession.update("dreamSql.updateMinusStockByRewardId", rewardId);
		return result;
	}


	// 추가 160614//////////////////////////
	//수정160615 후원자 가져오기
	@Override
	public List<MemberVO> getPaymentMemberByDreamId(int dreamId) throws IOException {
		List<MemberVO> list = sqlSession.selectList("dreamSql.getPaymentMemberByDreamId", dreamId);

		return list;
	}

	@Override
	public List<UpdateDreamVO> updateDreamFindByDreamId(int dreamId)
			throws IOException {

		List<UpdateDreamVO> list = sqlSession.selectList("dreamSql.updateDreamFindByDreamId",dreamId);
		return list;
	}
	@Override
	public MemberVO getMemberByDream(int dreamId) throws IOException {
		MemberVO vo = sqlSession.selectOne("dreamSql.getMemberByDream", dreamId);
		return vo;
	}
	@Override
	public List<ReplyVO> readComment(int dreamId) throws IOException {
		List<ReplyVO> list = sqlSession.selectList("dreamSql.readComment", dreamId);
		return list;
	}
	////////////////////////////////////////////////////////////////////////////////////////////

	/////추가
	@Override
	public List<DreamVO> getAllListDreamForAdmin() throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.getAllListDreamForAdmin");
		return list;
	}



	@Override
	//꿈신청
	public int requestDream(DreamVO pvo) throws IOException {
		int result = sqlSession.insert("dreamSql.requestDream", pvo);
		return result;
	}

	@Override
	// 꿈삭제
	public int deleteDream(int dreamId) throws IOException {
		int result = sqlSession.delete("dreamSql.deleteDream", dreamId);
		return result;
	}

	@Override
	//보상등록
	public int registerReward(RewardVO pvo) throws IOException {
		int result = sqlSession.insert("dreamSql.registerReward", pvo);
		return result;
	}

	@Override
	//confirmRequestDream를 Y로 업데이트
	public int confirmRequestDream(Map<String, Object> map) throws IOException {
		int result = sqlSession.update("dreamSql.confirmRequestDream", map);
		return result;
	}

	@Override
	//카테고리별 조회
	public List<DreamVO> selectByCategory(String category) throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.selectByCategory", category);
		return list;
	}

	@Override
	//꿈 상세보기
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException {
		DreamVO vo = sqlSession.selectOne("dreamSql.getDetailDreamByDreamId", dreamId);
		return vo;
	}

	@Override
	//키워드 검색
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.selectByKeyWord", keyword);
		return list;
	}

	@Override
	//꿈 전체 가져오기
	public List<DreamVO> getAllListDream() throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.getAllListDream");
		return list;
	}

	@Override
	//결제내역 가져오기
	public List<PaymentVO> getPaymentHistoryByMemberId(int memberId)
			throws IOException {
		List<PaymentVO> list = sqlSession.selectList("dreamSql.getPaymentHistoryByMemberId", memberId);
		return list;
	}

	@Override
	//응원 리스트
	public List<DreamVO> cheerUpList(int memberId) throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.cheerUpList", memberId);
		return list;
	}

	@Override
	//dreamId로 후원금 확인 
	public List<Integer> getMoneyByDreamId(int dreamId) throws IOException {
		List<Integer> list = sqlSession.selectList("dreamSql.getMoneyByDreamId",dreamId);
		return list;
	}

	@Override
	//후원금 전체 가져오기 :: 통계시 사용
	public List<Integer> getAllMoney() throws IOException {
		List<Integer> list = sqlSession.selectList("dreamSql.getAllMoney");
		return list;
	}

	@Override
	//응원취소 :: 결제 취소 
	public int cancelPaymentByPaymentId(int paymentId) throws IOException {
		int result = sqlSession.delete("dreamSql.cancelPaymentByPaymentId", paymentId);
		return result;
	}

	@Override
	//결제하기(응원하기)
	public int payment(PaymentVO pvo) throws IOException {
		int result = sqlSession.insert("dreamSql.payment", pvo);
		return result;
	}

	@Override
	//꿈에 대한 보상 가져오기
	public List<RewardVO> getRewardByDreamId(int dreamId) throws IOException {
		List<RewardVO> list = sqlSession.selectList("dreamSql.getRewardByDreamId", dreamId);
		return list;
	}

	@Override
	//내꿈 신청 현황 보기
	public List<DreamVO> requestStateDream(int memberId) throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.requestStateDream", memberId);
		return list;
	}

	@Override
	//내꿈 수정하기(업데이트 작성)
	public int updateDream(UpdateDreamVO pvo) throws IOException {
		int result = sqlSession.update("dreamSql.updateDream", pvo);
		return result;
	}

	@Override
	public int writeComment(ReplyVO pvo) throws IOException {
		int result = sqlSession.insert("dreamSql.writeComment", pvo);
		return result;
	}
	@Override
	public int deleteComment(int memberId) throws IOException {
		int result = sqlSession.delete("dreamSql.deleteComment", memberId);
		return result;
	}
	@Override
	public List<UpdateDreamVO> alarm(int memberId) throws IOException {
		List<UpdateDreamVO> list = sqlSession.selectList("dreamSql.alarm", memberId);
		return list;
	}

	//필터 : 최다 후원금 기준
	@Override
	public List<DreamVO> getAllListDreamOrderByMoney() throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.getAllListDreamOrderByMoney");
		return list;
	}
	//필터 : 최다 후원자 기준
	@Override
	public List<DreamVO> getAllListDreamOrderByManyPeople() throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.getAllListDreamOrderByManyPeople");
		return list;
	}
	//시간 가져오기
	@Override
	public String showNowDate() throws IOException {
		String date = sqlSession.selectOne("dreamSql.showNowDate");
		return date;
	}
	//필터 : 마감일자 기준
	@Override
	public List<DreamVO> getAllListDreamOrderByEndDate() throws IOException {
		List<DreamVO> list = sqlSession.selectList("dreamSql.getAllListDreamOrderByEndDate");
		return list;
	}

	//추가 160615 
	//꿈 후원자 수 보기
	@Override
	public int getCountPaymentByDreamId(int dreamId) throws IOException {
		int count = sqlSession.selectOne("dreamSql.getCountPaymentByDreamId",dreamId);
		return count;
	}


}
