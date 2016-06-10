package model;
/**
 * 페이징 처리를 위한 비즈니스 클래스 
 * @author kosta-00-kangsa-001
 *
 */
public class PagingBean {
	/**
	 * 현재 페이지
	 */
	private int nowPage=1;
	/**
	 * 페이지당 보여줄 게시물 수 
	 */
	private int numberOfContentsPerPage
	=CommonConstants.CONTENT_NUMBER_PER_PAGE;
	/**
	 * 페이지 그룹당 페이지 수 
	 */
	private int numberOfPageGroup=CommonConstants.PAGEGROUP_NUMBER_PER_PAGE;
	/**
	 * 현재 db에 저장된 총 게시물 수 
	 */
	private int totalContents;
	/**
	 * db로부터 전체 게시물 수를 받아오고, 현재 페이지는 client 로부터 받아 생성 
	 * @param totalContents
	 * @param nowPage
	 */
	public PagingBean(int totalContents,int nowPage){
		this.totalContents=totalContents;
		this.nowPage=nowPage;
	}
	/**
	 * db로부터 게시물 수 받아오고 , 첫페이지로 생성 
	 * @param totalContents
	 */
	public PagingBean(int totalContents){
		this.totalContents=totalContents;		
	}
	/**
	 * 현재 페이지 리턴
	 * @return
	 */
	public int getNowPage(){
		return nowPage;
	}

	public int getTotalPage(){
		int num=this.totalContents%this.numberOfContentsPerPage;
		int totalPage=0;
		if(num==0){
			totalPage=this.totalContents/this.numberOfContentsPerPage;
		}else{
			totalPage=this.totalContents/this.numberOfContentsPerPage+1;
		}
		return totalPage;
	}

	public int getTotalPageGroup(){
		int num=this.getTotalPage()%this.numberOfPageGroup;
		int totalPageGroup=0;
		if(num==0){
			totalPageGroup=this.getTotalPage()/this.numberOfPageGroup;
		}else{
			totalPageGroup=this.getTotalPage()/this.numberOfPageGroup+1;
		}
		return totalPageGroup;
	}

	public int getNowPageGroup(){
		int num=this.nowPage%this.numberOfPageGroup;
		int nowPageGroup=0;
		if(num==0){
			nowPageGroup=this.nowPage/this.numberOfPageGroup;
		}else{
			nowPageGroup=this.nowPage/this.numberOfPageGroup+1;
		}
		return nowPageGroup;
	}

	public int getStartPageOfPageGroup(){
		int num=this.numberOfPageGroup*(this.getNowPageGroup()-1)+1;
		return num;
	}

	public int getEndPageOfPageGroup(){
		int num=this.getNowPageGroup()*this.numberOfPageGroup;
		if(this.getTotalPage()<num){
			num=this.getTotalPage();
		}
		return num;
	}

	public boolean isPreviousPageGroup(){
		boolean flag=false;
		if(this.getNowPageGroup()>1){
			flag=true;
		}
		return flag;
	}

	public boolean isNextPageGroup(){
		boolean flag=false;
		if(this.getNowPageGroup()<this.getTotalPageGroup()){
			flag=true;
		}
		
		return flag;
	}	
}







