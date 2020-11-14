package kr.smhrd.vo;

public class CandidatesVO {
	private int cnumber;
	private String name;
	private String sex;
	private String apply_date;
	private String handwriting_c;
	private String code;
	
	
	public CandidatesVO() {
		super();
	}


	public CandidatesVO(int cnumber, String name, String sex, String apply_date, String handwriting_c, String code) {
		super();
		this.cnumber = cnumber;
		this.name = name;
		this.sex = sex;
		this.apply_date = apply_date;
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


	public String getApply_date() {
		return apply_date;
	}


	public void setApply_date(String apply_date) {
		this.apply_date = apply_date;
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
		return "CandidatesVO [cnumber=" + cnumber + ", name=" + name + ", sex=" + sex + ", apply_date=" + apply_date
				+ ", handwriting_c=" + handwriting_c + ", code=" + code + "]";
	}
	

	
	
}
