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
		System.out.println("requestDream GO!!");
		// DreamVO pvo = new DreamVO(0, null, request.getParameter("category"),
		// " ", request.getParameter("titleDream"),
		// request.getParameter("detailDream"), "",
		// Integer.parseInt(request.getParameter("targetFund")),
		// request.getParameter("startDate"), request.getParameter("endDate"));
		// 1. 업로드된 파일명을 받아온다.
		// pvo.setMultipartFile(multipartFile);
		MultipartFile mFile = pvo.getMultipartFile();
		System.out.println("MultipartFile :: " + mFile);

		// 2. 업도드된 파일이 있다면..
		if (!mFile.isEmpty()) {// 비어있지 않다.
			System.out.println("getOriginalFilename :: "
					+ mFile.getOriginalFilename());
			System.out.println("File : Form getName() - " + mFile.getName());

			// 3.
			String orgfilename = mFile.getOriginalFilename();
			String newfilename = System.currentTimeMillis() + "_" + orgfilename;

			pvo.setDream_orgFilename(orgfilename);
			pvo.setDream_newFilename(newfilename);

			File desFile = new File(path + newfilename);
			mFile.transferTo(desFile);

			System.out.println("desFile : " + desFile);
			System.out.println("path L " + path);

		}

		System.out.println("꿈 신청 Go");
		HttpSession session = request.getSession();
		MemberVO rmvo = (MemberVO) session.getAttribute("mvo");
		pvo.setMemberVO(rmvo);// 세션 값 주입

		System.out.println("1" + pvo);
		dreamService.requestDream(pvo);
		System.out.println("2" + pvo);
		String[] rewardInfoArr = request.getParameterValues("rewardInfo");
		String[] rewardGuideArr = request.getParameterValues("rewardGuide");
		String[] stockArr = request.getParameterValues("stock");

		for (String rewardInfo : rewardInfoArr)
			System.out.println("rewardInfo :: " + rewardInfo);
		for (String rewardGuide : rewardGuideArr)
			System.out.println("rewardGuide :: " + rewardGuide);
		for (String stock : stockArr)
			System.out.println("stock :: " + stock);
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

	/*
	 * //보상 등록 public ModelAndView registerReward(HttpServletRequest
	 * request,HttpServletResponse response, RewardVO pvo) throws Exception{
	 * System.out.println("registerReward GO!!");
	 * System.out.println("RewardVO :: "+pvo);
	 * 
	 * DreamVO dreamVO = new DreamVO();
	 * 
	 * 
	 * dreamVO.setDreamId(Integer.parseInt(request.getParameter("dreamId")));
	 * 
	 * pvo.setDreamVO(dreamVO);
	 * 
	 * dreamService.registerReward(pvo);
	 * 
	 * return new ModelAndView("index"); }
	 */

	 // 꿈 목록 (160617 내용수정) // (160624) 내용수정 :: startDate 가 현재 같거나 적을때 리스트 출력
	public ModelAndView getAllListDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String filter = request.getParameter("filter");
		if (filter == null) {
			filter = "1";
		}
		List<DreamVO> dList = dreamService.getListDream(filter);
		List<DreamVO> dreamList = new ArrayList<DreamVO>();
		long startDate =0;
		for(int i =0 ; i<dList.size(); i++){
			startDate = dreamService.convert(dList.get(i).getStartDate());
			System.out.println("requestDate ::"+startDate+"||today :: "+dreamService.showNowDate());
			if(startDate<=dreamService.showNowDate()){
				dreamList.add(dList.get(i));
			}
		}
		List<DreamVO> recentProjects = dreamService.getListDream("1");
		request.setAttribute("recentProjects", recentProjects);
		List<DreamVO> popularProjects = dreamService.getListDream("3");
		request.setAttribute("popularProjects", popularProjects);
		System.out.println(dreamList);
		request.setAttribute("totalCnt", dreamList.size());

		String category = request.getParameter("category");
		if (category != null && !(category.equals(""))
				&& !(category.equals("none"))) {
			System.out.println("getListFilterByCategory()");
			dreamList = dreamService.getListFilterByCategory(dreamList,
					category.trim());
		}
		// 160617 메소드로 대체
		this.categoryCountBinding(request);
		request.setAttribute("category", category);
		request.setAttribute("filter", filter);
		String keyword = request.getParameter("keyword");
		if ((keyword != null) && !(keyword.equals(""))) {
			dreamList = dreamService.selectByKeyWord(keyword);
			dreamService.listDetailInsert(dreamList);
			request.setAttribute("keyword", keyword);
		}
		System.out.println(dreamList);
		return new ModelAndView("./dream/finddream", "dreamList", dreamList);
	}

	// 관리자 꿈 목록 보기
	public ModelAndView getAllListDreamForAdmin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<DreamVO> adminDreamList = dreamService.getAllListDreamForAdmin();

		System.out.println(adminDreamList);
		return new ModelAndView("./admin/admindreampage", "adminDreamList",
                adminDreamList);
	}

	// 카테고리 검색
	public ModelAndView selectByCategory(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String category = request.getParameter("category");
		System.out.println(category);
		List<DreamVO> list = dreamService.selectByCategory(category);
		System.out.println(list);
		return new ModelAndView("./test/selectByCategory", "list", list);
	}

	// Admin 꿈 승인하기
	public ModelAndView confirmRequestDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		String confirmRequestDream = request
				.getParameter("confirmRequestDream");
		System.out.println("confirmRequestDream() :: " + dreamId + " "
				+ confirmRequestDream);

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
		System.out.println("상세보기에서 dreamId ::" + dreamId);
		DreamVO dreamVO = dreamService.getDetailDreamByDreamId(dreamId);
		MemberVO memberVO = dreamService.getMemberByDream(dreamId);
		dreamVO.setMemberVO(memberVO);

		System.out.println("dreamVO :: " + dreamVO);

		// //////////////////////////////////////////////////////////////////////////////
		System.out.println("업데이트");
		List<UpdateDreamVO> updateDreamList = dreamService
				.updateDreamFindByDreamId(dreamId);
		System.out.println(updateDreamList);
		request.setAttribute("updateDreamList", updateDreamList);

		// /////////////////////////////////////////////////////////////////////////////////
		System.out.println("댓글");
		List<ReplyVO> replyList = dreamService.readComment(dreamId);
		System.out.println(replyList);
		request.setAttribute("replyList", replyList);

		// //////////////////////////////////////////////////////////////////////
		// 후원자 가져오기 :: getPaymentMemeberByDreamId
		System.out.println("getPaymentMemeberByDreamId");
		List<MemberVO> memberList = dreamService
				.getPaymentMemberByDreamId(dreamId);
		System.out.println("후원자 :: " + memberList);
		request.setAttribute("memberList", memberList);

		// 댓글 작성 160615
		// 후원자 여부 체크
		
		HttpSession session = request.getSession();
		MemberVO member = (MemberVO) session.getAttribute("mvo"); // 세션에 있는 mvo를
																	// 가져옴

		if (member != null) { // 로그인 상태
			System.out.println("MVO : " + member.getMemberId());

			boolean is_dreamMaker;
			for (MemberVO vo : memberList) {

				System.out.println("vo.memberId() : " + vo.getMemberId());
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
				System.out.println(is_dreamMaker);
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
		System.out.println("getRewardByDreamId ::" + dreamId);
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
		System.out.println("댓글 작성 dreamId : " + dreamId);
		System.out.println("컨텐츠 작성 : " + content);

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

		String num = "1";
		List<DreamVO> dreamList = new ArrayList<DreamVO>();
		List<DreamVO> dList = dreamService.getListDream(num);
		long startDate =0;
		for(int i =0 ; i<dList.size(); i++){
			startDate = dreamService.convert(dList.get(i).getStartDate());
			System.out.println("requestDate ::"+startDate+"||today :: "+dreamService.showNowDate());
			if(startDate<=dreamService.showNowDate()){
				dreamList.add(dList.get(i));
			}
		}
		System.out.println(dreamList);
		return new ModelAndView("index", "dreamList", dreamList);
	}
	// /////////////////////// 160617 후원한 && 받은 내역
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
		System.out.println(memberId);
		List<MyDreamVO> myDreamList = dreamService
				.getAllMySupportProject(memberId);
		System.out.println(myDreamList);
		request.setAttribute("myDreamList", myDreamList);

		// ////////////////////////////////후원
		// 받은/////////////////////////////////////
		List<DreamVO> dreamList = dreamService
				.getAllMyDreamByMemberId(memberId);
		System.out.println(dreamList);
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
		System.out.println("상세보기에서 dreamId ::" + dreamId);
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
			System.out.println("업데이트 드림 업로드된 뉴파일 명 : "+updateFile.getOriginalFilename());
			if(!updateFile.isEmpty()){//파일이 있다.
				/*
				 * orgfilename 받아와서 bvo에 주입
				 * newfilename 방아와서 bvo에 주입
				 */
				vo.setUpdate_orgFilename(updateFile.getOriginalFilename());
				vo.setUpdate_newFilename(System.currentTimeMillis()+"_"+updateFile.getOriginalFilename());
				System.out.println(vo.getUpdate_newFilename()+"//"+vo.getUpdate_orgFilename());
				File desFilee = new File(path+System.currentTimeMillis()+"_"+updateFile.getOriginalFilename());
				updateFile.transferTo(desFilee);
				}
			/*}*/
		DreamVO dreamVO = new DreamVO();
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		System.out.println("dreamId ::"+dreamId);
		dreamVO.setDreamId(dreamId);
		System.out.println(vo.getUpdate_detailDream());
		vo.setDreamVO(dreamVO);
		System.out.println(vo);
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
		System.out.println(dreamId +","+replyId);
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
		System.out.println(dreamCnt);
		request.setAttribute("dreamCnt", dreamCnt);

		int memberCnt = dreamService.getAllMemberCnt();
		System.out.println("memberCnt :: " + memberCnt);
		request.setAttribute("memberCnt", memberCnt);
		
		String totalMoney = dreamService.getTotalMoney();
		System.out.println("totalMoney :: "+totalMoney);
		request.setAttribute("totalMoney", totalMoney);
		
		int successDreamCnt = dreamService.getSuccessDream();
		System.out.println("successDreamCnt"+successDreamCnt);
		request.setAttribute("successDreamCnt", successDreamCnt);
		
		return new ModelAndView("help3");
	}
	//160705
	// 다른 사람 응원하거나 진행하는 꿈 보기
	public ModelAndView yourMoreDream(HttpServletRequest request,
	HttpServletResponse response) throws Exception {
	///////////////////후원한 부분/////////////////////////////////////
	int memberId = Integer.parseInt(request.getParameter("memberId"));
	System.out.println("yourMoreDream::"+memberId);
	String member_newFilename = request.getParameter("member_newFilename");
	String name = request.getParameter("name");
	MemberVO mvo = new MemberVO();
	mvo.setName(name);
	mvo.setMember_newFilename(member_newFilename);
	List<MyDreamVO> myDreamList = dreamService
	.getAllMySupportProject(memberId);
	System.out.println(myDreamList);
	request.setAttribute("myDreamList", myDreamList);
	// ////////////////////////////////후원 받은(진행하는)/////////////////////////////////////
	List<DreamVO> dreamList = dreamService
	.getAllMyDreamByMemberId(memberId);
	System.out.println(dreamList);
	request.setAttribute("dreamList", dreamList);

	int countPayment = dreamService.getCountPaymentDreamByMemberId(memberId);
	request.setAttribute("countPayment", countPayment);
	int countCreateDream = dreamService.getCountCreateDreamByMemberId(memberId);
	request.setAttribute("countCreateDream", countCreateDream);

	return new ModelAndView("./dream/findmemberdream","rmvo",mvo);
	}

}
