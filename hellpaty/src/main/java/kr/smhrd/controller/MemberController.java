package kr.smhrd.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import kr.smhrd.dao.MemberDAO;
import kr.smhrd.vo.MemberVO;

@Controller
public class MemberController {
	
	@Autowired
	private MemberDAO memberDAO;

	
	//GET으로 /페이지를 요청하면
    @RequestMapping(value = "/", method = RequestMethod.GET)
    public String login() {
        //VIEW 폴더애 login.jsp 파일을 뷰페이지로 선언
        return "main";
    }
    //body의 값을 매핑하는 용도
    @ResponseBody
    //POST로 Login으로 요청을 할 경우
    @RequestMapping(value = "/login.do", method = RequestMethod.POST)
    //login이라는 메소드명을 가지고 매개변수는 member m, Httpsession session
    public int login(MemberVO m, HttpSession session) {
        //m_dao.Login(m, session)을 호출하고 반환한다.
        return memberDAO.Login(m, session);
    }

/*	  
	  @RequestMapping(value = "/register.do", method = RequestMethod.GET) public
	  String register() { //view안에 있는 register.jsp를 뷰페이지로 지정한다. return
	  "memberLogin"; } //body의 값을 매핑하는 용도
	  
	  @ResponseBody //POST로 /register 페이지로 요청을 할 경우
	  
	  @RequestMapping(value = "/register.do") //메소드 이름이 register 매게변수는 member 자료형의
	  변수명은 m public String register(MemberVO m) { //m_dao.Register(m)의 값을 반환한다.
	  memberDAO.Register(m); return "memberLogin"; }
	 
	// 회원가입정보를 다 입력하고 회원가입 버튼을 누른다. 
	@RequestMapping(value = "/register.do",method = RequestMethod.POST) 
	public ModelAndView Register(MemberVO dto) { 
		ModelAndView mav = new ModelAndView();
		memberDAO.Register(dto);
	 mav.setViewName("memberLogin");
	 return mav; 
	 }// end memberJoinPro()
*/
	
	@RequestMapping("/register.do")
	//
	public String Register(MemberVO vo) {
		//System.out.println(vo.toString());
		memberDAO.Register(vo);
		return "redirect:/main.do";
	}
	
	
	// 로그아웃 관련 페이지
	// /logout으로 GET 방식으로 페이지를 접근하게 된다면
	@RequestMapping(value = "/logout.do", method = RequestMethod.GET)
	// 메소드 이름은 LOGOUT 매게 변수는 SESSION
	public String logout(HttpSession session) {
		// m으로 선언된 세션을 삭제시킨다.
		session.removeAttribute("m");
		// /페이지로 리다이렉트 시킨다.
		return "redirect:/main.do";
	}

}
