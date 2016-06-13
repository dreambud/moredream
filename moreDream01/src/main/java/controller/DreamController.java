package controller;

import java.io.File;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import model.DreamVO;
import model.MemberVO;
import model.RewardVO;

import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.multiaction.MultiActionController;

import dao.DreamService;
/*
 * DreamController 주석 추가
 */
public class DreamController extends MultiActionController{
	
	private DreamService dreamService;
	private String path;

	public void setPath(String path) {
		this.path = path;
	}
	
	public void setDreamService(DreamService dreamService) {
		this.dreamService = dreamService;
	}
	
	//꿈 신청
	   public ModelAndView requestDream(HttpServletRequest request,HttpServletResponse response, HttpSession session, DreamVO pvo)
			throws Exception{
		System.out.println("requestDream GO!!");

		// 1. 업로드된 파일명을 받아온다.
		MultipartFile mFile = pvo.getMultipartFile();
		System.out.println("MultipartFile :: " + mFile);

		//2. 업도드된 파일이 있다면..
		if(!mFile.isEmpty()){//비어있지 않다.
			System.out.println("getOriginalFilename :: "+ mFile.getOriginalFilename());
			System.out.println("File : Form getName() - " + mFile.getName());

			//3. 
			String orgfilename = mFile.getOriginalFilename();
			String newfilename = System.currentTimeMillis()+"_"+orgfilename;

			pvo.setDream_orgFilename(orgfilename);
			pvo.setDream_newFilename(newfilename);


			File desFile = new File(path+newfilename);
			mFile.transferTo(desFile);

			System.out.println("desFile : " + desFile);
			System.out.println("path L " + path);

		}

		System.out.println("꿈 신청 Go");
		
		MemberVO rmvo =   (MemberVO) session.getAttribute("mvo");
		pvo.setMemberVO(rmvo);//세션 값 주입
		
		System.out.println("1"+pvo);
		dreamService.requestDream(pvo);
		System.out.println("2"+pvo);
		
		
		return new ModelAndView("registerReward", "dreamId", pvo.getDreamId());
	}
	
	//보상 등록
	public ModelAndView registerReward(HttpServletRequest request,HttpServletResponse response, RewardVO pvo)
			throws Exception{
		System.out.println("registerReward GO!!");
		System.out.println("RewardVO :: "+pvo);
		
		DreamVO dreamVO = new DreamVO();
		
		
		dreamVO.setDreamId(Integer.parseInt(request.getParameter("dreamId")));
		
		pvo.setDreamVO(dreamVO);
		
		dreamService.registerReward(pvo);
		
		return new ModelAndView("index");
	}
	
	
	
	//꿈 목록
	public ModelAndView getAllListDream(HttpServletRequest request,HttpServletResponse response)
			throws Exception{
				String num = request.getParameter("filter");
				if(num==null){
					num = "1";
				}
				List<DreamVO> dreamList = dreamService.getListDream(num);
				System.out.println(dreamList);
				return new ModelAndView("./finddream", "dreamList", dreamList);
	}
	
	//관리자 꿈 목록 보기
	public ModelAndView getAllListDreamForAdmin(HttpServletRequest request,HttpServletResponse response)
			throws Exception{
					
			List<DreamVO> adminDreamList = dreamService.getAllListDreamForAdmin();
			
			System.out.println(adminDreamList);
			return new ModelAndView("./admindreampage", "adminDreamList", adminDreamList);
	}
	
	//카테고리 검색
	public ModelAndView selectByCategory(HttpServletRequest request,HttpServletResponse response)
	throws Exception{
		String category = request.getParameter("category");
		System.out.println(category);
		List<DreamVO> list = dreamService.selectByCategory(category);
		System.out.println(list);
		return new ModelAndView("./test/selectByCategory", "list", list);
	}
	
	// Admin 꿈 승인하기
	public ModelAndView confirmRequestDream(HttpServletRequest request,HttpServletResponse response)
			throws Exception{
				int dreamId = Integer.parseInt(request.getParameter("dreamId"));
				String confirmRequestDream = request.getParameter("confirmRequestDream");
				System.out.println("confirmRequestDream() :: "+dreamId + " "+confirmRequestDream);
				
				Map<String, Object> map = new HashMap<String, Object>();
				map.put("dreamId", dreamId);
				map.put("confirm", confirmRequestDream);
				
				dreamService.confirmRequestDream(map);
				
				return new ModelAndView("redirect:/dream.do?command=getAllListDreamForAdmin");
			}
}
