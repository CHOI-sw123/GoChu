package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.dao.*;
import kr.smhrd.vo.*;


@Controller
public class ResultController {
	
	@Autowired
	private ResultDAO resultDAO;
	
	@RequestMapping("/result.do")
	public String candidatesResultList(Model model){
		List<CandidatesVO> list = resultDAO.candidateResultList();
		model.addAttribute("rlist",list);
		return "result";
	}
}