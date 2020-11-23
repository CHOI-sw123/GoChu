package kr.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/main.do")
	//메인으로 들어가기
	public String mainlogin() {
		return "main";
	}
	
	@RequestMapping("/membership.do")
	//회원가입으로 들어가기
	public String memberShip() {
		return "member";
	}
	
	@RequestMapping("/memberlogin.do")
	//로그인으로 들어가기
	public String memberLogin() {
		return "memberLogin";
	}

	@RequestMapping("/resultDuty.do")
	//직무별분석으로 들어가기
	public String resultDuty() {
		return "resultDuty";
	}
	@RequestMapping("/resultCandidate.do")
	//지원자별분석으로 들어가기
	public String resultCandidate() {
		return "resultCandidate";
	}
	@RequestMapping("/resultDetails.do")
	//분석하기 세부정보(따로구현된건없음)
	public String resultDetails() {
		return "resultDetails";
	}
}
/*@RequestMapping("/result.do")
public String result() {
	return "result";
}*/
