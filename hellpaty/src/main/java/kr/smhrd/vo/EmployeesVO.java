package kr.smhrd.vo;

public class EmployeesVO {
	private int enumber;
	private String duty;
	private String name;
	private String sex;
	private String code;
	private String handwriting_e;
	private int char_1;
	private int char_2;
	private int char_3;
	private int char_4;
	private int char_5;
	private int char_6;
	private int char_7;
	private int char_8;
	private int char_9;
	private String char_id;
	public EmployeesVO() {
	}
	public EmployeesVO(int enumber, String duty, String name, String sex, String code, String handwriting_e, int char_1,
			int char_2, int char_3, int char_4, int char_5, int char_6, int char_7, int char_8, int char_9,
			String char_id) {
		super();
		this.enumber = enumber;
		this.duty = duty;
		this.name = name;
		this.sex = sex;
		this.code = code;
		this.handwriting_e = handwriting_e;
		this.char_1 = char_1;
		this.char_2 = char_2;
		this.char_3 = char_3;
		this.char_4 = char_4;
		this.char_5 = char_5;
		this.char_6 = char_6;
		this.char_7 = char_7;
		this.char_8 = char_8;
		this.char_9 = char_9;
		this.char_id = char_id;
	}
	public int getEnumber() {
		return enumber;
	}
	public void setEnumber(int enumber) {
		this.enumber = enumber;
	}
	public String getDuty() {
		return duty;
	}
	public void setDuty(String duty) {
		this.duty = duty;
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
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	public String getHandwriting_e() {
		return handwriting_e;
	}
	public void setHandwriting_e(String handwriting_e) {
		this.handwriting_e = handwriting_e;
	}
	public int getChar_1() {
		return char_1;
	}
	public void setChar_1(int char_1) {
		this.char_1 = char_1;
	}
	public int getChar_2() {
		return char_2;
	}
	public void setChar_2(int char_2) {
		this.char_2 = char_2;
	}
	public int getChar_3() {
		return char_3;
	}
	public void setChar_3(int char_3) {
		this.char_3 = char_3;
	}
	public int getChar_4() {
		return char_4;
	}
	public void setChar_4(int char_4) {
		this.char_4 = char_4;
	}
	public int getChar_5() {
		return char_5;
	}
	public void setChar_5(int char_5) {
		this.char_5 = char_5;
	}
	public int getChar_6() {
		return char_6;
	}
	public void setChar_6(int char_6) {
		this.char_6 = char_6;
	}
	public int getChar_7() {
		return char_7;
	}
	public void setChar_7(int char_7) {
		this.char_7 = char_7;
	}
	public int getChar_8() {
		return char_8;
	}
	public void setChar_8(int char_8) {
		this.char_8 = char_8;
	}
	public int getChar_9() {
		return char_9;
	}
	public void setChar_9(int char_9) {
		this.char_9 = char_9;
	}
	public String getChar_id() {
		return char_id;
	}
	public void setChar_id(String char_id) {
		this.char_id = char_id;
	}
	@Override
	public String toString() {
		return "EmployeesVO [enumber=" + enumber + ", duty=" + duty + ", name=" + name + ", sex=" + sex + ", code="
				+ code + ", handwriting_e=" + handwriting_e + ", char_1=" + char_1 + ", char_2=" + char_2 + ", char_3="
				+ char_3 + ", char_4=" + char_4 + ", char_5=" + char_5 + ", char_6=" + char_6 + ", char_7=" + char_7
				+ ", char_8=" + char_8 + ", char_9=" + char_9 + ", char_id=" + char_id + "]";
	}

	
	
	
	
}
