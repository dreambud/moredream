package dao;

import java.util.ArrayList;
import java.util.List;

import model.MemberVO;

import org.apache.ibatis.session.SqlSession;
import org.mybatis.spring.SqlSessionTemplate;

public class MemberDaoImpl implements MemberDao {

	private SqlSessionTemplate sqlSession;
		
	public void setSqlSession(SqlSessionTemplate sqlSession) {
		System.out.println("::"+getClass().getName()+".sqlSession()...");
		this.sqlSession = sqlSession;
	}
	
	@Override
	public int registerMember(MemberVO pmvo) {
	
		return sqlSession.insert("memberSql.registerMember",pmvo);
	}

	@Override
	public boolean existEmail(String email) {
		System.out.println("before :: "+email);
		String retEmail = sqlSession.selectOne("memberSql.existEmail",email);
		System.out.println("existEmail "+retEmail);
		boolean flag = false;//사용불가
		
		if(retEmail==null)//같은 이메일이 없음
			flag=true;//사용가능		
		
		System.out.println("if ::"+flag);
		return flag ;
	}

	@Override
	public MemberVO login(MemberVO pmvo) {

		return sqlSession.selectOne("memberSql.login",pmvo);
	}

	@Override
	public int updateMember(MemberVO pmvo) {

		return sqlSession.update("memberSql.updateMember",pmvo);
	}

	@Override
	public int deleteMember(int memberId) {
		return sqlSession.update("memberSql.deleteMember",memberId);
	}

	@Override
	public ArrayList<MemberVO> getMemberList() {
		List<MemberVO> list = sqlSession.selectList("memberSql.getMemberList");
		
		return (ArrayList<MemberVO>) list ;
	}

}
