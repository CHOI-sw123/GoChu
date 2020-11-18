package kr.smhrd.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.smhrd.vo.*;


@Repository
public class ResultDAOImpl implements ResultDAO {

	@Autowired
	private SqlSessionFactory sqlSessionFactory;
	@Override
	public List<CandidatesVO> candidateResultList() {
		SqlSession session = sqlSessionFactory.openSession();
		List<CandidatesVO> list =null;
		try {
			list=session.selectList("candidateResultList",list);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
}
