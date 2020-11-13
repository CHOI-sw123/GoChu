package kr.smhrd.vo;

public class Criteria {
	private int page; //현재페이지
	private int perPageNum; //페이지에 나올 내용 갯수
	private int rowStart; //시작페이지
	private int rowEnd; //마지막페이지
	
	public Criteria() {
		this.page = 1; //기본페이지 1
		this.perPageNum = 10; // 한 페이지에 10개 출력
	}
	
	public void setPage(int page) { //내용 0개이하여도 기본 1페이지 
		if (page <= 0) {
			this.page = 1;
			return;
		}
		this.page = page;
	}
	
	public void setPerPageNum(int perPageNum) {
		if (perPageNum <= 0 || perPageNum > 100) {
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPage() {
		return page;
	}
	
	public int getPageStart() {
		return (this.page - 1) * perPageNum;
	}
	
	public int getPerPageNum() {
		return this.perPageNum;
	}
	
	public int getRowStart() {
		rowStart = ((page - 1) * perPageNum) + 1;
		return rowStart;
	}
	
	public int getRowEnd() {
		rowEnd = rowStart + perPageNum - 1;
		return rowEnd;
	}

	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + ", rowStart=" + rowStart + ", rowEnd=" + rowEnd
				+ "]";
	}
}
