package kr.smhrd.vo;

public class ResultVO {
	private int cnumber;
	private String name;
	private String sex;
	private String handwriting_c;
	private String code;
	public ResultVO() {
		super();
	}
	public ResultVO(int cnumber, String name, String sex, String handwriting_c, String code) {
		super();
		this.cnumber = cnumber;
		this.name = name;
		this.sex = sex;
		this.handwriting_c = handwriting_c;
		this.code = code;
	}
	public int getCnumber() {
		return cnumber;
	}
	public void setCnumber(int cnumber) {
		this.cnumber = cnumber;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHandwriting_c() {
		return handwriting_c;
	}
	public void setHandwriting_c(String handwriting_c) {
		this.handwriting_c = handwriting_c;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "CandidatesVO [cnumber=" + cnumber + ", name=" + name + ", sex=" + sex + ", handwriting_c="
				+ handwriting_c + ", code=" + code + "]";
	}
	
	
	

	
	
}
