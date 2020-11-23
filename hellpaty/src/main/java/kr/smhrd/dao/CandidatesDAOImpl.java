package kr.smhrd.dao;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.smhrd.vo.*;


@Repository
public class CandidatesDAOImpl implements CandidatesDAO {

	@Autowired
	//세션 만들기위한거
	private SqlSessionFactory sqlSessionFactory;
	
	
	@Override
	//리스트 출력
	public List<CandidatesVO> candidatesList(SearchCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		List<CandidatesVO> list =null;
		try {
			//mapper에 있는 select를 사용해서 검색,페이징,리스트가 한번에 기능구현됨
			list=session.selectList("cListpage", cri);
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			session.close();
		}
		return list;
	}
	
	@Override
	//페이징의 숫자를 표기하기위한 mapper연결
	public int cdListCount(SearchCriteria cri) {
		SqlSession session = sqlSessionFactory.openSession();
		return session.selectOne("cdListCount",cri);
	}
	
	@Override
	//개별등록
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
	//삭제(기능구현안됨)
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
	//엑셀 리스트 뽑기
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
