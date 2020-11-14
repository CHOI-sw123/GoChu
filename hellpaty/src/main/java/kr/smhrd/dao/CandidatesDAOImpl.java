package kr.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.smhrd.vo.*;


@Repository
public class CandidatesDAOImpl implements CandidatesDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Override
	public List<CandidatesVO> candidatesList(SearchCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		List<CandidatesVO> list =null;
		try {
			list=session.selectList("cListpage", cri);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	@Override
	public int cdListCount(SearchCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectOne("cdListCount",cri);
	}
	
	@Override
	public int candidatesInsert(CandidatesVO vo) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.insert("candidatesInsert",vo);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}
	
	@Override
	public int candidatesDelete(int num) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			session.delete("candidatesDelete", num);
			session.commit();
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return 0;
	}
	

	@Override
	public void cdInsertExcel(List<CandidatesVO> list) {
		SqlSession session = sqlSessionFactory.openSession();
		try {
			for(CandidatesVO vo : list) {
			session.insert("cdInsertExcel",vo);
			session.commit();
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}	
		
	}

}
