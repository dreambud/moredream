package dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;

import model.DreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public class DreamDaoImpl implements DreamDao {
	
	private SqlSession sqlSession;
	
	public void setSqlSession(SqlSession sqlSession) {
		this.sqlSession = sqlSession;
	}
	
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
	public int deletePaymentByPaymentId(int paymentId) throws IOException {
		int result = sqlSession.delete("dreamSql.deletePaymentByPaymentId", paymentId);
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
	

}
