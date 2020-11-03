package kr.smhrd.model;

public class EmployeesVO {
	private String enumber;
	private String deptName;
	private String name;
	private String sex;
	private String entryDate;
	private String code;
	
	public EmployeesVO() {
	}

	public EmployeesVO(String enumber, String deptName, String name, String sex, String entryDate, String code) {
		super();
		this.enumber = enumber;
		this.deptName = deptName;
		this.name = name;
		this.sex = sex;
		this.entryDate = entryDate;
		this.code = code;
	}

	public String getEnumber() {
		return enumber;
	}

	public void setEnumber(String enumber) {
		this.enumber = enumber;
	}

	public String getDeptName() {
		return deptName;
	}

	public void setDeptName(String deptName) {
		this.deptName = deptName;
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

	public String getEntryDate() {
		return entryDate;
	}

	public void setEntryDate(String entryDate) {
		this.entryDate = entryDate;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	@Override
	public String toString() {
		return "EmployeesVO [enumber=" + enumber + ", deptName=" + deptName + ", name=" + name + ", sex=" + sex
				+ ", entryDate=" + entryDate + ", code=" + code + "]";
	}

	
	
}
