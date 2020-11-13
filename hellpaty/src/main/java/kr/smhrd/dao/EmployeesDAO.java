package kr.smhrd.dao;

import java.util.List;

import kr.smhrd.vo.EmployeesVO;
import kr.smhrd.vo.SearchCriteria;

public interface EmployeesDAO {
public List<EmployeesVO> employeesList(SearchCriteria cri);
public int employeesInsert(EmployeesVO vo);
public EmployeesVO employeesContent(int num);
public int employeesDelete(int num);
public int employeesUpdate(EmployeesVO vo);
public void insertExcel(List<EmployeesVO> list);
public int listCount(SearchCriteria cri);
}