package service;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import model.DreamVO;
import model.ListVO;
import model.MemberVO;
import model.MyDreamVO;
import model.PagingBean;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.StatVO;
import model.UpdateDreamVO;
import dao.DreamDao;

public class DreamServiceImpl implements DreamService {

	private DreamDao dreamDao;

	public void setDreamDao(DreamDao dreamDao) {
		this.dreamDao = dreamDao;
	}
	

	// 160707 수정
	// 추가 ::getAllYourSupportProject//memberId로 moredream 현황 보기
	@Override
	public List<MyDreamVO> getAllYourSupportProject(int memberId)
			throws IOException {
		List<MyDreamVO> list = dreamDao.getAllYourSupportProject(memberId);
		System.out.println("list :: " + list);
		long nowTime = convert(dreamDao.showNowDate());
		List<MyDreamVO> rlist = new ArrayList<MyDreamVO>();
		for (MyDreamVO mdvo : list) {
			StatVO statVO = new StatVO();
			int totalMoney = this.getMoneyByDreamId(mdvo.getDreamVO()
					.getDreamId());
			statVO.setTotalMoney(totalMoney);
			long endTime = convert(mdvo.getDreamVO().getEndDate());
			int endDay = getEndDay(nowTime, endTime);
			statVO.setEndDay(endDay);
			mdvo.getDreamVO().setStatVO(statVO);
			rlist.add(mdvo);
		}
		return rlist;
	}
	
	
	//160705
	//추가 :: getCountPaymentDreamByMemberId
	@Override
	public int getCountPaymentDreamByMemberId(int memberId) throws IOException {
	return dreamDao.getCountPaymentDreamByMemberId(memberId);
	}
	//추가 :: getCountCreateDreamByMemberId//해당 멤버의 진행 꿈 수 보기
	@Override
	public int getCountCreateDreamByMemberId(int memberId) throws IOException {
	return dreamDao.getCountCreateDreamByMemberId(memberId);
	}

	//160705
	//추가
	@Override
	public int getSuccessDream() throws IOException {
		List<MyDreamVO> tempList = dreamDao.getSuccessDream();
		System.out.println("getSuccessDreamList" + tempList);
		
		List<MyDreamVO> successDreamList = new ArrayList<MyDreamVO>();
		int size = 0;
		
		for(MyDreamVO vo : tempList){
			
			System.out.println("dreamId별 합산 금액 :: " + vo.getPaymentVO().getMoney());
			DreamVO dreamVO = dreamDao.getDetailDreamByDreamId(vo.getDreamVO().getDreamId());
			if(vo.getDreamVO().getDreamId()==dreamVO.getDreamId()){
				
				System.out.println("targetFund :: "+ dreamVO.getTargetFund());
				
				if(dreamVO.getTargetFund()<=vo.getPaymentVO().getMoney()){//프로젝트 성공!!
					successDreamList.add(vo);
					System.out.println("successDreamList :: "+successDreamList);
					size = successDreamList.size();
				}
			}
		}
		
		return size;
	}
	
