package kr.smhrd.myapp;

import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.smhrd.dao.ExcelDAOImpl;
import kr.smhrd.vo.EmployeesVO;


@Controller
public class ExcelController{
	
	@Autowired
	private ExcelDAOImpl excelDAOImpl;
	
	@RequestMapping(value = "/excelUp.do", method = RequestMethod.POST)
    public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
    	System.out.println("OK");
		MultipartFile file = null;
        Iterator<String> iterator = request.getFileNames();
        if(iterator.hasNext()) {
            file = request.getFile(iterator.next());
        }
        List<EmployeesVO> list = excelDAOImpl.uploadExcelFile(file);
        
        model.addAttribute("list", list);
        return "jsonView";
    }


}
