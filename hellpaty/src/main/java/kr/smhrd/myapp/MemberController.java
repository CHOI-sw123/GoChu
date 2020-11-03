package kr.smhrd.myapp;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import kr.smhrd.model.*;


@Controller
public class MemberController {
	
	@Autowired
	private EmployeesDAO employeesDAO;
	
	@RequestMapping("/list.do")
	public String memberList(Model model) {
		List<EmployeesVO> list = employeesDAO.employeesList();
		model.addAttribute("list",list);
		return "memberList";
	}
	
	@RequestMapping("/insertForm.do")
	public String memberInsertForm() {
		return "member";
	}
	
	@RequestMapping("/insert.do")
	public String memberInsert(EmployeesVO vo) {
		//System.out.println(vo.toString());
		employeesDAO.employeesInsert(vo);
		return "redirect:/list.do";
	}
	
	@RequestMapping("/content.do")
	   public String memberContent(@RequestParam("num") int num, Model model) {
	      //System.out.println(aaa);
		EmployeesVO vo = employeesDAO.employeesContent(num);
		model.addAttribute("vo",vo);
	      return "memberContent";
	   }
	
	@RequestMapping("/delete.do")
	   public String employeesDelete(@RequestParam("num") int num) {
	      //System.out.println(aaa);
		employeesDAO.employeesDelete(num);
	      return "redirect:/list.do";
	   }
	
	@RequestMapping("/update.do")
	   public String employeesUpdate(EmployeesVO vo) {
	      //System.out.println(aaa);
		employeesDAO.employeesUpdate(vo);
	      return "redirect:/list.do";
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