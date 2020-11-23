package kr.smhrd.controller;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.dao.*;
import kr.smhrd.vo.*;

//@컨트롤러 반드시 작성해줘야함(연동매개체)
@Controller
public class CandidatesController {
	//@Autowired 작성 안하면 연결안됨
	@Autowired
	private CandidatesDAO candidatesDAO;
	//지원자리스트에서 지원자 전체 보는것
	@RequestMapping("/clist.do") //
	public String candidatesList(Model model, SearchCriteria cri){
		System.out.println(cri.getPage());
		//메퍼와 Mapper와 연결되어있는 DAO를 사용
		List<CandidatesVO> list = candidatesDAO.candidatesList(cri);
		//clist로 어디에 사용할지 활용가능(키,값)
		model.addAttribute("clist",list);
		//리스트 총수에 맞춰서 페이지수가 나타남
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(candidatesDAO.cdListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		//myapp/candidatesList.jsp 형태로 변형되어 리턴
		return "candidatesList";
	}

	@RequestMapping("/cdDown.do")
	//엑셀 다운로드 do로 jsp >> excel로 변형되서 다운로드됨
	public String cdDownload() {
		return "cdDown";
	}
	
	@RequestMapping("/cinsertForm.do")
	//개별등록
	public String candidatesInsertForm() {
		return "candidatesInsert";
	}
	
	@RequestMapping("/cinsert.do")
	//개별등록
	public String candidatesInsert(CandidatesVO vo) {
		//System.out.println(vo.toString());
		candidatesDAO.candidatesInsert(vo);
		return "redirect:/clist.do";
	}
	
	@RequestMapping("/cdelete.do")
	//삭제하기(따로구현은안시켰음)
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
