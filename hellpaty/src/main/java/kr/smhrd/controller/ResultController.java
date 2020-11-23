package kr.smhrd.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import javax.servlet.http.HttpSession;

import kr.smhrd.dao.*;
import kr.smhrd.vo.*;


@Controller
public class ResultController {
	
	@Autowired
	private ResultDAO resultDAO;
	
	@RequestMapping("/result.do")
	//모달창에 리스트 이름으로 출력하기
	public String candidatesResultList(Model model){
		List<CandidatesVO> list = resultDAO.candidateResultList();
		model.addAttribute("rlist",list);
		return "result";
	}
	
   
    @RequestMapping(value = "/addResult.do")
	//파이썬에 넘길때 session에 담겨 페이지를 끄기전에는 유지되도록하기
    public String rlogin(HttpServletRequest request) {
    	HttpSession session = request.getSession(true);
    	String[] arr=null;
    	    	
    	if(arr.equals(null)) {
    		return "result";
    	}
    	else {
		
    		arr=request.getParameterValues("rlist");
    	session.setAttribute("rm",arr);
    	return "redirect:/result.do";
    	}
       
    }
    
}
