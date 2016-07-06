package model;

import java.util.ArrayList;
import java.util.List;

import model.MyDreamVO;
import model.PagingBean;

/*
 * 페이징 처리에서 사용될 VO임.
 * 서비스 레이어의 VO라 할 수 있다.
 * ::
 * Service Layer에서 1페이지당 게시물을 저장하는 VO 객체
 * 해당 VO 클래스는 특정한 페이지 정보와 /
 * 특정 페이지의 책 리스트 정보를 저장하고 있다.
 * 
 */
public class ListVO {
	private List<MyDreamVO> list;
	private PagingBean pb;
	public ListVO() {
		super();
		// TODO Auto-generated constructor stub
	}
	public ListVO(List<MyDreamVO> list, PagingBean pb) {
		super();
		this.list = list;
		this.pb = pb;
	}
	public List<MyDreamVO> getList() {
		return list;
	}
	public void setList(List<MyDreamVO> list) {
		this.list = list;
	}
	public PagingBean getPb() {
		return pb;
	}
	public void setPb(PagingBean pb) {
		this.pb = pb;
	}
	@Override
	public String toString() {
		return "ListVO [list=" + list + ", pb=" + pb + "]";
	}
}
