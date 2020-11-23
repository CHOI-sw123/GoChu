package kr.smhrd.dao;

import java.util.ArrayList;
import java.util.List;

import org.apache.poi.openxml4j.opc.OPCPackage;
import org.apache.poi.xssf.usermodel.XSSFCell;
import org.apache.poi.xssf.usermodel.XSSFRow;
import org.apache.poi.xssf.usermodel.XSSFSheet;
import org.apache.poi.xssf.usermodel.XSSFWorkbook;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import kr.smhrd.vo.*;

@Service
public class cdExcelDAOImpl {

	@Autowired
	private CandidatesDAO candidatesDAO;

	public List<CandidatesVO> uploadExcelFile(MultipartFile excelFile) {
		List<CandidatesVO> list = new ArrayList<CandidatesVO>();
        try {
            OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
            XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
            
            // 첫번째 시트 불러오기
            XSSFSheet sheet = workbook.getSheetAt(0);
            System.out.println(sheet.getLastRowNum());
            for(int i=1; i<sheet.getLastRowNum(); i++) {
            	CandidatesVO vo = new CandidatesVO();
                XSSFRow row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }
                
                // 행의 첫번째 열받아오기(이름) 
                XSSFCell cell = row.getCell(0);
                if(null != cell) vo.setName(cell.getStringCellValue());
                // 행의 두번째 열 받아오기(성별)
                cell = row.getCell(1);
                if(null != cell) vo.setSex(cell.getStringCellValue());
                // 행의 세번째 열 받아오기(이미지이름)
                cell = row.getCell(2);
                if(null != cell) vo.setHandwriting_c(cell.getStringCellValue());
		    //행의 네번째 열 받아오기(회사코드)
                cell = row.getCell(3);
                if(null != cell) vo.setCode(cell.getStringCellValue());
                list.add(vo);
            }
            candidatesDAO.cdInsertExcel(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
	}
}
