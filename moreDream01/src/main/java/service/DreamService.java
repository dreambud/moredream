package service;

import java.io.IOException;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.ListVO;
import model.MemberVO;
import model.MyDreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

public interface DreamService {
	
	//160706
	//추가 ::getAllYourSupportProject//memberId로 moredream 현황 보기
	public List<MyDreamVO> getAllYourSupportProject(int memberId) throws IOException;
	
	//160705
	//추가 :: getCountPaymentDreamByMemberId
	public int getCountPaymentDreamByMemberId(int memberId) throws IOException;//memberId로 후원 꿈 수 확인 
	//추가 :: getCountCreateDreamByMemberId
	public int getCountCreateDreamByMemberId(int memberId) throws IOException;//memberId로 진행 꿈 수 확인
	
	//160705
	//추가 :: getSuccessDream
	public int getSuccessDream() throws IOException;
	
	//160704
	//추가 :: getAllDreamCnt
	public int getAllDreamCnt() throws IOException;
	//추가 :: getAllMemberCnt
	public int getAllMemberCnt() throws IOException;
	//추가 :: getTotalMoney
	public String getTotalMoney() throws IOException;
	
	
	
	//160617
		//추가 :: getAllMyDreamByMemberId
		//memberId로 dream 정보 가져오기
		public List<DreamVO> getAllMyDreamByMemberId(int memberId) throws IOException;

		//160706
		// 추가 ::getAllMySupportProject
		//memberId로 moredream 현황 보기
		public ListVO getAllMySupportProject(String pageNo, int memberId) throws IOException;

	//추가 160616
		//꿈에 대한 댓글 갯수 카운트
		public int getCountReplyByDreamId(int dreamId) throws IOException;
		//꿈에 대한 업데이트 갯수 카운트
		public int getCountUpdateDreamByDreamId(int dreamId) throws IOException;

		// 보상 재고 업데이트
		public void updatePlusStockByRewardId(int rewardId) throws IOException;
		public void updateMinusStockByRewardId(int rewardId) throws IOException;
	
	
	
	//수정 160615 :: 이름 오타
	// :: getPaymentMemeberByDreamId 후원자 정보 가져오기
	public List<MemberVO> getPaymentMemberByDreamId(int dreamId) throws IOException;
	// :: updateDreamFindByDreamId 업데이트 정보 찾기
	public List<UpdateDreamVO> updateDreamFindByDreamId(int dreamId) throws IOException;
	// :: getMemberByDream 상세보기 할때 꿈을 신청한 사용자 정보 가져오기
	public MemberVO getMemberByDream(int dreamId) throws IOException;
	//추가 :: readComment 리플 드림아이디로 읽기
	public List<ReplyVO> readComment(int dreamId) throws IOException;

	////추가
	public ListVO getAllListDreamForAdmin(String pageNo)throws IOException;//관리자 신청된 꿈 목록


	public void requestDream(DreamVO vo) throws IOException;//꿈신청
	public void deleteDream(int dreamId) throws IOException; // 꿈삭제

	public void registerReward(RewardVO vo) throws IOException;//보상등록

	public void confirmRequestDream(Map<String, Object> map) throws IOException;//confirmRequestDream를 Y로 업데이트 


	//////////////////////////SELECT//////////////////////////
	public List<DreamVO> selectByCategory(String category) throws IOException;//카테고리별 조회
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException;//꿈 상세보기
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException;//키워드 검색
	//	public List<DreamVO> getAllListDream() throws IOException;//꿈 전체 가져오기

	public List<PaymentVO> getPaymentHistoryByMemberId(int memberId) throws IOException;//결제내역 가져오기
	public List<DreamVO> cheerUpList(int memberId) throws IOException;//응원 리스트
	
	public int getCountPaymentByDreamId(int dreamId) throws IOException;//dreamId로 후원자수 확인 
	public int getMoneyByDreamId(int dreamId) throws IOException;//dreamId로 후원금 확인 
	public int getAllMoney() throws IOException;//후원금 전체 가져오기 :: 통계시 사용

	public void cancelPaymentByPaymentId(int paymentId) throws IOException;//응원취소 :: 결제 취소 
	public int payment(PaymentVO vo) throws IOException; //결제하기(응원하기)

	public List<RewardVO> getRewardByDreamId(int dreamId) throws IOException;//꿈에 대한 보상 가져오기
	public List<DreamVO> requestStateDream(int memberId) throws IOException;//내꿈 신청 현황 보기

	public void updateDream(UpdateDreamVO vo) throws IOException;//내꿈 수정하기(업데이트 작성)



	//댓글 작성, 삭제, 알람받기
	public void writeComment(ReplyVO vo)throws IOException;
	public int deleteCommentByReplyId(int replyId)throws IOException;
	public List<UpdateDreamVO> alarm(int memberId)throws IOException;

	//꿈 리스트 가져오기(필터,전체리스트)
	public List<DreamVO> getListDream(String num) throws IOException;
	
	//160616 추가(카테고리 갯수 가져오기)
	public int getCategoryCountByCategory(String category) throws IOException;
	public List<DreamVO> getListFilterByCategory(List<DreamVO> dreamList,String category);

	//160617 추가(검색시 List 가공처리 메소드)
	public void listDetailInsert(List<DreamVO> rlist) throws IOException;
	//160624 추가 
	public long convert(String stringDate);
	public long showNowDate() throws IOException;//현재시간 보기
	
	//170708 추가(member탈퇴시 꿈 비활성화)
	public void disableDreamByMemberId(int memberId)throws IOException;
}
