package dao;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.MemberVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.StatVO;
import model.UpdateDreamVO;

public class DreamServiceImpl implements DreamService {

	private DreamDao dreamDao;

	public void setDreamDao(DreamDao dreamDao) {
		this.dreamDao = dreamDao;
	}
	
	
	// 160616
		// 댓글 갯수 가져오기
		@Override
		public int getCountReplyByDreamId(int dreamId) throws IOException {
			int replyCount = dreamDao.getCountReplyByDreamId(dreamId);
			return replyCount;
		}
		// 업데이트 갯수 가져오기
		@Override
		public int getCountUpdateDreamByDreamId(int dreamId) throws IOException {
			int updateDreamCount = dreamDao.getCountUpdateDreamByDreamId(dreamId);
			return updateDreamCount;
		}
		
		
		// 재고 업데이트
			@Override
			public void updatePlusStockByRewardId(int rewardId) throws IOException {
				dreamDao.updatePlusStockByRewardId(rewardId);
			}
			@Override
			public void updateMynusStockByRewardId(int rewardId) throws IOException {
				dreamDao.updateMynusStockByRewardId(rewardId);
			}
			
			

	// 추가 160614/////////////////////////////////////////////////////////////
	//후원자 정보 가져오기
		//수정 160615
			@Override
			public List<MemberVO> getPaymentMemberByDreamId(int dreamId) throws IOException {
				List<MemberVO> memberList = dreamDao.getPaymentMemberByDreamId(dreamId);
				
				return memberList;
			}
	
	@Override
	public List<UpdateDreamVO> updateDreamFindByDreamId(int dreamId)
			throws IOException {
		return dreamDao.updateDreamFindByDreamId(dreamId);
	}
	@Override
	public MemberVO getMemberByDream(int dreamId) throws IOException {
		MemberVO vo = dreamDao.getMemberByDream(dreamId);
		return vo;
	}
	@Override
	public List<ReplyVO> readComment(int dreamId) throws IOException {
		return dreamDao.readComment(dreamId);
	}
	//////////////////////////////////////////////////////////////////////////

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
		
		StatVO statVO = new StatVO(0, getMoneyByDreamId(dreamId), getCountPaymentByDreamId(dreamId));
		long nowTime = convert(dreamDao.showNowDate());
		long endTime = convert(vo.getEndDate());
		int endDay = (int)((endTime-nowTime)/(60*60*24*1000));
		statVO.setEndDay(endDay);
		vo.setStatVO(statVO);
		return vo;
	}

	@Override
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException {
		List<DreamVO> list = dreamDao.selectByKeyWord(keyword);
		return list;
	}

	public List<DreamVO> getListDream(String num) throws IOException {
		List<DreamVO> rlist =new ArrayList<DreamVO>();
		if(num.equals("1")){//새로운 꿈(최근순)
			rlist = dreamDao.getAllListDream();
		}else if(num.equals("2")){//마감임박
			

			rlist=dreamDao.getAllListDreamOrderByEndDate();

		}else if(num.equals("3")){//최다 후원
			rlist = dreamDao.getAllListDreamOrderByManyPeople();
			List<DreamVO> rlist2 = dreamDao.getAllListDream();
			List<DreamVO> tempList = new ArrayList<DreamVO>();
			//결재 내역이 없는 꿈을 추가함
			for(int i=0;i<rlist2.size();i++){
				for(int j=0;j<rlist.size();j++){
					if(rlist.get(j).getDreamId()==rlist2.get(i).getDreamId()){
						System.out.println(rlist.get(j).getDreamId());
						break;
					}
					System.out.println("j: "+j);
					System.out.println("rlist.size "+rlist.size());
					if(j==rlist.size()-1){//끝까지 돈 결과 결재 내역이 없는 dreamvo라면
						tempList.add(rlist2.get(i));//임시공간에 덧붙힐 dreamvo 추가
					}
				}
			}
			System.out.println("임시 List에 담긴 정보 : "+tempList.size());
			for(DreamVO dvo : tempList){//임시 공간에 있는 list 덧붙히기
				rlist.add(dvo);
			}
		}else if(num.equals("4")){//최고 후원
			rlist= dreamDao.getAllListDreamOrderByMoney();
			//결재 내역이 없는 꿈을 추가함
			List<DreamVO> rlist2 = dreamDao.getAllListDream();
			List<DreamVO> tempList = new ArrayList<DreamVO>();
			for(int i=0;i<rlist2.size();i++){
				for(int j=0;j<rlist.size();j++){
					if(rlist.get(j).getDreamId()==rlist2.get(i).getDreamId()){
						System.out.println(rlist.get(j).getDreamId());
						break;
					}
					System.out.println("j: "+j);
					System.out.println("rlist.size "+rlist.size());
					if(j==rlist.size()-1){//끝까지 돈 결과 결재 내역이 없는 dreamvo라면
						tempList.add(rlist2.get(i));//임시공간에 덧붙힐 dreamvo 추가
					}
				}
			}
		}
		
		//현재시간 구하기
		long nowTime = convert(dreamDao.showNowDate());
		
		// 추가 :: 160615 꿈 리스트에 후원자수,후원금액,남은기간를 담는 VO 추가
		for(DreamVO dvo : rlist){
			int dreamId = dvo.getDreamId();
			StatVO statVO = new StatVO();
			statVO.setSupporterCnt(this.getCountPaymentByDreamId(dreamId));	//해당 꿈 후원자수 받아와서 setter주입
			statVO.setTotalMoney(this.getMoneyByDreamId(dreamId));//해당꿈 모인금액 받아와서 setter주입
			
			long endTime = convert(dvo.getEndDate());
			int endDay = (int)((endTime-nowTime)/(60*60*24*1000));
			statVO.setEndDay(endDay);
			dvo.setStatVO(statVO);
		}
		return rlist;
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
		int totalMoney =  0;
		List<Integer> list = dreamDao.getMoneyByDreamId(dreamId);
		for (int i = 0; i < list.size(); i++) {
			totalMoney += list.get(i);
		}
		return totalMoney;
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

	@Override
	public int getCountPaymentByDreamId(int dreamId) throws IOException {
		return dreamDao.getCountPaymentByDreamId(dreamId);
	}
	
	public long convert(String stringDate){
		int year = Integer.parseInt(stringDate.substring(0, 4));
		int month = Integer.parseInt(stringDate.substring(5, 7));
		int day = Integer.parseInt(stringDate.substring(8, 10));
		Date date = new Date(year,month,day);
		long time = date.getTime();
		return time;
	}
}
