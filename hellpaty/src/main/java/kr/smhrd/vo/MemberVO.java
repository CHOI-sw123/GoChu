package kr.smhrd.vo;

public class MemberVO {
	private String cpuid; 
	private String cpupw; 
	private String code;
	
	public MemberVO() {}
	
	public MemberVO(String cpuid, String cpupw, String code) {
		super();
		this.cpuid = cpuid;
		this.cpupw = cpupw;
		this.code = code;
	}
	public String getCpuid() {
		return cpuid;
	}
	public void setCpuid(String cpuid) {
		this.cpuid = cpuid;
	}
	public String getCpupw() {
		return cpupw;
	}
	public void setCpupw(String cpupw) {
		this.cpupw = cpupw;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	@Override
	public String toString() {
		return "MemberVO [cpuid=" + cpuid + ", cpupw=" + cpupw + ", code=" + code + "]";
	}
	
	
}
