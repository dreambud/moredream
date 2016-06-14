package moreDream01;

import java.io.IOException;
import java.io.Reader;
import java.util.List;

import model.DreamVO;
import model.MemberVO;
import model.UpdateDreamVO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.ibatis.common.resources.Resources;



public class MoreDreamAppTest1 {
	@Test
	public void jUnitTest() throws IOException{
		//mybatis sql Test
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession sqlSession = factory.openSession();

		MemberVO member = new MemberVO(1, "kosta@kosta.com", "1111", "U", "유스페이스 2B동", "박한천", "1111-1111");

		DreamVO vo1 = new DreamVO(0, member,"영화", " ", "거지1..", "야1..!!", " ", 50000, "2016-05-05", "2016-06-06");
		DreamVO vo2 = new DreamVO(0, member,"출판", " ", "거지2..", "야2..!!", " ", 60000, "2016-06-05", "2016-07-06");
		DreamVO vo3 = new DreamVO(0, member,"음악", " ", "거지3..", "야3..!!", " ", 70000, "2016-07-05", "2016-08-06");

		//꿈 신청 :: requestDream
		/*sqlSession.insert("dreamSql.requestDream", vo1);
		sqlSession.insert("dreamSql.requestDream", vo2);
		sqlSession.insert("dreamSql.requestDream", vo3);
		System.out.println("추가!!");
		sqlSession.commit();*/

		//꿈 삭제 :: deleteDream
		/*sqlSession.delete("dreamSql.deleteDream", 2);
		sqlSession.commit();*/

		//카테고리별 조회 :: selectByCategory
		/*List<DreamVO> list = (List) sqlSession.selectList("dreamSql.selectByCategory", "영화");
		System.out.println(list);*/

		//dreamId로 상세조회 :: getDetailDreamByDreamId
		/*List<DreamVO> list = sqlSession.selectList("dreamSql.getDetailDreamByDreamId", 2);
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/

		//키워드 검색 :: selectByKeyWord
		/*List<DreamVO> list = sqlSession.selectList("dreamSql.selectByKeyWord", "거지");
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/

		//응원 현황 보기 :: cheerUpList
		/*List<DreamVO> list = sqlSession.selectList("dreamSql.cheerUpList", 1);
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/

		//관리자 수락/거절 처리 :: confirmRequestDream
		/*Map<String, Object> map = new HashMap<String, Object>();
		map.put("confirm", "Y");
		map.put("dreamid", 1);
		System.out.println(sqlSession.update("dreamSql.confirmRequestDream",map));
		sqlSession.commit();*/

		//결제내역 가져오기 :: getPaymentHistoryByMemberId
		/*List<PaymentVO> list = sqlSession.selectList("dreamSql.getPaymentHistoryByMemberId",9999);
		for(PaymentVO pvo : list){
			System.out.println(pvo.getPaymentState().length());
		}*/

		//보상등록 확인 :: registerReward
		/*vo1.setDreamId(2);
		RewardVO rpvo1 = new RewardVO(0, vo1, "나무 막대기", 100000, 100);
		RewardVO rpvo2 = new RewardVO(0, vo1, "문화 상품권", 100000, 100);
		sqlSession.insert("dreamSql.registerReward",rpvo1);
		sqlSession.insert("dreamSql.registerReward",rpvo2);
		sqlSession.commit();*/

		//전체 꿈 보기 :: getAllListDream
		/*List<DreamVO> list = sqlSession.selectList("dreamSql.getAllListDream");
		for(DreamVO vo : list){
			System.out.println(vo);
		}*/

		//꿈 후원금 확인 :: getMoneyByDreamId 
		// :: 결제 테이블에 있는 하나의 프로젝트에 대한 금액 전체만 가져오는 것
		/*List<Integer> list = sqlSession.selectList("dreamSql.getMoneyByDreamId", 2);
		for(Integer i : list){
			System.out.println(i);
		}*/

		//꿈 후원금 확인 :: getAllMoney :: Service에서 전체 합계 내야 함
		/*List<Integer> list = sqlSession.selectList("dreamSql.getAllMoney");
		for(Integer i : list){
			System.out.println(i);
		}*/

		//응원 취소 (결제 취소) :: deletePaymentByPaymentId
		/*sqlSession.delete("dreamSql.deletePaymentByPaymentId", 2);
		sqlSession.commit();*/

		//결제하기 :: payment
		/*RewardVO reward = new RewardVO(1, vo1, "나무 막대기", 100000, 100);
		PaymentVO vo = new PaymentVO(0, reward, 1, " ", 2000);
		sqlSession.insert("dreamSql.payment", vo);
		sqlSession.commit();*/

		//꿈에 대한 보상 가져오기 :: getRewardByDreamId
		/*List<RewardVO> list=sqlSession.selectList("dreamSql.getRewardByDreamId", 2);
		for(RewardVO i : list){
			System.out.println(i);
		}*/

		//내꿈 현황 보기 :: requestStateDream
		/*List<DreamVO> list = sqlSession.selectList("dreamSql.requestStateDream", 1);
		for(DreamVO i : list){
			System.out.println(i);
		}*/

		//내꿈 수정하기(업데이트 작성) :: updateDream
		/*vo2.setDreamId(2);
		UpdateDreamVO dreamVO = new UpdateDreamVO(vo2, "안녕?", " ", " ");
		sqlSession.insert("dreamSql.updateDream", dreamVO);
		sqlSession.commit();*/



		//댓글 작성하기 :: writeComment 
		/*  sqlSession.insert("dreamSql.writeComment", new ReplyVO(0, new DreamVO(1, member, "경제", " ", " ", " ", "후원", " ", " ", 800000, "2016-06-09", "2016-06-29"), member, "함께 프로젝트를 하게 되어서 좋아요!!",new Date(2016-6-9)));
	      System.out.println("reply 추가!!");
	      sqlSession.commit();*/

		//댓글 삭제하기
		/*sqlSession.delete("dreamSql.deleteComment", 1);
	      sqlSession.commit();
	      System.out.println("댓글 삭제!!!");*/

		//updateDream 내용 입력 내가 임의로 했어
		/*UpdateDreamVO updatevo = new UpdateDreamVO(vo1, "잘 되고 있어!!! ", " ", " ");
	      vo1.setDreamId(1);
	      sqlSession.insert("dreamSql.updateDream", updatevo);
	      sqlSession.commit();
	      System.out.println("updateDream 추가");*/

		/* //알림받기
	      List<UpdateDreamVO> list = sqlSession.selectList("dreamSql.alarm", 1);
	      for(UpdateDreamVO v : list){
	         System.out.println(v);
	      }*/
		///////////////////////////////////////////////////////////////////////////////////
		//////////////////             댓글 입력 20160614        /////////////////////////////
		/*ReplyVO replyVO = new ReplyVO(0, vo1, member, "오늘도 집에가고싶어욧 !", " ");
		sqlSession.insert("dreamSql.writeComment",replyVO);
		sqlSession.commit();
		List<ReplyVO> list = sqlSession.selectList("dreamSql.readComment", 3012);
		System.out.println(list);*/
		///////////////////////////////////////////////////////////////////////////////////
	}	
}
