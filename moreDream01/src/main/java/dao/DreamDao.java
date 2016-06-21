package dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.MemberVO;
import model.MyDreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public interface DreamDao {

	//160617
	//추가 :: getAllMyDreamByMemberId
	//memberId로 dream 정보 가져오기
	public List<DreamVO> getAllMyDreamByMemberId(int memberId) throws IOException;

	// 추가 ::getAllMySupportProject
	//memberId로 moredream 현황 보기
	public List<MyDreamVO> getAllMySupportProject(int memberId) throws IOException;

	//160616
	// 해당 꿈에 대한 댓글 갯수 카운트
	public int getCountReplyByDreamId(int dreamId) throws IOException;

	// 해당 꿈에 대한 업데이트 갯수 카운트
	public int getCountUpdateDreamByDreamId(int dreamId) throws IOException;

	// 보상 재고 업데이트
	public int updatePlusStockByRewardId(int rewardId) throws IOException;
	public int updateMinusStockByRewardId(int rewardId) throws IOException;




	//160614
	//추가 :: getPaymentMemberByDreamId
	//해당 꿈에 대한 결제 내역의 rewardId, memberId 가져오기(후원자/댓글 적용시 사용)
	public List<MemberVO> getPaymentMemberByDreamId(int dreamId) throws IOException;

	//추가 :: updateDreamFindByDreamId 업데이트 정보 찾기
	public List<UpdateDreamVO> updateDreamFindByDreamId(int dreamId) throws IOException;

	//추가 :: getMemberByDream 상세보기 할때 꿈을 신청한 사용자 정보 가져오기
	public MemberVO getMemberByDream(int dreamId) throws IOException;

	//추가 :: readComment 리플 드림아이디로 읽기
	public List<ReplyVO> readComment(int dreamId) throws IOException;


	////추가
	public List<DreamVO> getAllListDreamForAdmin()throws IOException;//Admin 신청된 꿈 목록 가져오기

	public int requestDream(DreamVO pvo) throws IOException;//꿈신청
	public int deleteDream(int dreamId) throws IOException; // 꿈삭제

	public int registerReward(RewardVO pvo) throws IOException;//보상등록

	public int confirmRequestDream(Map<String, Object> map) throws IOException;//confirmRequestDream를 Y로 업데이트 

	//160615 추가 :getCountPaymentByDreamId
	public int getCountPaymentByDreamId(int dreamId) throws IOException;//꿈 후원자수 보기


	//////////////////////////SELECT//////////////////////////
	public List<DreamVO> selectByCategory(String category) throws IOException;//카테고리별 조회
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException;//꿈 상세보기
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException;//키워드 검색
	public List<DreamVO> getAllListDream() throws IOException;//꿈 전체 가져오기

	public List<PaymentVO> getPaymentHistoryByMemberId(int memberId) throws IOException;//결제내역 가져오기
	public List<DreamVO> cheerUpList(int memberId) throws IOException;//응원 리스트

	public List<Integer> getMoneyByDreamId(int dreamId) throws IOException;//dreamId로 후원금 확인 
	public List<Integer> getAllMoney() throws IOException;//후원금 전체 가져오기 :: 통계시 사용

	public int cancelPaymentByPaymentId(int paymentId) throws IOException;//응원취소 :: 결제 취소 
	public int payment(PaymentVO pvo) throws IOException; //결제하기(응원하기)

	public List<RewardVO> getRewardByDreamId(int dreamId) throws IOException;//꿈에 대한 보상 가져오기
	public List<DreamVO> requestStateDream(int memberId) throws IOException;//내꿈 신청 현황 보기

	public int updateDream(UpdateDreamVO pvo) throws IOException;//내꿈 수정하기(업데이트 작성)


	public int writeComment(ReplyVO pvo) throws IOException;//댓글 작성
	public int deleteComment(int replyId) throws IOException;//댓글 삭제
	public List<UpdateDreamVO> alarm(int memberId) throws IOException;//알림

	public List<DreamVO> getAllListDreamOrderByMoney() throws IOException;//필터 최고금액 순
	public List<DreamVO> getAllListDreamOrderByManyPeople() throws IOException;//필터 최다 후원자 순
	public List<DreamVO> getAllListDreamOrderByEndDate() throws IOException;//필터 마감 일자순

	public String showNowDate() throws IOException;//현재시간 보기
}
