package kr.smhrd.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.dao.*;
import kr.smhrd.vo.EmployeesVO;
import kr.smhrd.vo.PageMaker;
import kr.smhrd.vo.SearchCriteria;


@Controller
public class EmployeesController {
	
	@Autowired
	private EmployeesDAO employeesDAO;
	
	@RequestMapping("/elist.do")
	//현직자 리스트
	public String employeesList(Model model, SearchCriteria cri){
		System.out.println(cri.getPage());
		List<EmployeesVO> list = employeesDAO.employeesList(cri);
		model.addAttribute("elist",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(employeesDAO.epListCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "employeesList";
	}

	@RequestMapping("/epDown.do")
	//엑셀다운로드
	public String epDownload() {
		return "epDown";
	}
	
	@RequestMapping("/einsertForm.do")
	//개별등록
	public String employeesInsertForm() {
		return "employeesInsert";
	}
	
	@RequestMapping("/einsert.do")
	//개별등록
	public String employeesInsert(EmployeesVO vo) {
		//System.out.println(vo.toString());
		employeesDAO.employeesInsert(vo);
		return "redirect:/elist.do";
	}
	
	@RequestMapping("/econtent.do")
	//개인정보수정(따로구현안시킴)
	   public String employeesContent(@RequestParam("enumber") int num, Model model) {
	      //System.out.println(aaa);
		EmployeesVO vo = employeesDAO.employeesContent(num);
		model.addAttribute("vo",vo);
	      return "employeesContent";
	   }
	
	@RequestMapping("/edelete.do")
	//삭제(따로구현안시킴)
	   public String employeesDelete(@RequestParam("enumber") int num) {
	      //System.out.println(aaa);
		employeesDAO.employeesDelete(num);
	      return "redirect:/elist.do";
	   }
	
	@RequestMapping("/eupdate.do")
	//구현안시킨것
	   public String employeesUpdate(EmployeesVO vo) {
	      //System.out.println(aaa);
		employeesDAO.employeesUpdate(vo);
	      return "redirect:/elist.do";
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
