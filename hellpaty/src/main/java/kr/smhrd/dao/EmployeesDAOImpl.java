package kr.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.smhrd.vo.EmployeesVO;
import kr.smhrd.vo.SearchCriteria;


@Repository
public class EmployeesDAOImpl implements EmployeesDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Override
	public List<EmployeesVO> employeesList(SearchCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		List<EmployeesVO> list =null;
		try {
			list=session.selectList("eListpage", cri);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int epListCount(SearchCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectOne("epListCount",cri);
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

	@Override
	public void epInsertExcel(List<EmployeesVO> list) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			for(EmployeesVO vo : list) {
			session.insert("epInsertExcel",vo);
			session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}	
		
	}

}
