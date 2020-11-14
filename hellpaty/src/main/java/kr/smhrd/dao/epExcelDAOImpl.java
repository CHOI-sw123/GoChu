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

import kr.smhrd.vo.EmployeesVO;

@Service
public class epExcelDAOImpl {

	@Autowired
	private EmployeesDAO employeesDAO;

	public List<EmployeesVO> uploadExcelFile(MultipartFile excelFile) {
		List<EmployeesVO> list = new ArrayList<EmployeesVO>();
        try {
            OPCPackage opcPackage = OPCPackage.open(excelFile.getInputStream());
            XSSFWorkbook workbook = new XSSFWorkbook(opcPackage);
            
            // 첫번째 시트 불러오기
            XSSFSheet sheet = workbook.getSheetAt(0);
            System.out.println(sheet.getLastRowNum());
            for(int i=1; i<sheet.getLastRowNum(); i++) {
            	EmployeesVO vo = new EmployeesVO();
                XSSFRow row = sheet.getRow(i);
                
                // 행이 존재하기 않으면 패스
                if(null == row) {
                    continue;
                }
                
                // 행의 첫번째 열 
                XSSFCell cell = row.getCell(0);
                if(null != cell) vo.setDept_name(cell.getStringCellValue());
                // 행의 두번째 열 받아오기
                cell = row.getCell(1);
                if(null != cell) vo.setName(cell.getStringCellValue());
                // 행의 세번째 열 받아오기
                cell = row.getCell(2);
                if(null != cell) vo.setSex(cell.getStringCellValue());
                cell = row.getCell(3);
                if(null != cell) vo.setEntry_date(cell.getStringCellValue());
                cell = row.getCell(4);
                if(null != cell) vo.setCode(cell.getStringCellValue());
                list.add(vo);
            }
            employeesDAO.epInsertExcel(list);
        } catch (Exception e) {
            e.printStackTrace();
        }
        return list;
	}
}
