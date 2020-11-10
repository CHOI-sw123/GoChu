package kr.smhrd.model;

public class EmployeesVO {
	private int enumber;
	private String dept_name;
	private String name;
	private String sex;
	private String entry_date;
	private String code;
	
	public EmployeesVO() {
	}

	public EmployeesVO(int enumber, String dept_name, String name, String sex, String entry_date, String code) {
		super();
		this.enumber = enumber;
		this.dept_name = dept_name;
		this.name = name;
		this.sex = sex;
		this.entry_date = entry_date;
		this.code = code;
	}

	public int getEnumber() {
		return enumber;
	}

	public void setEnumber(int enumber) {
		this.enumber = enumber;
	}

	public String getDept_name() {
		return dept_name;
	}

	public void setDept_name(String dept_name) {
		this.dept_name = dept_name;
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

	public String getEntry_date() {
		return entry_date;
	}

	public void setEntry_date(String entry_date) {
		this.entry_date = entry_date;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "EmployeesVO [enumber=" + enumber + ", dept_name=" + dept_name + ", name=" + name + ", sex=" + sex
				+ ", entry_date=" + entry_date + ", code=" + code + "]";
	}
	

	
	
}
