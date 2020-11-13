package kr.smhrd.myapp;

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
	public String employeesList(Model model, SearchCriteria cri){
		System.out.println(cri.getPage());
		List<EmployeesVO> list = employeesDAO.employeesList(cri);
		model.addAttribute("elist",list);
		
		PageMaker pageMaker = new PageMaker();
		pageMaker.setCri(cri);
		pageMaker.setTotalCount(employeesDAO.listCount(cri));
		
		model.addAttribute("pageMaker", pageMaker);
		return "employeesList";
	}

	@RequestMapping("/epDown.do")
	public String epDownload() {
		return "epDown";
	}
	
	@RequestMapping("/einsertForm.do")
	public String employeesInsertForm() {
		return "employeesInsert";
	}
	
	@RequestMapping("/einsert.do")
	public String employeesInsert(EmployeesVO vo) {
		//System.out.println(vo.toString());
		employeesDAO.employeesInsert(vo);
		return "redirect:/elist.do";
	}
	
	@RequestMapping("/econtent.do")
	   public String employeesContent(@RequestParam("enumber") int num, Model model) {
	      //System.out.println(aaa);
		EmployeesVO vo = employeesDAO.employeesContent(num);
		model.addAttribute("vo",vo);
	      return "employeesContent";
	   }
	
	@RequestMapping("/edelete.do")
	   public String employeesDelete(@RequestParam("enumber") int num) {
	      //System.out.println(aaa);
		employeesDAO.employeesDelete(num);
	      return "redirect:/elist.do";
	   }
	
	@RequestMapping("/eupdate.do")
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