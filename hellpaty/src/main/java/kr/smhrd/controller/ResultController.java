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
	public String candidatesResultList(Model model){
		List<CandidatesVO> list = resultDAO.candidateResultList();
		model.addAttribute("rlist",list);
		return "result";
	}
	
    //body의 값을 매핑하는 용도
    //POST로 Login으로 요청을 할 경우
    @RequestMapping(value = "/addResult.do")
    //login이라는 메소드명을 가지고 매개변수는 member m, Httpsession session
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
        //m_dao.Login(m, session)을 호출하고 반환한다.
    }
    
}