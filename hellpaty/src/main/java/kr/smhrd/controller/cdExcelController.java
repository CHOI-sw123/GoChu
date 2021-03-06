package kr.smhrd.controller;

import java.util.Iterator;
import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;

import kr.smhrd.dao.cdExcelDAOImpl;
import kr.smhrd.vo.*;


@Controller
public class cdExcelController{
	
	@Autowired
	private cdExcelDAOImpl excelDAOImpl;
	
	@RequestMapping(value = "/cdExcelUp.do", method = RequestMethod.POST)
	//엑셀파일 업로드 컨트롤러
    public String uploadExcelFile(MultipartHttpServletRequest request, Model model) {
    	System.out.println("OK");
		MultipartFile file = null;
        Iterator<String> iterator = request.getFileNames();
        if(iterator.hasNext()) {
            file = request.getFile(iterator.next());
        }
	    //여기있는 기능을 씀
        List<CandidatesVO> list = excelDAOImpl.uploadExcelFile(file);
        
        model.addAttribute("list", list);
	    //jsonview 형태로 반환
        return "jsonView";
    }


}