	//160704
	//추가 :: getAllDreamCnt
	@Override
	public int getAllDreamCnt() throws IOException {
		int result = dreamDao.getAllDreamCnt();
		System.out.println("service result :: "+result);
		return result;
	}
	//추가 :: getAllMemberCnt
	@Override
	public int getAllMemberCnt() throws IOException {
		return dreamDao.getAllMemberCnt();
	}
	//추가 :: getTotalMoney
	@Override
	public String getTotalMoney() throws IOException {
		int result = dreamDao.getTotalMoney();
		
		StringBuffer stringBuffer = new StringBuffer(String.valueOf(result));
		for(int i=stringBuffer.length()-3;i>0;i=i-3){
			stringBuffer.insert(i, ',');
		}
		return stringBuffer.toString();
	}	
	
	
	//160617
	//추가 :: getAllMyDreamByMemberId
	//memberId로 dream 정보 가져오기
	@Override
	public List<DreamVO> getAllMyDreamByMemberId(int memberId)
			throws IOException {
		//160705 추가
		List<DreamVO> myDreamList = dreamDao.getAllMyDreamByMemberId(memberId);
		long nowTime = convert(dreamDao.showNowDate());
		for(DreamVO dvo : myDreamList){
		List<Integer> totalMoneyList = dreamDao.getMoneyByDreamId(dvo.getDreamId());
		System.out.println("totalMoneyList :: "+ totalMoneyList);
		StatVO statVO = new StatVO();
		for(int totalMoney : totalMoneyList){
		statVO.setTotalMoney(totalMoney);
		dvo.setStatVO(statVO);
		}
		long endTime = convert(dvo.getEndDate());
		int endDay = getEndDay(nowTime, endTime);
		statVO.setEndDay(endDay);
		dvo.setStatVO(statVO);
		}
		return myDreamList;
	}

	
	// 추가 ::getAllMySupportProject
	//memberId로 moredream 현황 보기
	//160621 수정 
	@Override
	public ListVO getAllMySupportProject(String pageNo, int memberId)
			throws IOException {
		int pn=1;
		if(pageNo!=null){
			pn=Integer.parseInt(pageNo);
		}
		System.out.println("Service pn :: "+pn);
		
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("memberId", memberId);
		map.put("pageNo", pn);
		
		List<MyDreamVO> list =  dreamDao.getAllMySupportProject(map);// 조작하기 전 모든 책 정보가 필요하다.
		int total = dreamDao.getAllMySupportProjectCnt(memberId); 
		
		PagingBean pb = new PagingBean(total, pn);
		// 160707 마감표시를 위해 추가
		long nowTime = convert(dreamDao.showNowDate());
		for (MyDreamVO mdvo : list) {
			StatVO statVO = new StatVO();
			long endTime = convert(mdvo.getDreamVO().getEndDate());
			int endDay = getEndDay(nowTime, endTime);
			statVO.setEndDay(endDay);
			mdvo.getDreamVO().setStatVO(statVO);
		}
		return new ListVO(list, pb);
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
		public void updateMinusStockByRewardId(int rewardId) throws IOException {
			dreamDao.updateMinusStockByRewardId(rewardId);
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
	public ListVO getAllListDreamForAdmin(String pageNo) throws IOException {
		System.out.println("GetAllListDreamForAdmin GO!!");
		
		int pn = 1;
		if(pageNo != null){
			pn = Integer.parseInt(pageNo);
		}
		List list = dreamDao.getAllListDreamForAdmin(pn);
		int totalPage = dreamDao.getAllDreamCnt();
		
		PagingBean pb = new PagingBean(totalPage, pn);
		
		return new ListVO(list,pb);
		
		/*
		ArrayList list = memberDao.getMemberList(pageNo);
		int totalPage = memberDao.getAllListCnt();
		PagingBean pb = new PagingBean(totalPage, pageNo);
		return  new ListVO(list,pb);*/
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

	//160621 메소드수정
	@Override
	public DreamVO getDetailDreamByDreamId(int dreamId) throws IOException {
		DreamVO vo = dreamDao.getDetailDreamByDreamId(dreamId);
		
		StatVO statVO = new StatVO(0, getMoneyByDreamId(dreamId), getCountPaymentByDreamId(dreamId));
		long nowTime = convert(dreamDao.showNowDate());
		long endTime = convert(vo.getEndDate());
		int endDay = getEndDay(nowTime, endTime);
		statVO.setEndDay(endDay);
		vo.setStatVO(statVO);
		return vo;
	}

	@Override
	public List<DreamVO> selectByKeyWord(String keyword) throws IOException {
		List<DreamVO> list = dreamDao.selectByKeyWord(keyword);
		return list;
	}
	//160616 수정
	public List<DreamVO> getListDream(String num) throws IOException {
		List<DreamVO> rlist =new ArrayList<DreamVO>();
		if(num.equals("1")||num.equals("0")){	//새로운 꿈(최근순)[default]
			rlist = dreamDao.getAllListDream();
			this.listDetailInsert(rlist);
			
		}else if(num.equals("2")){				//마감임박
			rlist=dreamDao.getAllListDreamOrderByEndDate();
			this.addNonePaymentDreamList(rlist);//결재 내역이 없는 꿈을 추가함
			
		}else if(num.equals("3")){				//최다 후원
			rlist = dreamDao.getAllListDreamOrderByManyPeople();
			this.addNonePaymentDreamList(rlist);
			
		}else if(num.equals("4")){				//최고 후원
			rlist= dreamDao.getAllListDreamOrderByMoney();
			this.addNonePaymentDreamList(rlist);
		}
		this.listDetailInsert(rlist);
		
		return rlist;
	}
	//160706 결재 내역 없는거 list 추가해주는 로직
	public void addNonePaymentDreamList(List<DreamVO> rlist) throws IOException{
		List<DreamVO> rlist2 = dreamDao.getAllListDream();
		List<DreamVO> tempList = new ArrayList<DreamVO>();
		//결재 내역이 없는 꿈을 추가함
		for(int i=0;i<rlist2.size();i++){
			for(int j=0;j<rlist.size();j++){
				if(rlist.get(j).getDreamId()==rlist2.get(i).getDreamId()){
					break;
				}
				if(j==rlist.size()-1){//끝까지 돈 결과 결재 내역이 없는 dreamvo라면
					tempList.add(rlist2.get(i));//임시공간에 덧붙힐 dreamvo 추가
				}
			}
		}
		for(DreamVO dvo : tempList){//임시 공간에 있는 list 덧붙히기
			rlist.add(dvo);
		}
	}
	
	//160617 메소드 추가
	//160620 메소드 변경(분리)
	public void listDetailInsert(List<DreamVO> rlist) throws IOException{
		//현재시간 구하기
		long nowTime = convert(dreamDao.showNowDate());
		for(DreamVO dvo : rlist){
			int dreamId = dvo.getDreamId();
			StatVO statVO = new StatVO();
			statVO.setSupporterCnt(this.getCountPaymentByDreamId(dreamId));	//해당 꿈 후원자수 받아와서 setter주입
			statVO.setTotalMoney(this.getMoneyByDreamId(dreamId));//해당꿈 모인금액 받아와서 setter주입
			long endTime = convert(dvo.getEndDate());
			int endDay = getEndDay(nowTime, endTime);
			statVO.setEndDay(endDay);
			dvo.setStatVO(statVO);
		}
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
	//160621 수정
	@Override
	public void cancelPaymentByPaymentId(int paymentId) throws IOException {
		dreamDao.cancelPaymentByPaymentId(paymentId);
	}

	@Override
	public int payment(PaymentVO vo) throws IOException {
		dreamDao.payment(vo);
		int bonus = 0;
		return bonus;
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
	public int deleteCommentByReplyId(int replyId) throws IOException {

		return dreamDao.deleteCommentByReplyId(replyId);
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
	
	
	//160616 추가
	@Override
	public List<DreamVO> getListFilterByCategory(List<DreamVO> dreamList,String category) {
		List<DreamVO> removeList = new ArrayList<DreamVO>(); 
		for(DreamVO dvo:dreamList){
			if(!(dvo.getCategory().equals(category))){
				removeList.add(dvo);
			}
		}
		for(DreamVO dvo:removeList){
			dreamList.remove(dvo);
		}
		return dreamList;
	}
	@Override
	public int getCategoryCountByCategory(String category) throws IOException {
		List<DreamVO> dList = dreamDao.selectByCategory(category.trim());
		int count = 0;
		long nowDate = this.showNowDate();
		for(int i =0 ; i<dList.size(); i++){
			long startDate = this.convert(dList.get(i).getStartDate());
			long endDate = this.convert(dList.get(i).getEndDate());
			if(startDate<=nowDate&&nowDate<=endDate){
				count+=1;
			}
		}
		return count;
	}
	
	//160621 마감일자 구하는 메소드 추가
	public int getEndDay(long nowTime , long endTime){
		int endDay = (int)((endTime-nowTime)/(60*60*24*1000));
		return endDay;
	}
	//160624 오늘 날자 구하는 메소드 추가
	@Override
	public long showNowDate() throws IOException {
		return convert(dreamDao.showNowDate());
	}


	@Override
	public void disableDreamByMemberId(int memberId) throws IOException {
		dreamDao.disableDreamByMemberId(memberId);
	}
}
