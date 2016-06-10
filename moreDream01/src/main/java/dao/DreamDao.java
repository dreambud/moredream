package dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public interface DreamDao {
	
	
	////추가
	public List<DreamVO> getAllListDreamForAdmin()throws IOException;//Admin 신청된 꿈 목록 가져오기
	
	public int requestDream(DreamVO pvo) throws IOException;//꿈신청
	public int deleteDream(int dreamId) throws IOException; // 꿈삭제
	
	public int registerReward(RewardVO pvo) throws IOException;//보상등록
	
	public int confirmRequestDream(Map<String, Object> map) throws IOException;//confirmRequestDream를 Y로 업데이트 
	
	
	//////////////////////////SELECT//////////////////////////
	public List<DreamVO> selectByCategory(String category) throws IOException;//카테고리별 조회
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException;//꿈 상세보기
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException;//키워드 검색
	public List<DreamVO> getAllListDream() throws IOException;//꿈 전체 가져오기
	
	public List<PaymentVO> getPaymentHistoryByMemberId(int memberId) throws IOException;//결제내역 가져오기
	public List<DreamVO> cheerUpList(int memberId) throws IOException;//응원 리스트
	
	public List<Integer> getMoneyByDreamId(int dreamId) throws IOException;//dreamId로 후원금 확인 
	public List<Integer> getAllMoney() throws IOException;//후원금 전체 가져오기 :: 통계시 사용
	
	public int deletePaymentByPaymentId(int paymentId) throws IOException;//응원취소 :: 결제 취소 
	public int payment(PaymentVO pvo) throws IOException; //결제하기(응원하기)
	
	public List<RewardVO> getRewardByDreamId(int dreamId) throws IOException;//꿈에 대한 보상 가져오기
	public List<DreamVO> requestStateDream(int memberId) throws IOException;//내꿈 신청 현황 보기
	
	public int updateDream(UpdateDreamVO pvo) throws IOException;//내꿈 수정하기(업데이트 작성)
	
	
	public int writeComment(ReplyVO pvo) throws IOException;//댓글 작성
	public int deleteComment(int replyId) throws IOException;//댓글 삭제
	public List<UpdateDreamVO> alarm(int memberId) throws IOException;//알림
	
	
	
}
