package kr.smhrd.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.dao.*;
import kr.smhrd.vo.*;


@Controller
public class CandidatesController {
	@Autowired
	private CandidatesDAO candidatesDAO;
	
	@RequestMapping("/clist.do")
	public String candidatesList(Model model, SearchCriteria cri){
		System.out.println(cri.getPage());
		List<CandidatesVO> list = candidatesDAO.candidatesList(cri);
		model.addAttribute("clist",list);
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(candidatesDAO.cdListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "candidatesList";
	}

	@RequestMapping("/cdDown.do")
	public String cdDownload() {
		return "cdDown";
	}
	
	@RequestMapping("/cinsertForm.do")
	public String candidatesInsertForm() {
		return "candidatesInsert";
	}
	
	@RequestMapping("/cinsert.do")
	public String candidatesInsert(CandidatesVO vo) {
		//System.out.println(vo.toString());
		candidatesDAO.candidatesInsert(vo);
		return "redirect:/clist.do";
	}
	
	@RequestMapping("/cdelete.do")
	   public String candidatesDelete(@RequestParam("cnumber") int num) {
	      //System.out.println(aaa);
		candidatesDAO.candidatesDelete(num);
	      return "redirect:/clist.do";
	   }
	
//	@RequestMapping(value="/login.do", method=RequestMethod.GET)
//  public String loginProcess() {
//     return "loginForm"; //loginForm.jsp를 만들자
//
//  }
//  @RequestMapping(value="/login.do", method=RequestMethod.POST)
//  public String loginProcess(MemberVO vo) {
//     return "redirect:/list.do";
//  }
//	@RequestMapping(value="/login.do", method=RequestMethod.POST){
//		HttpSession session = request.getSession();
//		return "redirect:/list.do";
//	}
}