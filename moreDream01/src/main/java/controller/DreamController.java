package controller;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DreamVO;
import model.ListVO;
import model.MemberVO;
import model.MyDreamVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import service.DreamService;

/*
 * DreamController 주석 추가
 */
public class DreamController extends MultiActionController {

	private DreamService dreamService;
	private String path;

	public void setPath(String path) {
		this.path = path;
	}

	public void setDreamService(DreamService dreamService) {
		this.dreamService = dreamService;
	}

	// 꿈 신청
	// 160615(한천)
	public ModelAndView requestDream(HttpServletRequest request,
			HttpServletResponse response, DreamVO pvo)
			throws Exception {
		// DreamVO pvo = new DreamVO(0, null, request.getParameter("category"),
		// " ", request.getParameter("titleDream"),
		// request.getParameter("detailDream"), "",
		// Integer.parseInt(request.getParameter("targetFund")),
		// request.getParameter("startDate"), request.getParameter("endDate"));
		// 1. 업로드된 파일명을 받아온다.
		// pvo.setMultipartFile(multipartFile);
		MultipartFile mFile = pvo.getMultipartFile();

		// 2. 업도드된 파일이 있다면..
		if (!mFile.isEmpty()) {// 비어있지 않다.
			// 3.
			String orgfilename = mFile.getOriginalFilename();
			String newfilename = System.currentTimeMillis() + "_" + orgfilename;

			pvo.setDream_orgFilename(orgfilename);
			pvo.setDream_newFilename(newfilename);

			File desFile = new File(path + newfilename);
			mFile.transferTo(desFile);
		}

		HttpSession session = request.getSession();
		MemberVO rmvo = (MemberVO) session.getAttribute("mvo");
		pvo.setMemberVO(rmvo);// 세션 값 주입

		dreamService.requestDream(pvo);
		String[] rewardInfoArr = request.getParameterValues("rewardInfo");
		String[] rewardGuideArr = request.getParameterValues("rewardGuide");
		String[] stockArr = request.getParameterValues("stock");

		List<RewardVO> rewardList = new ArrayList<RewardVO>();
		RewardVO defaultReward = new RewardVO(0, pvo, "보상없이 후원하겠습니다.", 0, 50000);
		rewardList.add(defaultReward);
		for (int i = 0; i < rewardInfoArr.length; i++) {
			if ((rewardInfoArr.length == 1)
					&& (Integer.parseInt(rewardGuideArr[i]) == 0)) {
				break;
			}
			RewardVO rpvo = new RewardVO();
			rpvo.setRewardId(0);
			rpvo.setDreamVO(pvo);
			rpvo.setRewardInfo(rewardInfoArr[i]);
			rpvo.setRewardGuide(Integer.parseInt(rewardGuideArr[i]));
			rpvo.setStock(Integer.parseInt(stockArr[i]));
			rewardList.add(rpvo);
		}

		for (RewardVO rvo : rewardList) {
			dreamService.registerReward(rvo);
		}
		return new ModelAndView("redirect:/index.jsp");
	}

	 // 꿈 목록 (160617 내용수정) // (160624) 내용수정 :: startDate 가 현재 같거나 적을때 리스트 출력
	public ModelAndView getAllListDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String filter = request.getParameter("filter");
		String category = request.getParameter("category");
		String keyword = request.getParameter("keyword");
		if (filter == null) {
			filter = "1";
		}
		List<DreamVO> dList = dreamService.getListDream(filter);
		List<DreamVO> rDreamList = new ArrayList<DreamVO>();
		long startDate =0;
		long endDate=0;
		long nowDate = dreamService.showNowDate();
		for(int i =0 ; i<dList.size(); i++){
			startDate = dreamService.convert(dList.get(i).getStartDate());
			endDate = dreamService.convert(dList.get(i).getEndDate());
			if(startDate<=nowDate&&nowDate<=endDate){
				rDreamList.add(dList.get(i));
			}
		}
		request.setAttribute("totalCnt", rDreamList.size());
		
		//카테고리가 있으면 해당 카테고리
		if (category != null && !(category.equals(""))&& !(category.equals("none"))) {
			//필터 된 DreamList에 category만 뽑아오는 로직
			rDreamList = dreamService.getListFilterByCategory(rDreamList,category.trim());
		}
		
