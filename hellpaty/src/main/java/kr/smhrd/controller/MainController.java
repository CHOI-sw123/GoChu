package kr.smhrd.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class MainController {
	@RequestMapping("/main.do")
	public String mainlogin() {
		return "main";
	}
	
	@RequestMapping("/membership.do")
	public String memberShip() {
		return "member";
	}
	
	@RequestMapping("/memberlogin.do")
	public String memberLogin() {
		return "memberLogin";
	}
	@RequestMapping("/result.do")
	public String result() {
		return "result";
	}
	@RequestMapping("/resultDuty.do")
	public String resultDuty() {
		return "resultDuty";
	}
	@RequestMapping("/resultCandidate.do")
	public String resultCandidate() {
		return "resultCandidate";
	}
}
