package moreDream01;
/*
 * Dao Test
 */
import java.io.IOException;
import java.util.List;

import model.DreamVO;
import model.MemberVO;
import model.UpdateDreamVO;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import dao.DreamDao;



public class MoreDreamAppTest3 {
	@Test
	public void jUnitTest() throws IOException{
	
		ApplicationContext factory = new ClassPathXmlApplicationContext("config/dispatcher-servlet.xml");
		DreamDao dao = factory.getBean("dreamDao", DreamDao.class);
	
		MemberVO member = new MemberVO(1, "kosta@kosta.com", "1111", "U", "유스페이스 2B동", "박한천", "1111-1111");

		DreamVO vo1 = new DreamVO(0, member,"영화", " ", "부자1..", "야1..!!", " ", 50000, "2016-08-05", "2016-09-06");
		DreamVO vo2 = new DreamVO(0, member,"출판", " ", "부자2..", "야2..!!", " ", 60000, "2016-09-05", "2016-10-06");
		DreamVO vo3 = new DreamVO(0, member,"음악", " ", "부자3..", "야3..!!", " ", 70000, "2016-10-05", "2016-11-06");

		//꿈 신청 :: requestDream CH
		/*int result1 = dao.requestDream(vo1);
		int result2 = dao.requestDream(vo2);
		int result3 = dao.requestDream(vo2);
	
		System.out.println(result1+result2+result3 +"개 추가!!");*/
	

		//꿈 삭제 :: deleteDream
		//dao.deleteDream(3);

		//카테고리별 조회 :: selectByCategory
		/*List<DreamVO> list = (List) dao.selectByCategory("영화");
		System.out.println(list);*/

		//dreamId로 상세조회 :: getDetailDreamByDreamId
		//System.out.println(dao.getDetailDreamByDreamId(2));
		

		//키워드 검색 :: selectByKeyWord
		/*List<DreamVO> list = dao.selectByKeyWord("부자");
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/

		//응원 현황 보기 :: cheerUpList
		/*List<DreamVO> list = dao.cheerUpList(1);
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/
		
		//관리자 수락/거절 처리 :: confirmRequestDream
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("confirm", "Y");
		map.put("dreamId", 1);
		System.out.println(dao.confirmRequestDream(map));*/

		//결제내역 가져오기 :: getPaymentHistoryByMemberId
		/*List<PaymentVO> list = dao.getPaymentHistoryByMemberId(1);
		for(PaymentVO pvo : list){
			System.out.println(pvo);
		}*/

		//보상등록 확인 :: registerReward CH
		/*vo1.setDreamId(1);
		RewardVO rpvo1 = new RewardVO(0, vo1, "나무 막대기", 100000, 100);
		RewardVO rpvo2 = new RewardVO(0, vo1, "문화 상품권", 100000, 100);
		dao.registerReward(rpvo1);
		dao.registerReward(rpvo2);*/
		

		//전체 꿈 보기 :: getAllListDream(Y/N구분 없이 가져옴)
		/*List<DreamVO> list = dao.getAllListDream();
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/
		
		/////////////////////////////
		
		//전체 꿈 가져오기 필터 :: Y/N 구분해서 가져오기

		////////////////////////////////
		
		
		//꿈 후원금 확인 :: getMoneyByDreamId 
		// :: 결제 테이블에 있는 하나의 프로젝트에 대한 금액 전체만 가져오는 것
		/*List<Integer> list = dao.getMoneyByDreamId(1);
		for(Integer i : list){
			System.out.println(i);
		}*/

		//꿈 후원금 확인 :: getAllMoney :: Service에서 전체 합계 내야 함
		/*List<Integer> list = dao.getAllMoney();
		for(Integer i : list){
			System.out.println(i);
		}*/

		//응원 취소 (결제 취소) :: deletePaymentByPaymentId
		//dao.deletePaymentByPaymentId(1);

		//결제하기 :: payment CH
		/*RewardVO reward = new RewardVO(1, vo1, "나무 막대기", 100000, 100);
		PaymentVO vo = new PaymentVO(0, reward, 1, " ", 2000);
		dao.payment(vo);*/
		

		//꿈에 대한 보상 가져오기 :: getRewardByDreamId
		/*List<RewardVO> list=dao.getRewardByDreamId(1);
		for(RewardVO i : list){
			System.out.println(i);
		}*/

		//내꿈 현황 보기 :: requestStateDream
		/*List<DreamVO> list = (List<DreamVO>) dao.requestStateDream(1);
		for(DreamVO i : list){
			System.out.println(i);
		}*/
		
		//내꿈 수정하기(업데이트 작성) :: updateDream
		/*vo2.setDreamId(2);
		UpdateDreamVO dreamVO = new UpdateDreamVO(vo2, "안녕?", " ", " ");
		dao.updateDream(dreamVO);*/

		
		
		/////나중..
		//댓글 작성하기 :: writeComment
		
	      /*dao.writeComment(new ReplyVO(0, new DreamVO(2, member, "예시", " ", " ", " ", "예시", " ", " ", 800000, "2016-06-09", "2016-06-29"), member, "함께 프로젝트를 하게 되어서 좋아요2!!",new Date(2016-6-9)));
	      System.out.println("reply 추가!!");*/
	  
	      //댓글 삭제하기
	      /*dao.deleteComment(1);
	      System.out.println("댓글 삭제!!!");*/
	      
	      //updateDream 내용 입력 내가 임의로 했어
	      /*UpdateDreamVO updatevo = new UpdateDreamVO(vo1, "잘 되고 있어!!! ", " ", " ");
	      vo1.setDreamId(1);
	      sqlSession.insert("dreamSql.updateDream", updatevo);
	      sqlSession.commit();
	      System.out.println("updateDream 추가");*/
	      
	      //알림받기
	     /* List<UpdateDreamVO> list = dao.alarm(1);
	      for(UpdateDreamVO v : list){
	         System.out.println(v);
	      }*/
	}	
}
