package moreDream01;

import java.io.IOException;
import java.io.Reader;
import java.util.ArrayList;
import java.util.List;

import model.MemberVO;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.apache.ibatis.session.SqlSessionFactoryBuilder;
import org.junit.Test;

import com.ibatis.common.resources.Resources;



public class MoreDreamAppTest2 {
	@Test
	public void jUnitTest() throws IOException{
		//mybatis sql Test
		Reader r = Resources.getResourceAsReader("config/SqlMapConfig.xml");
		SqlSessionFactory factory = new SqlSessionFactoryBuilder().build(r);
		SqlSession sqlSession = factory.openSession();
		
		MemberVO member = new MemberVO(9998, "kosta114@kosta.com", "2222", "U", "유스페이스 2B동", "칸나", "1111-2222");
		MemberVO member2 = new MemberVO(2, "kosta115@kosta.com", "333", "M", "유스페이스 2C동", "유이", "3333-4444");
		
		
		
		
		//회원 등록 :: registerMember
/*		sqlSession.insert("memberSql.registerMember",member2);
		System.out.println("추가!!");
		sqlSession.commit();*/
		
		//이메일  중복확인 :: existEmail
		//System.out.println(sqlSession.selectOne("memberSql.existEmail","kosta115@kosta.com"));
		
		//로그인 :: login
		//System.out.println(sqlSession.selectOne("memberSql.login",member2));
		
		//회원정보 수정 ::  updateMember
	/*	member2.setAddress("동작구");
		sqlSession.update("memberSql.updateMember",member2);
		sqlSession.commit();*/
		
		//회원탈퇴  :: deleteMember
		//회원탈퇴 : 개인정보 컬럼 모두 '-' 로 변경하고  
		//memberCode D으로 변경 하며  memberCode가 D인 것은 view 에서 비활성화
	/*	sqlSession.update("memberSql.deleteMember",member2);
		sqlSession.commit();*/
		
		//회원 전체 조회 :: getMemberList
		/*List<MemberVO> list = new ArrayList<MemberVO>();
		list = sqlSession.selectList("memberSql.getMemberList");
		for(int i = 0 ; i<list.size();i++){
			System.out.println(list);
		}*/
	}	
}
