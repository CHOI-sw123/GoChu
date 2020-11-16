package kr.smhrd.vo;

public class SearchCriteria extends Criteria{
	private String searchType = "";
	private String keyword = "";
	private MemberVO vo;
	
	public SearchCriteria() {
	}
	
	public SearchCriteria(String searchType, String keyword, MemberVO vo) {
		super();
		this.searchType = searchType;
		this.keyword = keyword;
		this.vo = vo;
	}
	
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String searchType) {
		this.searchType = searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String keyword) {
		this.keyword = keyword;
	}
	
	public MemberVO getVo() {
		return vo;
	}
	
	public void setVo(MemberVO vo) {
		this.vo = vo;
	}
	
	@Override
	public String toString() {
		return "SearchCriteria [searchType=" + searchType + ", keyword=" + keyword + ", vo=" + vo + "]";
	}
	 
}
