package dao;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public interface DreamService {
	
	////추가
	public List<DreamVO> getAllListDreamForAdmin()throws IOException;//관리자 신청된 꿈 목록
	
	
	public void requestDream(DreamVO vo) throws IOException;//꿈신청
	public void deleteDream(int dreamId) throws IOException; // 꿈삭제

	public void registerReward(RewardVO vo) throws IOException;//보상등록

	public void confirmRequestDream(Map<String, Object> map) throws IOException;//confirmRequestDream를 Y로 업데이트 


	//////////////////////////SELECT//////////////////////////
	public List<DreamVO> selectByCategory(String category) throws IOException;//카테고리별 조회
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException;//꿈 상세보기
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException;//키워드 검색
	public List<DreamVO> getAllListDream() throws IOException;//꿈 전체 가져오기

	public List<PaymentVO> getPaymentHistoryByMemberId(int memberId) throws IOException;//결제내역 가져오기
	public List<DreamVO> cheerUpList(int memberId) throws IOException;//응원 리스트

	public int getMoneyByDreamId(int dreamId) throws IOException;//dreamId로 후원금 확인 
	public int getAllMoney() throws IOException;//후원금 전체 가져오기 :: 통계시 사용

	public void deletePaymentByPaymentId(int paymentId) throws IOException;//응원취소 :: 결제 취소 
	public void payment(PaymentVO vo) throws IOException; //결제하기(응원하기)

	public List<RewardVO> getRewardByDreamId(int dreamId) throws IOException;//꿈에 대한 보상 가져오기
	public List<DreamVO> requestStateDream(int memberId) throws IOException;//내꿈 신청 현황 보기

	public void updateDream(UpdateDreamVO vo) throws IOException;//내꿈 수정하기(업데이트 작성)
	
	
	
	//댓글 작성, 삭제, 알람받기
	   public void writeComment(ReplyVO vo)throws IOException;
	   public int deleteComment(int memberId)throws IOException;
	   public List<UpdateDreamVO> alarm(int memberId)throws IOException;
}