		//키워드가 있으면 해당 낱말이 들어간 것만 찾아내는 로직
		if ((keyword != null) && !(keyword.equals(""))) {
			rDreamList = dreamService.selectByKeyWord(keyword);//새로 List로 받아옴
			dreamService.listDetailInsert(rDreamList);
			request.setAttribute("keyword", keyword);
		}
		
		//모든 카테고리 갯수 request에 바인딩
		this.categoryCountBinding(request);
		
		//finddream.jsp 오른쪽 하단에 들어가는 최근,인기 목록
		List<DreamVO> recentProjectsTemp = dreamService.getListDream("1");
		List<DreamVO> recentProjects = new ArrayList<DreamVO>();
		List<DreamVO> popularProjectsTemp = dreamService.getListDream("3");
		List<DreamVO> popularProjects = new ArrayList<DreamVO>();
		for(int i =0 ; i<recentProjectsTemp.size(); i++){
			startDate = dreamService.convert(recentProjectsTemp.get(i).getStartDate());
			endDate = dreamService.convert(recentProjectsTemp.get(i).getEndDate());
			if(startDate<=nowDate&&nowDate<=endDate){
				recentProjects.add(recentProjectsTemp.get(i));
			}
		}
		for(int i =0 ; i<popularProjectsTemp.size(); i++){
			startDate = dreamService.convert(popularProjectsTemp.get(i).getStartDate());
			endDate = dreamService.convert(popularProjectsTemp.get(i).getEndDate());
			if(startDate<=nowDate&&nowDate<=endDate){
				popularProjects.add(popularProjectsTemp.get(i));
			}
		}
		request.setAttribute("recentProjects", recentProjects);
		request.setAttribute("popularProjects", popularProjects);
		
		
		//카테고리,필터 바인딩(finddream.jsp에서 다시 쓰기때문에)
		request.setAttribute("category", category);
		request.setAttribute("filter", filter);
		return new ModelAndView("./dream/finddream", "dreamList", rDreamList);
	}

	// 관리자 꿈 목록 보기
	public ModelAndView getAllListDreamForAdmin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		String pageNo = request.getParameter("pageNo");
		ListVO lvo = dreamService.getAllListDreamForAdmin(pageNo);

		return new ModelAndView("./admin/admindreampage", "lvo", lvo);
	}

	// 카테고리 검색
	public ModelAndView selectByCategory(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		List<DreamVO> list = dreamService.selectByCategory(category);
		return new ModelAndView("./test/selectByCategory", "list", list);
	}

	// Admin 꿈 승인하기
	public ModelAndView confirmRequestDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		String confirmRequestDream = request
				.getParameter("confirmRequestDream");

		Map<String, Object> map = new HashMap<String, Object>();
		map.put("dreamId", dreamId);
		map.put("confirm", confirmRequestDream);

		dreamService.confirmRequestDream(map);

		return new ModelAndView(
				"redirect:/dream.do?command=getAllListDreamForAdmin");
	}

	// 추가 160614
	// :: getDetailDreamByDreamId - 꿈 상세보기
	public ModelAndView getDetailDreamByDreamId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		DreamVO dreamVO = dreamService.getDetailDreamByDreamId(dreamId);
		MemberVO memberVO = dreamService.getMemberByDream(dreamId);
		dreamVO.setMemberVO(memberVO);
		// //////////////////////////////////////////////////////////////////////////////
		List<UpdateDreamVO> updateDreamList = dreamService
				.updateDreamFindByDreamId(dreamId);
		request.setAttribute("updateDreamList", updateDreamList);

		// /////////////////////////////////////////////////////////////////////////////////
		List<ReplyVO> replyList = dreamService.readComment(dreamId);
		request.setAttribute("replyList", replyList);

		// //////////////////////////////////////////////////////////////////////
		// 후원자 가져오기 :: getPaymentMemeberByDreamId
		List<MemberVO> memberList = dreamService
				.getPaymentMemberByDreamId(dreamId);
		request.setAttribute("memberList", memberList);

		// 댓글 작성 160615
		// 후원자 여부 체크
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("mvo"); // 세션에 있는 mvo를
																	// 가져옴

		if (member != null) { // 로그인 상태
			boolean is_dreamMaker;
			for (MemberVO vo : memberList) {

				if (member.getMemberId() == vo.getMemberId()) {

					is_dreamMaker = true;// 후원자 맞음
					request.setAttribute("is_dreamMaker", is_dreamMaker);// 후원자
																			// 여부
																			// 플래그
																			// 바인딩
					break;
				} else {
					is_dreamMaker = false;// 후원자가 아님
				}
			}
		}

		// 160619 추가
		// 댓글 갯수 카운트
		int replyCount = dreamService.getCountReplyByDreamId(dreamId);
		request.setAttribute("replyCount", replyCount);

		// 후원자 카운트
		int dreamMakerCount = dreamService.getCountPaymentByDreamId(dreamId);
		request.setAttribute("dreamMakerCount", dreamMakerCount);

		// 업데이트 카운트
		int updateDreamCount = dreamService
				.getCountUpdateDreamByDreamId(dreamId);
		request.setAttribute("updateDreamCount", updateDreamCount);
		
		// 160620 추가
		// 보상 리스트
		List<RewardVO> rewardList = dreamService.getRewardByDreamId(dreamId);
		request.setAttribute("rewardList", rewardList);
		
		//160704 추가
		// 과거에 진행했던 프로젝트 목록 가져오기
		List<DreamVO> dreamList = dreamService.getAllMyDreamByMemberId(dreamVO.getMemberVO().getMemberId());
		request.setAttribute("dreamList", dreamList);
		
		 return new ModelAndView("dream/dreamdetails", "dreamVO", dreamVO);
	}

	// 추가160615
	// 응원하기 클릭 후 선택할 보상 리스트 가져오기
	public ModelAndView getRewardByDreamId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		List<RewardVO> rewardList = dreamService.getRewardByDreamId(dreamId);

		return new ModelAndView("dream/payment", "rewardList", rewardList);
	}

	// 결제하기
	public ModelAndView payment(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int rewardId = Integer.parseInt(request.getParameter("rewardId"));
		int money = Integer.parseInt(request.getParameter("money"));
		RewardVO rvo = new RewardVO();
		rvo.setRewardId(rewardId);
		HttpSession session = request.getSession();
		session.getAttribute("mvo");
		PaymentVO ppvo = new PaymentVO(0, rvo,
				((MemberVO) session.getAttribute("mvo")).getMemberId(), "Y",
				money);

		int bonus = dreamService.payment(ppvo);
		dreamService.updateMinusStockByRewardId(rewardId);

		return new ModelAndView("WEB-INF/result/payment_result","bonus",bonus);
	}

	// 160616
	// /댓글 작성 :: writeComment

	public ModelAndView writeComment(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		String content = request.getParameter("content");

		DreamVO dreamVO = new DreamVO();
		dreamVO.setDreamId(dreamId);// dreamVO.dreamId
		HttpSession session = request.getSession();
		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");// memberVO.memberId

		ReplyVO replyVO = new ReplyVO(0, dreamVO, memberVO, content, null);

		dreamService.writeComment(replyVO);// 댓글 작성

		return new ModelAndView(
				"redirect:/dream.do?command=getDetailDreamByDreamId&&dreamId="
						+ dreamId);
	}

	// index 최근 꿈 배너 (160628 꿈 시작일에 리스트업 되도록 수정)

	public ModelAndView recentDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<DreamVO> recentProjectsTemp = dreamService.getListDream("1");
		List<DreamVO> recentProjects = new ArrayList<DreamVO>();
		List<DreamVO> popularProjectsTemp = dreamService.getListDream("3");
		List<DreamVO> popularProjects = new ArrayList<DreamVO>();
		long startDate = 0;
		long endDate = 0;
		long nowDate = dreamService.showNowDate();
		for(int i =0 ; i<recentProjectsTemp.size(); i++){
			startDate = dreamService.convert(recentProjectsTemp.get(i).getStartDate());
			endDate = dreamService.convert(recentProjectsTemp.get(i).getEndDate());
			if(startDate<=nowDate&&nowDate<=endDate){
				recentProjects.add(recentProjectsTemp.get(i));
			}
		}
		for(int i =0 ; i<popularProjectsTemp.size(); i++){
			startDate = dreamService.convert(popularProjectsTemp.get(i).getStartDate());
			endDate = dreamService.convert(popularProjectsTemp.get(i).getEndDate());
			if(startDate<=nowDate&&nowDate<=endDate){
				popularProjects.add(popularProjectsTemp.get(i));
			}
		}
		request.setAttribute("recentProjects", recentProjects);
		request.setAttribute("popularProjects", popularProjects);
		
		//////////////////////////160706 help3추가 ///////////////////////////
		int dreamCnt=dreamService.getAllDreamCnt();
		request.setAttribute("dreamCnt", dreamCnt);

		int memberCnt = dreamService.getAllMemberCnt();
		request.setAttribute("memberCnt", memberCnt);
		
		String totalMoney = dreamService.getTotalMoney();
		request.setAttribute("totalMoney", totalMoney);
		
		int successDreamCnt = dreamService.getSuccessDream();
		request.setAttribute("successDreamCnt", successDreamCnt);
		
		
		return new ModelAndView("index","flag",1);
	}
	// /////////////////////// 160706 추가 160617 후원한 && 받은 내역
	// //////////////////////////////////////////
	// ///////////////////////////////////////////////////////////////////////////////////////
	public ModelAndView myMoreDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		// ////////////////////// 후원한 부분
		// ///////////////////////////////////////////
		HttpSession session = request.getSession();
		MemberVO mvo = (MemberVO) session.getAttribute("mvo");
		if(mvo==null){
			return new ModelAndView("member/login");
		}
		
	    int memberId = mvo.getMemberId();
		
		String pageNo = request.getParameter("pageNo");
		ListVO lvo = dreamService
				.getAllMySupportProject(pageNo, memberId);
		
		request.setAttribute("lvo", lvo);
		
		// 160707 모달을 위한 데이터 추가
		List<MyDreamVO> myDreamList = dreamService
				.getAllYourSupportProject(memberId);
		request.setAttribute("myDreamList", myDreamList);
		int countPayment = dreamService
				.getCountPaymentDreamByMemberId(memberId);
		request.setAttribute("countPayment", countPayment);

		// ////////////////////////////////후원
		// 받은/////////////////////////////////////
		List<DreamVO> dreamList = dreamService
				.getAllMyDreamByMemberId(memberId);
		request.setAttribute("dreamList", dreamList);

		return new ModelAndView("member/memberpage");

	}

	// 160617 키워드별 카운트 바인딩 하는 메소드
	public void categoryCountBinding(HttpServletRequest request)
			throws IOException {
		request.setAttribute("designCnt",
				dreamService.getCategoryCountByCategory("디자인"));
		request.setAttribute("fashionCnt",
				dreamService.getCategoryCountByCategory("패션"));
		request.setAttribute("publishCnt",
				dreamService.getCategoryCountByCategory("출판"));
		request.setAttribute("cookingCnt",
				dreamService.getCategoryCountByCategory("요리"));
		request.setAttribute("concertCnt",
				dreamService.getCategoryCountByCategory("공연"));
		request.setAttribute("movieCnt",
				dreamService.getCategoryCountByCategory("영화"));
		request.setAttribute("musicCnt",
				dreamService.getCategoryCountByCategory("음악"));
	}
	
	//160621 
	//updateDream.jsp 로의 경로 설정 및 dreamVO 를 바인딩 하기 위한 메소드 추가\
	
	public ModelAndView update_getDetailDreamByDreamId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		DreamVO dreamVO = dreamService.getDetailDreamByDreamId(dreamId);
		return new ModelAndView("dream/updateDream.jsp", "dreamVO", dreamVO);
	}
	
	//160623 업데이트 등록 수정 완료
	//updateDream 등록.
	public ModelAndView updateDream(HttpServletRequest request,
			HttpServletResponse response, UpdateDreamVO vo) throws Exception {
		
		
		MultipartFile updateFile = vo.getMultipartFile();//업로드한 파일
	/*	if(vo.getMultipartFile()!=null){
			*/
			if(!updateFile.isEmpty()){//파일이 있다.
				/*
				 * orgfilename 받아와서 bvo에 주입
				 * newfilename 방아와서 bvo에 주입
				 */
				vo.setUpdate_orgFilename(updateFile.getOriginalFilename());
				vo.setUpdate_newFilename(System.currentTimeMillis()+"_"+updateFile.getOriginalFilename());
				File desFilee = new File(path+System.currentTimeMillis()+"_"+updateFile.getOriginalFilename());
				updateFile.transferTo(desFilee);
				}
			/*}*/
		DreamVO dreamVO = new DreamVO();
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		dreamVO.setDreamId(dreamId);
		vo.setDreamVO(dreamVO);
		dreamService.updateDream(vo);
		return new ModelAndView("redirect:/dream.do?command=myMoreDream");
	}
		
	public ModelAndView cancelPayment(HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		MemberVO pmvo =(MemberVO)session.getAttribute("mvo");
		if(pmvo==null){
			return new ModelAndView("index");
		}
		int paymentId = Integer.parseInt(request.getParameter("paymentId"));
		int rewardId=  Integer.parseInt(request.getParameter("rewardId"));
		dreamService.cancelPaymentByPaymentId(paymentId);
		dreamService.updatePlusStockByRewardId(rewardId);
		return new ModelAndView("redirect:/dream.do?command=myMoreDream");
	}
	
	//댓글 삭제 160622
	public ModelAndView deleteCommentByReplyId(HttpServletRequest request,HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		int replyId = Integer.parseInt(request.getParameter("replyId"));
		dreamService.deleteCommentByReplyId(replyId);

		return new ModelAndView("redirect:/dream.do?command=getDetailDreamByDreamId&&dreamId="+dreamId);
	}
	//160624 alarm추가
	public ModelAndView alarm(HttpServletRequest request,HttpServletResponse response) throws Exception {
		HttpSession session = request.getSession();
		if(session.getAttribute("mvo")==null){
			return new ModelAndView("JsonView","alarmList",new ArrayList());
		}
		int memberId = ((MemberVO)session.getAttribute("mvo")).getMemberId();
		List<UpdateDreamVO> list = dreamService.alarm(memberId);
		return new ModelAndView("JsonView","alarmList",list);
	}
	
	//160704
	public ModelAndView help3(HttpServletRequest request,HttpServletResponse response) throws Exception {

		int dreamCnt=dreamService.getAllDreamCnt();
		request.setAttribute("dreamCnt", dreamCnt);

		int memberCnt = dreamService.getAllMemberCnt();
		request.setAttribute("memberCnt", memberCnt);
		
		String totalMoney = dreamService.getTotalMoney();
		request.setAttribute("totalMoney", totalMoney);
		
		int successDreamCnt = dreamService.getSuccessDream();
		request.setAttribute("successDreamCnt", successDreamCnt);
		
		return new ModelAndView("help3");
	}
	//160705
	// 다른 사람 응원하거나 진행하는 꿈 보기
	public ModelAndView yourMoreDream(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
	///////////////////후원한 부분/////////////////////////////////////
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		String member_newFilename = request.getParameter("member_newFilename");
		String name = request.getParameter("name");
		String facebookId = request.getParameter("facebookId");
		MemberVO mvo = new MemberVO();
		mvo.setName(name);
		mvo.setMember_newFilename(member_newFilename);
		if(facebookId!=null)
			mvo.setFacebookId(facebookId);
		
		List<MyDreamVO> myDreamList = dreamService
		.getAllYourSupportProject(memberId);
		request.setAttribute("myDreamList", myDreamList);
		// ////////////////////////////////후원 받은(진행하는)/////////////////////////////////////
		List<DreamVO> dreamList = dreamService
		.getAllMyDreamByMemberId(memberId);
		request.setAttribute("dreamList", dreamList);
	
		int countPayment = dreamService.getCountPaymentDreamByMemberId(memberId);
		request.setAttribute("countPayment", countPayment);
		int countCreateDream = dreamService.getCountCreateDreamByMemberId(memberId);
		request.setAttribute("countCreateDream", countCreateDream);
	
		return new ModelAndView("./dream/findmemberdream","rmvo",mvo);
	}
	public ModelAndView disableDreamByMemberId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int memberId = Integer.parseInt(request.getParameter("memberId"));
		dreamService.disableDreamByMemberId(memberId);
		return new ModelAndView("WEB-INF/result/deleteMember_result");//바인딩은 이미 위에서 했다.
	}
	
}
