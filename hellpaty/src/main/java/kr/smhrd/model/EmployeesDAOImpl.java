package kr.smhrd.model;

import java.util.List;

import javax.websocket.Session;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class EmployeesDAOImpl implements EmployeesDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	
	@Override
	public List<EmployeesVO> employeesList(SearchCriteria scri) {
		SqlSession session = sqlSessionFactory.openSession();
		List<EmployeesVO> list =null;
		try {
			list=session.selectList("employeesList", scri);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int elistCount(SearchCriteria scri) {
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectOne("elistCount",scri);
	}
	
	
	@Override
	public int employeesInsert(EmployeesVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("employeesInsert",vo);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}
	
	@Override
	public EmployeesVO employeesContent(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		EmployeesVO vo = null;
		try {
			vo=session.selectOne("employeesContent", num);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return vo;
	}
	@Override
	public int employeesDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("employeesDelete", num);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}
	
	@Override
	public int employeesUpdate(EmployeesVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.update("employeesUpdate", vo);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}

}
