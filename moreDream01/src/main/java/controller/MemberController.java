package controller;

import java.io.File;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.MemberVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import service.MemberService;

public class MemberController extends MultiActionController {

	MemberService memberService;

	public void setMemberService(MemberService memberService) {
		System.out.println("::"+getClass().getName()+".setMemberService call");
		this.memberService = memberService;
	}
	
	private String path;

	public void setPath(String path) {
		this.path = path;
	}
	
	public ModelAndView registerMember(
	HttpServletRequest request, HttpServletResponse response, MemberVO pmvo
	){
		
	memberService.registerMember(pmvo);
	MemberVO rmvo = memberService.facebookLogin(pmvo.getFacebookId());
	if(rmvo==null)
		memberService.updateFacebookId(pmvo);//facebook 연동 로직 추가
	else
		request.setAttribute("facebookFail", "해당 페이스북 계정은 이미 연동되었습니다.");
	return new ModelAndView("WEB-INF/result/memberRegister_result","email",pmvo.getEmail());
	}
	
	
	public ModelAndView existEmail(HttpServletRequest request, HttpServletResponse response)
	throws Exception{
	boolean	flag = memberService.existEmail(request.getParameter("email"));
	System.out.println(flag);
	return new ModelAndView("JsonView","flag",flag);
	}
	
	//주의!!..login_ok, login_fail
	//메소드의 인자값 주의...사용자의 정보를 session에 바인딩 해야 한다..
	public ModelAndView login(HttpServletRequest request, HttpServletResponse response
			, HttpSession session, MemberVO pmvo)
		throws SQLException{
		String path = "WEB-INF/result/login_fail";
		
		MemberVO rmvo=memberService.login(pmvo);
		System.out.println("pmvo ::"+pmvo); //확인...
		System.out.println("rmvo ::"+rmvo); //확인
		String url = request.getParameter("url");
		if(url==null||url==""){
			url = "index.jsp";
		}
		if(rmvo != null){
			//중요!!
			session.setAttribute("mvo", rmvo);
			path = "WEB-INF/result/login_ok";
		}
		return new ModelAndView(path,"url",url); //이미 위에서 바인딩은 됬다.
	}
	
	public ModelAndView logout(HttpServletRequest request, HttpServletResponse response
			, HttpSession session)
		throws SQLException{
		if(session.getAttribute("mvo") != null)
			session.invalidate();
		
		return new ModelAndView("redirect:/index.jsp"); //생각!!
	}
	//HttpSession을 인자값으로 넣지 않고 진행하자....
	public ModelAndView updateMember(HttpServletRequest request, HttpServletResponse response
			, MemberVO pmvo)
		throws SQLException, IllegalStateException, IOException{
		
		if(pmvo.getMultipartFile()!=null){
		MultipartFile file = pmvo.getMultipartFile();//업로드한 파일
		System.out.println("업로드된 뉴파일 명 : "+pmvo.getMember_newFilename());
		System.out.println("pmvo.getMultipartFile() ::"+pmvo.getMultipartFile());
		if(!file.isEmpty()){//파일이 있다.
			/*
			 * orgfilename 받아와서 bvo에 주입
			 * newfilename 방아와서 bvo에 주입
			 */
			pmvo.setMember_orgFilename(file.getOriginalFilename());
			pmvo.setMember_newFilename(System.currentTimeMillis()+"_"+file.getOriginalFilename());
		
			File desFile = new File(path+System.currentTimeMillis()+"_"+file.getOriginalFilename());
			file.transferTo(desFile);
			}
		}
		request.getParameter("password");
		System.out.println(pmvo);
		memberService.updateMember(pmvo);//이 부분에서 디비의 mvo내용이 pmvo로 수정이 일어났다.
		//그걸 다시 세션에 반드시 바인딩 해야한다.
		request.getSession().setAttribute("mvo", pmvo);
		//return new ModelAndView("redirect:/updateMember.jsp");
		return new ModelAndView("WEB-INF/result/updateMember_result");
		
		
		//바인딩은 이미 위에서 했다.
		
	}	
	
	public ModelAndView updateMemberbyAdmin(HttpServletRequest request, HttpServletResponse response
			, MemberVO pmvo)
		throws SQLException{
		request.getParameter("password");
		System.out.println(pmvo);
		memberService.updateMember(pmvo);//이 부분에서 디비의 mvo내용이 pmvo로 수정이 일어났다.
		return new ModelAndView("WEB-INF/result/updateMember_result");//바인딩은 이미 위에서 했다.
		
	}	
	
	
	public ModelAndView deleteMember(HttpServletRequest request, HttpServletResponse response
		, HttpSession session)
		throws SQLException{
		
		MemberVO rmvo =(MemberVO) session.getAttribute("mvo");
		memberService.deleteMember(rmvo.getMemberId());
		session.invalidate();
		return new ModelAndView("WEB-INF/result/deleteMember_result");//바인딩은 이미 위에서 했다.
		
	}	
	
	public ModelAndView deleteMemberbyAdmin(HttpServletRequest request, HttpServletResponse response
			, HttpSession session)
			throws SQLException{
			
		
			memberService.deleteMember(Integer.parseInt(request.getParameter("memberId")) );
			
			return new ModelAndView("WEB-INF/result/deleteMember_result");//바인딩은 이미 위에서 했다.
			
		}	
	
	
	public ModelAndView getMemberList(HttpServletRequest request, HttpServletResponse response
			, HttpSession session)
			throws SQLException{
			
			MemberVO rmvo =(MemberVO) session.getAttribute("mvo");
			List<MemberVO> list = memberService.getMemberList();
			System.out.println(list);
			return new ModelAndView("WEB-INF/result/getMemberList_result","list",list);//바인딩은 이미 위에서 했다.
			
		}
	
	public ModelAndView deleteFileMember(HttpServletRequest request, HttpServletResponse response)
	throws NumberFormatException, Exception{
	String member_newFilename = request.getParameter("member_newFilename");

		System.out.println("아작스 뚜뚜뚜뚜 콜~ ");

	String member_newFilename1 = path+member_newFilename; // 디렉토리에 있는 파일 지울꺼
	System.out.println(member_newFilename1);
	String member_newFilename2 = member_newFilename; // db테이블에 있는 파일 지울꺼
		memberService.deleteFileMember(member_newFilename1, member_newFilename2);
	
	return new ModelAndView("JsonView");
	}
	
	public ModelAndView facebookLogin(HttpServletRequest request, HttpServletResponse response){
		String facebookId = request.getParameter("facebookId");
		String path="registerMember";
		MemberVO rmvo = memberService.facebookLogin(facebookId);
		if(rmvo==null){
			request.setAttribute("email",request.getParameter("email"));
			request.setAttribute("facebookId", facebookId);
		}else{
			path="WEB-INF/result/login_ok";
			request.getSession().setAttribute("mvo", rmvo);
		}
		return new ModelAndView(path,"url","index.jsp");
	}
	
}
