package kr.smhrd.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

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
	//모달창에 리스트출력
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
	//체크된 명단을 세션에 담기위한 작업
    public int rlogin(CandidatesVO m, HttpSession Hsession) {
    	SqlSession session = sqlSessionFactory.openSession();
    	
            try {
            CandidatesVO m_info = session.selectOne("rlogin", m);
            Hsession.setAttribute("rm", m_info);
        }
        catch (Exception e) {
            e.printStackTrace();
            return -1;
        }
            return 1;
    }
}
