package controller;

import java.io.File;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DreamVO;
import model.MemberVO;
import model.PaymentVO;
import model.ReplyVO;
import model.RewardVO;
import model.UpdateDreamVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import dao.DreamService;

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
			HttpServletResponse response, HttpSession session, DreamVO pvo)
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

	// 꿈 목록 (160616 내용수정)
	public ModelAndView getAllListDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		String num = request.getParameter("filter");
		if (num == null) {
			num = "1";
		}
		List<DreamVO> dreamList = dreamService.getListDream(num);
		List<DreamVO> recentProjects = dreamService.getListDream("1");
		request.setAttribute("recentProjects", recentProjects);
		List<DreamVO> popularProjects = dreamService.getListDream("3");
		request.setAttribute("popularProjects", popularProjects);
		System.out.println(dreamList);
		return new ModelAndView("./finddream", "dreamList", dreamList);
	}

	// 관리자 꿈 목록 보기
	public ModelAndView getAllListDreamForAdmin(HttpServletRequest request,
			HttpServletResponse response) throws Exception {

		List<DreamVO> adminDreamList = dreamService.getAllListDreamForAdmin();

		System.out.println(adminDreamList);
		return new ModelAndView("./admindreampage", "adminDreamList",
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
			HttpServletResponse response, HttpSession session) throws Exception {
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

		return new ModelAndView("dreamdetails", "dreamVO", dreamVO);
	}

	// 추가160615
	// 응원하기 클릭 후 선택할 보상 리스트 가져오기
	public ModelAndView getRewardByDreamId(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		System.out.println("getRewardByDreamId ::" + dreamId);
		List<RewardVO> rewardList = dreamService.getRewardByDreamId(dreamId);

		return new ModelAndView("payment", "rewardList", rewardList);
	}

	// 결제하기
	public ModelAndView payment(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		String[] rId = request.getParameter("rewardId").split("_");
		int rewardId = Integer.parseInt(rId[0]);
		int money = Integer.parseInt(request.getParameter("money"));
		RewardVO rvo = new RewardVO();
		rvo.setRewardId(rewardId);
		session.getAttribute("mvo");
		PaymentVO ppvo = new PaymentVO(0, rvo,
				((MemberVO) session.getAttribute("mvo")).getMemberId(), "Y",
				money);

		dreamService.payment(ppvo);

		return new ModelAndView("WEB-INF/result/payment_result");
	}

	// 160616
	// /댓글 작성 :: writeComment

	public ModelAndView writeComment(HttpServletRequest request,
			HttpServletResponse response, HttpSession session) throws Exception {

		int dreamId = Integer.parseInt(request.getParameter("dreamId"));
		String content = request.getParameter("content");
		System.out.println("댓글 작성 dreamId : " + dreamId);
		System.out.println("컨텐츠 작성 : " + content);

		DreamVO dreamVO = new DreamVO();
		dreamVO.setDreamId(dreamId);// dreamVO.dreamId

		MemberVO memberVO = (MemberVO) session.getAttribute("mvo");// memberVO.memberId

		ReplyVO replyVO = new ReplyVO(0, dreamVO, memberVO, content, null);

		dreamService.writeComment(replyVO);// 댓글 작성

		return new ModelAndView(
				"redirect:/dream.do?command=getDetailDreamByDreamId&&dreamId="
						+ dreamId);
	}
	
	// index 최근 꿈 배너
	
	public ModelAndView recentDream(HttpServletRequest request,
			HttpServletResponse response) throws Exception {
	
		String num = "1";
	
		List<DreamVO> dreamList = dreamService.getListDream(num);
		System.out.println(dreamList);
		return new ModelAndView("index", "dreamList", dreamList);
	}
	
}
