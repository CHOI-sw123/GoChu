package kr.smhrd.model;

import java.util.List;

public interface EmployeesDAO {
public List<EmployeesVO> employeesList();
public List<EmployeesVO> candidatesList();
public int employeesInsert(EmployeesVO vo);
public EmployeesVO employeesContent(int num);
public int employeesDelete(int num);
public int employeesUpdate(EmployeesVO vo);
}
